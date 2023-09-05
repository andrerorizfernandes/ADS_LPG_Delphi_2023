unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DBClient,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    gbxDados: TGroupBox;
    gbxControle: TGroupBox;
    btnMensagem: TBitBtn;
    dbgDados: TDBGrid;
    Label1: TLabel;
    edtPosicao: TEdit;
    Label2: TLabel;
    edtQuantidade: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPosicaoChange(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure btnMensagemClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FDadosDataSet: TClientDataSet;
    FDadosDataSource: TDataSource;

    procedure Criar;
    procedure Destruir;
    procedure Povoar;
    procedure PosicionarCursor;
    procedure Filtrar;
    procedure ExibirRegistroAtual;
    procedure ExibirTodosRegistros;
    procedure ExibirQuantidadeRegistros;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  ExibirTodosRegistros;
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  ExibirQuantidadeRegistros;
end;

procedure TfrmPrincipal.btnMensagemClick(Sender: TObject);
begin
  ExibirRegistroAtual;
end;

procedure TfrmPrincipal.Criar;
begin
  FDadosDataSet := TClientDataSet.Create(nil);
  FDadosDataSource := TDataSource.Create(nil);
  FDadosDataSource.DataSet := FDadosDataSet;
  dbgDados.DataSource := FDadosDataSource;
end;

procedure TfrmPrincipal.Destruir;
begin
  FDadosDataSet.Free;
  FDadosDataSource.Free;
end;

procedure TfrmPrincipal.edtPosicaoChange(Sender: TObject);
begin
  PosicionarCursor;
end;

procedure TfrmPrincipal.edtQuantidadeChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmPrincipal.ExibirQuantidadeRegistros;
const
  MENSAGEM = 'A memória atualmente possui %d registros';
begin
  ShowMessage(Format(MENSAGEM, [FDadosDataSet.RecordCount]));
end;

procedure TfrmPrincipal.ExibirRegistroAtual;
const
  MENSAGEM = 'O animal %s está na posição %d e possui %d patas';
begin
  ShowMessage(
    Format(MENSAGEM,
      [FDadosDataSet.FieldByName('Animal').AsString,
      FDadosDataSet.FieldByName('Posicao').AsInteger,
      FDadosDataSet.FieldByName('QuantidadePatas').AsInteger])
  );
end;

procedure TfrmPrincipal.ExibirTodosRegistros;
const
  LIMITE = 6;
  MENSAGEM_BASE = 'O animal %s está na posição %d e possui %d patas' + sLineBreak;
var
  lMensagem: string;
begin
  lMensagem := EmptyStr;
  FDadosDataSet.First;
  while (not FDadosDataSet.Eof) do
  begin
    lMensagem := lMensagem +
      Format(MENSAGEM_BASE,
        [FDadosDataSet.FieldByName('Animal').AsString,
        FDadosDataSet.FieldByName('Posicao').AsInteger,
        FDadosDataSet.FieldByName('QuantidadePatas').AsInteger]);

    FDadosDataSet.Next;
  end;

  ShowMessage(lMensagem);
end;

procedure TfrmPrincipal.Filtrar;
begin
  FDadosDataSet.Filtered := False;
  if edtQuantidade.Text <> EmptyStr then
  begin
    FDadosDataSet.Filter := 'QuantidadePatas=' + edtQuantidade.Text;
    FDadosDataSet.Filtered := True;
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  Criar;
  Povoar;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destruir;
end;

procedure TfrmPrincipal.PosicionarCursor;
begin
  if edtPosicao.Text = EmptyStr then
    Exit;

  FDadosDataSet.Locate('Posicao', edtPosicao.Text, []);
end;

procedure TfrmPrincipal.Povoar;
begin
  FDadosDataSet.FieldDefs.Add('Posicao', ftInteger);
  FDadosDataSet.FieldDefs.Add('Animal', ftString, 60);
  FDadosDataSet.FieldDefs.Add('QuantidadePatas', ftInteger);

  FDadosDataSet.CreateDataSet;
  FDadosDataSet.Append;
  FDadosDataSet.FieldByName('Posicao').AsInteger := 1;
  FDadosDataSet.FieldByName('Animal').AsString := 'Pato';
  FDadosDataSet.FieldByName('QuantidadePatas').AsInteger := 2;
  FDadosDataSet.Post;
  FDadosDataSet.Append;
  FDadosDataSet.FieldByName('Posicao').AsInteger := 2;
  FDadosDataSet.FieldByName('Animal').AsString := 'Cavalo';
  FDadosDataSet.FieldByName('QuantidadePatas').AsInteger := 4;
  FDadosDataSet.Post;
  FDadosDataSet.Append;
  FDadosDataSet.FieldByName('Posicao').AsInteger := 3;
  FDadosDataSet.FieldByName('Animal').AsString := 'Gato';
  FDadosDataSet.FieldByName('QuantidadePatas').AsInteger := 4;
  FDadosDataSet.Post;
  FDadosDataSet.Append;
  FDadosDataSet.FieldByName('Posicao').AsInteger := 4;
  FDadosDataSet.FieldByName('Animal').AsString := 'Cachorro';
  FDadosDataSet.FieldByName('QuantidadePatas').AsInteger := 4;
  FDadosDataSet.Post;
  FDadosDataSet.Append;
  FDadosDataSet.FieldByName('Posicao').AsInteger := 5;
  FDadosDataSet.FieldByName('Animal').AsString := 'Coelho';
  FDadosDataSet.FieldByName('QuantidadePatas').AsInteger := 4;
  FDadosDataSet.Post;
  FDadosDataSet.Append;
  FDadosDataSet.FieldByName('Posicao').AsInteger := 6;
  FDadosDataSet.FieldByName('Animal').AsString := 'Canguru';
  FDadosDataSet.FieldByName('QuantidadePatas').AsInteger := 2;
  FDadosDataSet.Post;
  FDadosDataSet.First;
end;

end.
