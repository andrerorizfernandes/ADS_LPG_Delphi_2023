unit uFuncoes;

interface

uses
  FireDAC.Comp.Client, Winapi.Windows, Vcl.DBGrids, Vcl.Grids, uTipoOperacao;

const
  NOME_SISTEMA = 'ERP de vendas';

type
  TOperacaoDaQuery = (topAbrir, topFechar);

procedure AtivarQuery(const pQuery: TFDQuery; const pTipoOperacaoDaQuery: TOperacaoDaQuery);
procedure Alerta(Mensagem: string);
procedure Informacao(Mensagem: string);
procedure Erro(Mensagem : string);
procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn;State: TGridDrawState);
procedure ExportarDBGrid(DBGrid: TDBGrid; LimitePorArquivo: Integer = 50000);

function Pergunta(Pergunta: string): Boolean;
function RetornaTipoDeOperacaoDaQuery(const pQuery: TFDQuery): TTipoOperacao;
function DataValida(Data:string):Boolean;
Function SomenteNum(Texto: String): String;

implementation

uses
  Vcl.Forms, Data.DB, Vcl.Graphics, Vcl.Controls, System.Win.ComObj,
  System.Variants, System.SysUtils, System.StrUtils;

procedure AtivarQuery(const pQuery: TFDQuery; const pTipoOperacaoDaQuery: TOperacaoDaQuery);
begin
  case pTipoOperacaoDaQuery of
    topAbrir: pQuery.Open;
    topFechar: pQuery.Close;
  end;
end;

procedure Alerta(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOME_SISTEMA), MB_ICONWARNING);
end;

Procedure Informacao(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOME_SISTEMA), MB_ICONINFORMATION);
end;

procedure Erro(Mensagem : string);
begin
  Application.MessageBox(Pchar(Mensagem), PWideChar(NOME_SISTEMA), MB_OK + MB_ICONERROR);
end;

