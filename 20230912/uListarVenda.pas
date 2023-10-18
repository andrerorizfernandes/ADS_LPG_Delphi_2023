unit uListarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uTipoOperacao;

type
  TfrmListarVenda = class(TForm)
    pnlTitulo: TPanel;
    dbgListarVenda: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgListarVendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgListarVendaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluirVenda;
    procedure ControlarVisibilidadeDosBotoes;
    procedure AbrirCadastroDeVenda(const pTipoOperacao: TTipoOperacao);
  public
    { Public declarations }
  end;

implementation

uses
  uDM, uFuncoes, uVenda;

{$R *.dfm}

{ TfrmListarVenda }

procedure TfrmListarVenda.AbrirCadastroDeVenda(
  const pTipoOperacao: TTipoOperacao);
var
  lVenda: TfrmVenda;
begin
  lVenda := TfrmVenda.Create(nil);
  try
    lVenda.TipoOperacao := pTipoOperacao;
    lVenda.ShowModal;
  finally
    lVenda.Free;
  end;
end;

procedure TfrmListarVenda.btnEditarClick(Sender: TObject);
begin
  AbrirCadastroDeVenda(topEditar);
end;

procedure TfrmListarVenda.btnExcluirClick(Sender: TObject);
begin
  ExcluirVenda;
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarVenda.btnInserirClick(Sender: TObject);
begin
  AbrirCadastroDeVenda(topInserir);
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarVenda.ControlarVisibilidadeDosBotoes;
begin
  btnEditar.Enabled := (not DM.qryVenda.IsEmpty);
  btnExcluir.Enabled := (not DM.qryVenda.IsEmpty);
end;

procedure TfrmListarVenda.dbgListarVendaDblClick(Sender: TObject);
begin
  AbrirCadastroDeVenda(topEditar);
end;

procedure TfrmListarVenda.dbgListarVendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(Sender, DM.qryVenda, Rect, Column, State);
end;

procedure TfrmListarVenda.ExcluirVenda;
begin
  if DM.qryVenda.IsEmpty then
    Exit;

  if (not Pergunta('Deseja realmente excluir a venda?')) then
    Exit;

  DM.qryVenda.Delete;
end;

procedure TfrmListarVenda.FormActivate(Sender: TObject);
begin
  AtivarQuery(DM.qryVenda, topAbrir);
  AtivarQuery(DM.qryCliente, topAbrir);
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AtivarQuery(DM.qryVenda, topFechar);
  AtivarQuery(DM.qryCliente, topFechar);
end;

end.
