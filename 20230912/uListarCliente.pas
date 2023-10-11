unit uListarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uTipoOperacao;

type
  TfrmListarCliente = class(TForm)
    pnlTitulo: TPanel;
    dbgListarCliente: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgListarClienteDblClick(Sender: TObject);
    procedure dbgListarClienteDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure ExcluirCliente;
    procedure ControlarVisibilidadeDosBotoes;
    procedure AbrirCadastroDeCliente(const pTipoOperacao: TTipoOperacao);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes, uCliente;

{ TfrmListarCliente }

procedure TfrmListarCliente.AbrirCadastroDeCliente(
  const pTipoOperacao: TTipoOperacao);
var
  lCliente: TfrmCliente;
begin
  lCliente := TfrmCliente.Create(nil);
  try
    lCliente.TipoOperacao := pTipoOperacao;
    lCliente.ShowModal;
  finally
    lCliente.Free;
  end;
end;

procedure TfrmListarCliente.btnEditarClick(Sender: TObject);
begin
  AbrirCadastroDeCliente(topEditar);
end;

procedure TfrmListarCliente.btnExcluirClick(Sender: TObject);
begin
  ExcluirCliente;
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCliente.btnInserirClick(Sender: TObject);
begin
  AbrirCadastroDeCliente(topInserir);
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCliente.ControlarVisibilidadeDosBotoes;
begin
  btnEditar.Enabled := (not DM.qryCliente.IsEmpty);
  btnExcluir.Enabled := (not DM.qryCliente.IsEmpty);
end;

procedure TfrmListarCliente.dbgListarClienteDblClick(Sender: TObject);
begin
  AbrirCadastroDeCliente(topEditar);
end;

procedure TfrmListarCliente.dbgListarClienteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(Sender, DM.qryCliente, Rect, Column, State);
end;

procedure TfrmListarCliente.ExcluirCliente;
begin
  if DM.qryCliente.IsEmpty then
    Exit;

  if (not Pergunta('Deseja realmente excluir o cliente?')) then
    Exit;

  DM.qryCliente.Delete;
end;

procedure TfrmListarCliente.FormActivate(Sender: TObject);
begin
  AtivarQuery(DM.qryCliente, topAbrir);
  AtivarQuery(DM.qryCidade, topAbrir);
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AtivarQuery(DM.qryCliente, topFechar);
  AtivarQuery(DM.qryCidade, topFechar);
end;

end.
