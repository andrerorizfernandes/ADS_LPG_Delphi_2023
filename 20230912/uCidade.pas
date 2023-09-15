unit uCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask;

type
  TTipoOperacao = (topInserir, topEditar);

type
  TfrmCidade = class(TForm)
    pnlCidade: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    dbeNome: TDBEdit;
    dbcUF: TDBComboBox;
    lblNome: TLabel;
    lblUF: TLabel;
  private
    FTipoOperacao: TTipoOperacao;
    { Private declarations }
  public
    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
    { Public declarations }
  end;

var
  frmCidade: TfrmCidade;

implementation

{$R *.dfm}

uses uDM;

end.
