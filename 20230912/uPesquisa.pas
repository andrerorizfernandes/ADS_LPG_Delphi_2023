unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmPesquisa = class(TForm)
    rdgTipoPesquisa: TRadioGroup;
    pnlBotoes: TPanel;
    btnSair: TBitBtn;
    btnImprimir: TBitBtn;
    btnExportar: TBitBtn;
    dbgPesquisa: TDBGrid;
    gbxParametrosPesquisa: TGroupBox;
    cboCampo: TComboBox;
    cboTipoOperacao: TComboBox;
    edtValor: TEdit;
    lblCampo: TLabel;
    lblTipoOperacao: TLabel;
    lblValor: TLabel;
    btnPesquisar: TBitBtn;
    lblQuantidadeRegistros: TLabel;
    procedure rdgTipoPesquisaClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnExportarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    function SqlPorEntidade: string;
    procedure ControlarVisibilidadeDosParametrosDePesquisa;
    procedure ValidarParametrosDePesquisa;
    procedure MontarEstruturaComTipoDePesquisa;
    procedure PreencherCampos;
    procedure Pesquisar;
    procedure QuantidadeRegistros;
    procedure ExportarDados;
    procedure ImprimirRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uFuncoes, uDM, System.SysUtils;

const
  SQL_CIDADE = 'SELECT c.codcidade, c.nome, c.uf FROM cidade c';
  SQL_CLIENTE = 'SELECT cl.codcliente, cl.nome, cl.idade, cl.cpf FROM cliente cl';
  SQL_VENDA = 'SELECT v.codvenda, v.descricao, v.quantidade, v.valor FROM venda v';

{$R *.dfm}

procedure TfrmPesquisa.btnExportarClick(Sender: TObject);
begin
  ExportarDados;
end;

procedure TfrmPesquisa.btnImprimirClick(Sender: TObject);
begin
  ImprimirRelatorio;
end;

procedure TfrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  ValidarParametrosDePesquisa;
  Pesquisar;
end;

procedure TfrmPesquisa.ControlarVisibilidadeDosParametrosDePesquisa;
begin
  gbxParametrosPesquisa.Visible := rdgTipoPesquisa.ItemIndex <> -1;
end;

procedure TfrmPesquisa.dbgPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(dbgPesquisa, DM.qryPesquisa, Rect, Column, State);
end;

procedure TfrmPesquisa.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ValidarParametrosDePesquisa;
    Pesquisar;
  end;
end;

procedure TfrmPesquisa.ExportarDados;
begin
  if DM.qryPesquisa.IsEmpty then
    Exit;

  ExportarDBGrid(dbgPesquisa);
end;

procedure TfrmPesquisa.ImprimirRelatorio;
begin
  {case rdgTipoPesquisa.ItemIndex of
    0:
    begin
      ppRelatorio.Template.FileName := 'C:\Users\andre\Downloads\ADS_LPG_Delphi_2023\20230912\Report\Rel_Cidade.rtm';
      ppRelatorio.Template.LoadFromFile;
      dbtCodigo.DataField := 'codcidade';
      dbtCidade.DataField := 'nome';
      dbtUf.DataField := 'uf';
      ppRelatorio.Print;
    end;
  end;}
end;

procedure TfrmPesquisa.MontarEstruturaComTipoDePesquisa;
begin
  DM.qryPesquisa.Close;
  DM.qryPesquisa.SQL.Clear;
  case rdgTipoPesquisa.ItemIndex of
    0: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE codcidade = -1');
    1: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE codcliente = -1');
    2: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE codvenda = -1');
  end;
  DM.qryPesquisa.Open;
end;

procedure TfrmPesquisa.Pesquisar;
var
  lSql: string;
begin
  DM.qryPesquisa.Close;
  DM.qryPesquisa.SQL.Clear;
  case cboTipoOperacao.ItemIndex of
    0: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE ' + cboCampo.Text + '=' + QuotedStr(edtValor.Text));
    1: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE ' + cboCampo.Text + '<>' + QuotedStr(edtValor.Text));
    2: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE ' + cboCampo.Text + ' like ' + QuotedStr(edtValor.Text + '%'));
    3: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE ' + cboCampo.Text + ' like ' + QuotedStr('%' + edtValor.Text));
    4: DM.qryPesquisa.SQL.Add(SqlPorEntidade + ' WHERE ' + cboCampo.Text + ' like ' + QuotedStr('%' + edtValor.Text + '%'));
  end;
  try
    DM.qryPesquisa.Open;
    QuantidadeRegistros;
  except
    Erro('Erro ao realizar pesquisa');
  end;
end;

procedure TfrmPesquisa.PreencherCampos;
var
  I: Integer;
begin
  if (not DM.qryPesquisa.Active) then
    Exit;

  cboCampo.Items.Clear;
  for I := 0 to DM.qryPesquisa.Fields.Count - 1 do
    cboCampo.Items.Add(DM.qryPesquisa.Fields[I].FieldName);

  cboCampo.SetFocus;
end;

procedure TfrmPesquisa.QuantidadeRegistros;
const
  INFORMACAO = '%d registros ';
begin
  lblQuantidadeRegistros.Caption := Format(INFORMACAO, [DM.qryPesquisa.RecordCount]);
end;

procedure TfrmPesquisa.rdgTipoPesquisaClick(Sender: TObject);
begin
  ControlarVisibilidadeDosParametrosDePesquisa;
  MontarEstruturaComTipoDePesquisa;
  PreencherCampos;
end;

function TfrmPesquisa.SqlPorEntidade: string;
begin
  case rdgTipoPesquisa.ItemIndex of
    0: DM.qryPesquisa.SQL.Add(SQL_CIDADE);
    1: DM.qryPesquisa.SQL.Add(SQL_CLIENTE);
    2: DM.qryPesquisa.SQL.Add(SQL_VENDA);
  end;
end;

procedure TfrmPesquisa.ValidarParametrosDePesquisa;
begin
  if cboCampo.ItemIndex = -1 then
  begin
    Alerta('Selecione o campo');
    cboCampo.SetFocus;
    Abort;
  end;

  if cboTipoOperacao.ItemIndex = -1 then
  begin
    Alerta('Selecione o tipo de operação');
    cboTipoOperacao.SetFocus;
    Abort;
  end;

  if edtValor.Text = EmptyStr then
  begin
    Alerta('Informe o valor a ser pesquisado');
    edtValor.SetFocus;
    Abort;
  end;
end;

end.
