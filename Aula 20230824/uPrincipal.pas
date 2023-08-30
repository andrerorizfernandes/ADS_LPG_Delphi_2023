unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTipoOperacao = (topSomar = 0, topSubtrair = 1, topMultiplicar = 2, topDividir = 3);

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
    btnLimpar: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure cboOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
  private
    procedure PreencherOperacoes;
    procedure LimparOperacoes;
    procedure ValidarDados;
    procedure Calcular(pValor1, pValor2: Integer);
    procedure AdicionarResultado(
      pNomeDaOperacao: string;
      pValor1, pValor2: Integer;
      pResultado: Real);
    procedure RealizarCalculo;
    procedure LimparTela;
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

procedure TfrmPrincipal.AdicionarResultado(
  pNomeDaOperacao: string;
  pValor1, pValor2: Integer;
  pResultado: Real);
const
  MENSAGEM = 'A %s de %d com %d é %f';
var
  lNomeDaOperacao: string;
begin
  lbxResultado.Items.Add(Format(
    MENSAGEM,
    [pNomeDaOperacao, pValor1, pValor2, pResultado]));
end;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  RealizarCalculo;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  LimparTela;
end;

procedure TfrmPrincipal.Calcular(pValor1, pValor2: Integer);
var
  lResultado: Real;
begin
  case TTipoOperacao(cboOperacao.ItemIndex) of
    topSomar:
       begin
         lResultado := Somar(pValor1, pValor2);
         AdicionarResultado('somar', pValor1, pValor2, lResultado);
       end;
    topSubtrair:
       begin
         lResultado := Subtrair(pValor1, pValor2);
         AdicionarResultado('subtrair', pValor1, pValor2, lResultado);
       end;
    topMultiplicar:
       begin
         lResultado := Multiplicar(pValor1, pValor2);
         AdicionarResultado('multiplicar', pValor1, pValor2, lResultado);
       end;
    topDividir:
       begin
         lResultado := Dividir(pValor1, pValor2);
         AdicionarResultado('dividir', pValor1, pValor2, lResultado);
       end;
  end;
end;

procedure TfrmPrincipal.cboOperacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    RealizarCalculo;
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

procedure TfrmPrincipal.LimparTela;
begin
  LimparOperacoes;
  lbxResultado.Items.Clear;
  edtValor1.SetFocus;
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

procedure TfrmPrincipal.RealizarCalculo;
begin
  ValidarDados;
  Calcular(StrToInt(edtValor1.Text), StrToInt(edtValor2.Text));
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
