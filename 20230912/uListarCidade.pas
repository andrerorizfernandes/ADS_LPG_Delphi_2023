unit uListarCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, uCidade;

type
  TfrmListarCidade = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    dbgListarCidade: TDBGrid;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    procedure ExcluirCidade;
    procedure ControlarVisibilidadeDoBotaoExcluir;
    procedure AbrirCadastroDeCidade(const pTipoOperacao: TTipoOperacao);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TfrmListarCidade.btnEditarClick(Sender: TObject);
begin
  AbrirCadastroDeCidade(topEditar);
end;

procedure TfrmListarCidade.btnExcluirClick(Sender: TObject);
begin
  ExcluirCidade;
  ControlarVisibilidadeDoBotaoExcluir;
end;

procedure TfrmListarCidade.btnInserirClick(Sender: TObject);
begin
  AbrirCadastroDeCidade(topInserir);
end;

procedure TfrmListarCidade.ControlarVisibilidadeDoBotaoExcluir;
begin
  btnExcluir.Enabled := (not DM.qryCidade.IsEmpty);
end;

procedure TfrmListarCidade.ExcluirCidade;
begin
  if DM.qryCidade.IsEmpty then
    Exit;

  DM.qryCidade.Delete;
end;

procedure TfrmListarCidade.FormActivate(Sender: TObject);
begin
  AtivarQuery(DM.qryCidade, topAbrir);
  ControlarVisibilidadeDoBotaoExcluir;
end;

procedure TfrmListarCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AtivarQuery(DM.qryCidade, topFechar);
end;

procedure TfrmListarCidade.AbrirCadastroDeCidade(const pTipoOperacao: TTipoOperacao);
var
  lCidade: TfrmCidade;
begin
  lCidade := TfrmCidade.Create(nil);
  try
    lCidade.TipoOperacao := pTipoOperacao;
    lCidade.ShowModal;
  finally
    lCidade.Free;
  end;
end;

end.
