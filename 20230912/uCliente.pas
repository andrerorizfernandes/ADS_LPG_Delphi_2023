unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, uTipoOperacao;

type
  TfrmCliente = class(TForm)
    pnlCliente: TPanel;
    lblNome: TLabel;
    lblIdade: TLabel;
    dbeNome: TDBEdit;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    dbeIdade: TDBEdit;
    dbeCpf: TDBEdit;
    lblCpf: TLabel;
    lblCidade: TLabel;
    dblCidade: TDBLookupComboBox;
    dbeUf: TDBEdit;
    lblUf: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FTipoOperacao: TTipoOperacao;
    procedure Carregar;
    procedure Gravar;
    procedure Cancelar;
    procedure ValidarDados;
    { Private declarations }
  public
    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes, Data.DB;

{ TfrmCliente }

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  Caption := 'Cliente';
  Cancelar;
end;

procedure TfrmCliente.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
end;

procedure TfrmCliente.Cancelar;
begin
  DM.qryCliente.Cancel;
  Close;
end;

procedure TfrmCliente.Carregar;
begin
  case TipoOperacao of
    topInserir:
    begin
      Caption := 'Inserindo cliente';
      DM.qryCliente.Append;
    end;
    topEditar:
    begin
      Caption := 'Editando cliente';
      DM.qryCliente.Edit;
    end;
  end;
  dbeNome.SetFocus;
end;

procedure TfrmCliente.FormActivate(Sender: TObject);
begin
  Carregar;
end;

procedure TfrmCliente.Gravar;
begin
  try
    DM.qryCliente.Post;
  except
    Erro('Erro ao gravar dados');
  end;
  DM.qryCliente.Refresh;
  Close;
end;

procedure TfrmCliente.ValidarDados;
begin
  if DM.qryCliente.State in [dsBrowse] then
  begin
    Alerta('Não foi definida se a operação é de inserção ou edição');
    Abort;
  end;

  if dbeNome.Text = EmptyStr then
  begin
    Alerta('Preencha o nome do cliente');
    dbeNome.SetFocus;
    Abort;
  end;

  if dbeIdade.Text = EmptyStr then
  begin
    Alerta('Preencha a idade do cliente');
    dbeIdade.SetFocus;
    Abort;
  end;

  if dbeCpf.Text = EmptyStr then
  begin
    Alerta('Preencha o CPF do cliente');
    dbeCpf.SetFocus;
    Abort;
  end;

  if dblCidade.KeyValue = Null then
  begin
    Alerta('Selecione a cidade');
    dblCidade.SetFocus;
    Abort;
  end;
end;

end.