function Pergunta(Pergunta: string): Boolean;
begin
  if Application.MessageBox(PChar(Pergunta), PWideChar(NOME_SISTEMA), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Result := True
  else
    Result := False;
end;

procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn; State: TGridDrawState);
begin
  if not (DataSet as TDataSet).Active  then Exit;
  if     (DataSet as TDataSet).IsEmpty then Exit;

  if not Odd((DataSet as TDataSet).RecNo) then // se for ímpar
  // se a célula não está selecionada
    if not (gdSelected in State) then
    begin
      // define a cor de fundo
      (Sender as TDBGrid).Canvas.Brush.Color := cl3DLight;
      (Sender as TDBGrid).Canvas.FillRect(Rect);//pinta a célula
      // pinta o texto padrão
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end
    else
    begin
      // define a cor de fundo
      (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
      (Sender as TDBGrid).Canvas.FillRect(Rect);//pinta a célula
      // pinta o texto padrão
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end
    else
    if (gdSelected in State) then
    begin
      // define a cor de fundo
      (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
      (Sender as TDBGrid).Canvas.FillRect(Rect);//pinta a célula
      // pinta o texto padrão
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end;
end;

function RetornaTipoDeOperacaoDaQuery(const pQuery: TFDQuery): TTipoOperacao;
begin
  case pQuery.State of
    dsBrowse: Result := topNavegar;
    dsEdit: Result := topEditar;
    dsInsert: Result := topInserir
    else
      Result := topNenhum;
  end;
end;

Function SomenteNum(Texto: String): String;
var
  Resultado: String;
  i: integer;
  Caracteres: TSysCharSet;
begin
  Resultado:= '';
  Caracteres:= ['0'..'9'];

  for i := 1 to Length(Texto) do
    if CharInSet(Texto[i], Caracteres)then
      Resultado:= Resultado + Texto[i];

  Result := Resultado;
end;

function DataValida(Data:string):Boolean;
var
  Dia,Mes:Byte;
  Ano:Integer;

  function AnoBissesto(Year: Integer): boolean;
  begin
    AnoBissesto := (ano mod 4=0) and ( ano mod 100 <> 0) or (ano Mod 400 =0);
  end;

begin
  Result:=False;
  if length(Trim(Data)) = 10 then
  begin
    if Copy(Data,3,1) <> '/' then Exit;
    if Copy(Data,6,1) <> '/' then Exit;

    Dia := StrToIntDef(SomenteNum(Copy(Data,1,2)),0);

    if Dia < 1 then Exit;
    if Dia > 31 then Exit;

    Mes:=StrToIntDef(SomenteNum(Copy(Data,4,2)),0);

    if Mes < 1 then Exit;
    if Mes > 12 then Exit;

    Ano:=StrToInt(SomenteNum(Copy(Data,7,2)));

    if Ano = 0 then Exit;

    if ( (Mes in [1,3,5,7,8,10,12]) and (Dia in [1..31]) ) or
       ( (Mes in [4,6,9,11]) and (Dia in [1..30])        ) or
       ( (Mes = 2) and  (     AnoBissesto(Ano))  and  (Dia in [1..29]) )  or
       ( (Mes = 2) and  (not  AnoBissesto(Ano))  and  (Dia in [1..28]) )
    then
    Result:=True;
  end;
end;

procedure ExportarDBGrid(DBGrid: TDBGrid; LimitePorArquivo: Integer = 50000);
const
  xlWBATWorksheet = -4167;
  //Caracteres : TArray<String> = ['0'..'9', '%', '.', '='];
  Caracteres  = ['0'..'9', '%', '.', '='];
var
  bm: TBookmark;
  col, row, zera: Integer;
  DataSet :  TDataSet;
  Form : TForm;
  ExcelApp: Variant;
  letraIni : AnsiChar;
begin
  DataSet := DBGrid.DataSource.DataSet;
  if (not DataSet.Active) then
  begin
    Alerta('Não há registros a serem exportados.');
    Exit;
  end;

  if (DataSet.RecordCount = 0) then
  begin
    Alerta('Não há registros a serem exportados.');
    Exit;
  end;

  try
    Form := Screen.ActiveForm;
    Form.Hide;

    Application.ProcessMessages;
    Screen.Cursor := crHourglass;
    DataSet.DisableControls;
    bm := DataSet.Bookmark;
    DataSet.First;

    Application.ProcessMessages;

    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Exportacao';

    Zera := 0;

    DataSet.First;
    for row := 0 to DataSet.RecordCount - 1 do
    begin
      //Dividindo em varios arquivos
      if (row - Zera) = LimitePorArquivo then
      begin
        for col := 0 to DBGrid.Columns.Count -1 do
          ExcelApp.cells[1,col+1] := DBGrid.Columns[Col].Title.Caption;

        col := DBGrid.Columns.Count -1;
        repeat
          if not DBGrid.Columns.Items[col].Visible then
            ExcelApp.ActiveSheet.Columns[col+1].Delete;
          col := col -1;
        until(col = -1);

        ExcelApp.Columns.HorizontalAlignment := 2;
        ExcelApp.Columns.AutoFit;
        ExcelApp.Rows[1].Font.Bold := True;
        ExcelApp.Visible := true;

        ExcelApp := Unassigned;

        ExcelApp := CreateOleObject('Excel.Application');
        ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
        ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Exportacao';

        Zera := Zera + LimitePorArquivo;
      end;
      //frmProgresso.lblTotal.Caption := IntToStr(row)+ ' de ' +IntToStr(DataSet.RecordCount)+ ' Registros';

      Application.ProcessMessages;

      for col := 1 to DBGrid.Columns.Count do
      begin
        if DBGrid.Columns.Items[col-1].Visible then
        begin
          if TrimLeft(DBGrid.Columns[col - 1].Field.AsString) <> '' then
          begin
            letraIni := ANSIChar(LeftStr(TrimLeft(DBGrid.Fields[col - 1].AsString),1)[1]);

            if CharInSet(letraIni,Caracteres) or DataValida(TrimLeft(DBGrid.Columns[col - 1].Field.AsString)) then
                ExcelApp.cells[row + 2 - Zera,col].NumberFormat := '@';
          end;
          ExcelApp.cells[row + 2 - Zera,col] := TrimLeft(DBGrid.Columns[col - 1].Field.AsString);
        end;
      end;
      DataSet.Next;
    end;

    for col := 0 to DBGrid.Columns.Count -1 do
      ExcelApp.cells[1,col+1] := DBGrid.Columns[Col].Title.Caption;

    col := DBGrid.Columns.Count -1;
    repeat
      if not DBGrid.Columns.Items[col].Visible then
        ExcelApp.ActiveSheet.Columns[col+1].Delete;
      col := col -1;
    until(col = -1);

    ExcelApp.Columns.HorizontalAlignment := 2;
    ExcelApp.Columns.AutoFit;
    ExcelApp.Rows[1].Font.Bold := True;
    ExcelApp.Visible := true;

    //liberar da memória
    ExcelApp := Unassigned;
    try
      DataSet.Bookmark := bm;
    //  DataSet.FreeBookmark(bm);
    finally
    end;

    DataSet.EnableControls;
    Screen.Cursor := crDefault;
    Form.Show;
  except
    Form.Show;
    ExcelApp := Unassigned;
    DataSet.EnableControls;
  end;
end;
end.
