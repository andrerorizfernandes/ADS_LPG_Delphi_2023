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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
