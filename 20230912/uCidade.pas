unit uCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uTipoOperacao,
  Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCidade = class(TForm)
    pnlCidade: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    dbeNome: TDBEdit;
    dbcUF: TDBComboBox;
    lblNome: TLabel;
    lblUF: TLabel;
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

var
  frmCidade: TfrmCidade;

implementation

{$R *.dfm}

uses uDM, Data.DB, uFuncoes;

{ TfrmCidade }

procedure TfrmCidade.btnCancelarClick(Sender: TObject);
begin
  Caption := 'Cidade';
  Cancelar;
end;

procedure TfrmCidade.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
end;

procedure TfrmCidade.Cancelar;
begin
  DM.qryCidade.Cancel;
  Close;
end;

procedure TfrmCidade.Carregar;
begin
  case TipoOperacao of
    topInserir:
    begin
      Caption := 'Inserindo cidade';
      DM.qryCidade.Append;
    end;
    topEditar:
    begin
      Caption := 'Editando cidade';
      DM.qryCidade.Edit;
    end;
  end;
  dbeNome.SetFocus;
end;

procedure TfrmCidade.FormActivate(Sender: TObject);
begin
  Carregar;
end;

procedure TfrmCidade.Gravar;
begin
  try
    DM.qryCidade.Post;
  except
    Erro('Erro ao gravar dados');
  end;
  DM.qryCidade.Refresh;
  Close;
end;

procedure TfrmCidade.ValidarDados;
begin
  if DM.qryCidade.State in [dsBrowse] then
  begin
    Alerta('Não foi definida se a operação é de inserção ou edição');
    Abort;
  end;

  if dbeNome.Text = EmptyStr then
  begin
    Alerta('Preencha o nome da cidade');
    dbeNome.SetFocus;
    Abort;
  end;

  if dbcUF.ItemIndex = -1 then
  begin
    Alerta('Selecione a UF');
    dbcUF.SetFocus;
    Abort;
  end;
end;

end.
