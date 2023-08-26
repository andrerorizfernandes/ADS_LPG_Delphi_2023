object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aula inicial'
  ClientHeight = 314
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object btnApresentacao: TButton
    Left = 224
    Top = 128
    Width = 89
    Height = 25
    Caption = 'Apresenta'#231#227'o'
    TabOrder = 0
    OnClick = btnApresentacaoClick
  end
  object edtMensagem: TEdit
    Left = 224
    Top = 56
    Width = 201
    Height = 21
    TabOrder = 1
  end
end
