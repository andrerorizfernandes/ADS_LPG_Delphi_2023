unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    imgPrincipal: TImage;
    stbPrincipal: TStatusBar;
    tmrPrincipal: TTimer;
    mmMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Operaes1: TMenuItem;
    Cidade1: TMenuItem;
    Cliente1: TMenuItem;
    Venda1: TMenuItem;
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
  private
    procedure PreencherDadosInformativos;
    procedure ListarCidades;
    procedure ListarClientes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uListarCidade, uListarCliente;

{$R *.dfm}

procedure TfrmPrincipal.Cidade1Click(Sender: TObject);
begin
  ListarCidades;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  ListarClientes;
end;

procedure TfrmPrincipal.ListarCidades;
var
  lTelaListarCidade: TfrmListarCidade;
begin
  lTelaListarCidade := TfrmListarCidade.Create(nil);
  try
    lTelaListarCidade.ShowModal;
  finally
    lTelaListarCidade.Free;
  end;
end;

procedure TfrmPrincipal.ListarClientes;
var
  lTelaListarCliente: TfrmListarCliente;
begin
  lTelaListarCliente := TfrmListarCliente.Create(nil);
  try
    lTelaListarCliente.ShowModal;
  finally
    lTelaListarCliente.Free;
  end;

end;

procedure TfrmPrincipal.PreencherDadosInformativos;
begin
  stbPrincipal.Panels[0].Text := DateToStr(Date);
  stbPrincipal.Panels[1].Text := TimeToStr(Time);
  stbPrincipal.Panels[2].Text := 'ERP da turma ADS 2023';
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  PreencherDadosInformativos;
end;

end.
