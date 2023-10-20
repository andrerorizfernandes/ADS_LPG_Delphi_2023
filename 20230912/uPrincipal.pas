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
    Venda2: TMenuItem;
    Utilitrios1: TMenuItem;
    Pesquisa1: TMenuItem;
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Venda2Click(Sender: TObject);
    procedure Pesquisa1Click(Sender: TObject);
  private
    procedure PreencherDadosInformativos;
    procedure ListarCidades;
    procedure ListarClientes;
    procedure ListarVendas;
    procedure ExibirPesquisa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uListarCidade, uListarCliente, uListarVenda, uPesquisa;

{$R *.dfm}

procedure TfrmPrincipal.Cidade1Click(Sender: TObject);
begin
  ListarCidades;
end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  ListarClientes;
end;

procedure TfrmPrincipal.ExibirPesquisa;
var
  lTelaPesquisa: TfrmPesquisa;
begin
  lTelaPesquisa := TfrmPesquisa.Create(nil);
  try
    lTelaPesquisa.ShowModal;
  finally
    lTelaPesquisa.Free;
  end;
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

procedure TfrmPrincipal.ListarVendas;
var
  lTelaListarVenda: TfrmListarVenda;
begin
  lTelaListarVenda := TfrmListarVenda.Create(nil);
  try
    lTelaListarVenda.ShowModal;
  finally
    lTelaListarVenda.Free;
  end;
end;

procedure TfrmPrincipal.Pesquisa1Click(Sender: TObject);
begin
  ExibirPesquisa;
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

procedure TfrmPrincipal.Venda2Click(Sender: TObject);
begin
  ListarVendas;
end;

end.
