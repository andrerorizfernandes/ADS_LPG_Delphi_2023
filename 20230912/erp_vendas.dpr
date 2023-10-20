program erp_vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uListarCidade in 'uListarCidade.pas' {frmListarCidade},
  uFuncoes in 'uFuncoes.pas',
  uCidade in 'uCidade.pas' {frmCidade},
  uTipoOperacao in 'uTipoOperacao.pas',
  uListarCliente in 'uListarCliente.pas' {frmListarCliente},
  uCliente in 'uCliente.pas' {frmCliente},
  uListarVenda in 'uListarVenda.pas' {frmListarVenda},
  uVenda in 'uVenda.pas' {frmVenda},
  uPesquisa in 'uPesquisa.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
