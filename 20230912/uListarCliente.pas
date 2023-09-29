unit uListarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

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
  private
    { Private declarations }
    procedure ExcluirCliente;
    procedure ControlarVisibilidadeDosBotoes;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

{ TfrmListarCliente }

procedure TfrmListarCliente.btnExcluirClick(Sender: TObject);
begin
  ExcluirCliente;
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCliente.ControlarVisibilidadeDosBotoes;
begin
  btnEditar.Enabled := (not DM.qryCliente.IsEmpty);
  btnExcluir.Enabled := (not DM.qryCliente.IsEmpty);
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
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AtivarQuery(DM.qryCliente, topFechar);
end;

end.
