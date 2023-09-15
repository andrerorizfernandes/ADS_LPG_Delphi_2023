unit uFuncoes;

interface

uses
  FireDAC.Comp.Client;

const
  NOME_SISTEMA = 'ERP de vendas';

type
  TOperacaoDaQuery = (topAbrir, topFechar);

procedure AtivarQuery(const pQuery: TFDQuery; const pTipoOperacaoDaQuery: TOperacaoDaQuery);
procedure Alerta(Mensagem: string);
procedure Informacao(Mensagem: string);
procedure Erro(Mensagem : string);

function Pergunta(Pergunta: string): Boolean;

implementation

uses
  Vcl.Forms, Winapi.Windows;

procedure AtivarQuery(const pQuery: TFDQuery; const pTipoOperacaoDaQuery: TOperacaoDaQuery);
begin
  case pTipoOperacaoDaQuery of
    topAbrir: pQuery.Open;
    topFechar: pQuery.Close;
  end;
end;

procedure Alerta(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOME_SISTEMA), MB_ICONWARNING);
end;

Procedure Informacao(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOME_SISTEMA), MB_ICONINFORMATION);
end;

procedure Erro(Mensagem : string);
begin
  Application.MessageBox(Pchar(Mensagem), PWideChar(NOME_SISTEMA), MB_OK + MB_ICONERROR);
end;

function Pergunta(Pergunta: string): Boolean;
begin
  if Application.MessageBox(PChar(Pergunta), PWideChar(NOME_SISTEMA), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Result := True
  else
    Result := False;
end;

end.
