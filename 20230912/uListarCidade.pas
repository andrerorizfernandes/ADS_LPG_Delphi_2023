unit uListarCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, uCidade, uTipoOperacao;

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
    procedure dbgListarCidadeDblClick(Sender: TObject);
    procedure dbgListarCidadeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure ExcluirCidade;
    procedure ControlarVisibilidadeDosBotoes;
    procedure AbrirCadastroDeCidade(const pTipoOperacao: TTipoOperacao);
    function ExisteClienteParaACidade(const pCodigoCidade: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes, System.SysUtils;

procedure TfrmListarCidade.btnEditarClick(Sender: TObject);
begin
  AbrirCadastroDeCidade(topEditar);
end;

procedure TfrmListarCidade.btnExcluirClick(Sender: TObject);
begin
  if ExisteClienteParaACidade(DM.qryCidadecodcidade.Value) then
  begin
    Alerta('A cidade ' + DM.qryCidadenome.Value + ' está sendo utilizado por algum cliente');
    Exit;
  end;

  ExcluirCidade;
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCidade.btnInserirClick(Sender: TObject);
begin
  AbrirCadastroDeCidade(topInserir);
  ControlarVisibilidadeDosBotoes;
end;

procedure TfrmListarCidade.ControlarVisibilidadeDosBotoes;
begin
  btnEditar.Enabled := (not DM.qryCidade.IsEmpty);
  btnExcluir.Enabled := (not DM.qryCidade.IsEmpty);
end;

procedure TfrmListarCidade.dbgListarCidadeDblClick(Sender: TObject);
begin
  AbrirCadastroDeCidade(topEditar);
end;

procedure TfrmListarCidade.dbgListarCidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(Sender, DM.qryCidade, Rect, Column, State);
end;

procedure TfrmListarCidade.ExcluirCidade;
begin
  if DM.qryCidade.IsEmpty then
    Exit;

  if (not Pergunta('Deseja realmente excluir a cidade?')) then
    Exit;

  DM.qryCidade.Delete;
end;

function TfrmListarCidade.ExisteClienteParaACidade(const pCodigoCidade: Integer): Boolean;
const
  SQL_PESQUISA = 'Select codcliente From cliente WHERE codcidade=%s';
begin
  try
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Text := Format(SQL_PESQUISA, [pCodigoCidade.ToString]);
    DM.qryAuxiliar.Open;

    Result := (not DM.qryAuxiliar.IsEmpty);
  finally
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.Close;
  end;
end;

procedure TfrmListarCidade.FormActivate(Sender: TObject);
begin
  AtivarQuery(DM.qryCidade, topAbrir);
  ControlarVisibilidadeDosBotoes;
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
