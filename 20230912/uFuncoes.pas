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

function Pergunta(Pergunta: string): Boolean;
function RetornaTipoDeOperacaoDaQuery(const pQuery: TFDQuery): TTipoOperacao;

implementation

uses
  Vcl.Forms, Data.DB, Vcl.Graphics;

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

end.
