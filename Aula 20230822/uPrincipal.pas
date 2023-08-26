unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnApresentacao: TButton;
    edtMensagem: TEdit;
    procedure btnApresentacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure InicializarTela;
    procedure ExibirMensagem(pMensagem: string);
    function Somar(pValor1, pValor2: Integer): integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnApresentacaoClick(Sender: TObject);
const
  MENSAGEM = 'O valor da soma dos valores %d com %d é %d';
begin
  ExibirMensagem(Format(MENSAGEM, [10, 5, Somar(10, 5)]));
end;

procedure TfrmPrincipal.ExibirMensagem(pMensagem: string);
begin
  ShowMessage(pMensagem);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  InicializarTela;
end;

procedure TfrmPrincipal.InicializarTela;
begin
  edtMensagem.SetFocus;
  frmPrincipal.Caption := 'Aula inicial %%';
end;

function TfrmPrincipal.Somar(pValor1, pValor2: Integer): integer;
var
  lSoma: integer;
begin
  lSoma := pValor1 + pValor2;
  Result := lSoma;
end;

end.
