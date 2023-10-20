unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryCidade: TFDQuery;
    qryCliente: TFDQuery;
    qryVenda: TFDQuery;
    qryCidadecodcidade: TFDAutoIncField;
    qryCidadenome: TStringField;
    qryCidadeuf: TStringField;
    dsrCidade: TDataSource;
    dsrCliente: TDataSource;
    dsrVenda: TDataSource;
    qryClientecodcliente: TFDAutoIncField;
    qryClientenome: TStringField;
    qryClienteidade: TIntegerField;
    qryClientecpf: TStringField;
    qryClientecodcidade: TIntegerField;
    qryClientecidade: TStringField;
    qryClienteuf: TStringField;
    qryVendacodvenda: TFDAutoIncField;
    qryVendacodcliente: TIntegerField;
    qryVendadescricao: TStringField;
    qryVendaquantidade: TIntegerField;
    qryVendavalor: TFMTBCDField;
    qryVendacpf_cliente: TStringField;
    qryVendanome_cliente: TStringField;
    qryVendacidade_cliente: TStringField;
    qryVendauf_cliente: TStringField;
    qryAuxiliar: TFDQuery;
    qryPesquisa: TFDQuery;
    dsrPesquisa: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
