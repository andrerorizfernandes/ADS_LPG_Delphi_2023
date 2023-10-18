unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, uTipoOperacao;

type
  TfrmVenda = class(TForm)
    pnlCliente: TPanel;
    lblDescricao: TLabel;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblCliente: TLabel;
    lblUf: TLabel;
    dbeDescricao: TDBEdit;
    dbeQuantidade: TDBEdit;
    dbeValor: TDBEdit;
    dblCliente: TDBLookupComboBox;
    dbeUf: TDBEdit;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    dbeCidade: TDBEdit;
    lblCidade: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FTipoOperacao: TTipoOperacao;
    procedure Carregar;
    procedure Gravar;
    procedure Cancelar;
    procedure ValidarDados;
  public
    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
  end;

implementation

uses
  uDM, uFuncoes;

{$R *.dfm}

procedure TfrmVenda.btnCancelarClick(Sender: TObject);
begin
  Caption := 'Venda';
  Cancelar;
end;

procedure TfrmVenda.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
end;

procedure TfrmVenda.Cancelar;
begin
  DM.qryVenda.Cancel;
  Close;
end;

procedure TfrmVenda.Carregar;
begin
  case TipoOperacao of
    topInserir:
    begin
      Caption := 'Inserindo venda';
      DM.qryVenda.Append;
    end;
    topEditar:
    begin
      Caption := 'Editando venda';
      DM.qryVenda.Edit;
    end;
  end;
  dbeDescricao.SetFocus;
end;

procedure TfrmVenda.FormActivate(Sender: TObject);
begin
  Carregar;
end;

procedure TfrmVenda.Gravar;
begin
  try
    DM.qryVenda.Post;
  except
    Erro('Erro ao gravar dados');
  end;
  DM.qryVenda.Refresh;
  Close;
end;

procedure TfrmVenda.ValidarDados;
begin
  if (RetornaTipoDeOperacaoDaQuery(DM.qryVenda) = topNavegar) then
  begin
    Alerta('Não foi definida se a operação é de inserção ou edição');
    Abort;
  end;

  if dbeDescricao.Text = EmptyStr then
  begin
    Alerta('Preencha a descrição da venda');
    dbeDescricao.SetFocus;
    Abort;
  end;

  if dbeQuantidade.Text = EmptyStr then
  begin
    Alerta('Preencha a quantidade da venda');
    dbeQuantidade.SetFocus;
    Abort;
  end;

  if dbeValor.Text = EmptyStr then
  begin
    Alerta('Preencha o valor da venda');
    dbeValor.SetFocus;
    Abort;
  end;

  if dblCliente.KeyValue = Null then
  begin
    Alerta('Selecione o cliente');
    dblCliente.SetFocus;
    Abort;
  end;
end;

end.
