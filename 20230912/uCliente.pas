unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TfrmCliente = class(TForm)
    pnlCliente: TPanel;
    lblNome: TLabel;
    lblIdade: TLabel;
    dbeNome: TDBEdit;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    dbeIdade: TDBEdit;
    dbeCpf: TDBEdit;
    lblCpf: TLabel;
    lblCidade: TLabel;
    dblCidade: TDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses uDM;

end.
