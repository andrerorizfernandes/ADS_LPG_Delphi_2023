unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    gbxControles: TGroupBox;
    gbxResultado: TGroupBox;
    btnCalcular: TButton;
    lblValor1: TLabel;
    lblValor2: TLabel;
    lblOperacao: TLabel;
    edtValor1: TEdit;
    edtValor2: TEdit;
    cboOperacao: TComboBox;
    lbxResultado: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    procedure PreencherOperacoes;
    procedure LimparOperacoes;
    procedure ValidarDados;
    procedure Calcular(pValor1, pValor2: Integer);
    procedure AdicionarResultado(pMensagem: string);
    function Somar(pValor1, pValor2: Integer): Integer;
    function Subtrair(pValor1, pValor2: Integer): Integer;
    function Multiplicar(pValor1, pValor2: Integer): Integer;
    function Dividir(pValor1, pValor2: Integer): Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.AdicionarResultado(pMensagem: string);
begin
  lbxResultado.Items.Add(pMensagem);
end;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  ValidarDados;
  Calcular(StrToInt(edtValor1.Text), StrToInt(edtValor2.Text));
end;

procedure TfrmPrincipal.Calcular(pValor1, pValor2: Integer);
var
  lResultado: Real;
begin
  case cboOperacao.ItemIndex of
    0: begin
         lResultado := Somar(pValor1, pValor2);
         AdicionarResultado('A soma de ' + IntToStr(pValor1) + ' com ' + IntToStr(pValor2) +
           ' é ' + FloatToStr(lResultado));
       end;
    1: begin
         lResultado := Subtrair(pValor1, pValor2);
         AdicionarResultado('A subtração de ' + IntToStr(pValor1) + ' com ' + IntToStr(pValor2) +
           ' é ' + FloatToStr(lResultado));
       end;
    2: begin
         lResultado := Multiplicar(pValor1, pValor2);
         AdicionarResultado('A multiplicação de ' + IntToStr(pValor1) + ' com ' + IntToStr(pValor2) +
           ' é ' + FloatToStr(lResultado));
       end;
    3: begin
         lResultado := Dividir(pValor1, pValor2);
         AdicionarResultado('A divisão de ' + IntToStr(pValor1) + ' com ' + IntToStr(pValor2) +
           ' é ' + FloatToStr(lResultado));
       end;
  end;
end;

function TfrmPrincipal.Dividir(pValor1, pValor2: Integer): Real;
begin
  Result := pValor1 / pValor2;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  PreencherOperacoes;
  LimparOperacoes;
end;

procedure TfrmPrincipal.LimparOperacoes;
begin
  edtValor1.Clear;
  edtValor2.Clear;
  cboOperacao.ItemIndex := -1;
end;

function TfrmPrincipal.Multiplicar(pValor1, pValor2: Integer): Integer;
begin
  Result := pValor1 * pValor2;
end;

procedure TfrmPrincipal.PreencherOperacoes;
const
  SOMAR = 'Somar';
  SUBTRAIR = 'Substruir';
  MULTIPLICAR = 'Multiplicar';
  DIVIDIR = 'Dividir';
begin
  cboOperacao.Clear;
  cboOperacao.Items.Add(SOMAR);
  cboOperacao.Items.Add(SUBTRAIR);
  cboOperacao.Items.Add(MULTIPLICAR);
  cboOperacao.Items.Add(DIVIDIR);
end;

function TfrmPrincipal.Somar(pValor1, pValor2: Integer): Integer;
begin
  Result := pValor1 + pValor2;
end;

function TfrmPrincipal.Subtrair(pValor1, pValor2: Integer): Integer;
begin
  Result := pValor1 - pValor2;
end;

procedure TfrmPrincipal.ValidarDados;
begin
  if edtValor1.Text = EmptyStr then
  begin
    ShowMessage('Informe o valor 1');
    edtValor1.SetFocus;
    Abort;
  end;

  if edtValor2.Text = EmptyStr then
  begin
    ShowMessage('Informe o valor 2');
    edtValor2.SetFocus;
    Abort;
  end;

  if cboOperacao.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a operação');
    cboOperacao.SetFocus;
    Abort;
  end;
end;

end.
