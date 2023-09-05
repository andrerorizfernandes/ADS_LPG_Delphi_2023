object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Armazenamento de dados em mem'#243'ria'
  ClientHeight = 465
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object gbxDados: TGroupBox
    Left = 0
    Top = 0
    Width = 769
    Height = 337
    Align = alTop
    Caption = ' Dados '
    TabOrder = 0
    ExplicitWidth = 648
    object dbgDados: TDBGrid
      Left = 2
      Top = 15
      Width = 765
      Height = 320
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
    end
  end
  object gbxControle: TGroupBox
    Left = 0
    Top = 337
    Width = 769
    Height = 90
    Align = alTop
    Caption = ' Controles '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 194
      Height = 13
      Caption = 'Posicionar cursor no registro de posi'#231#227'o:'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 191
      Height = 13
      Caption = 'Filtrar animais por quantidade de patas:'
    end
    object edtPosicao: TEdit
      Left = 206
      Top = 16
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnChange = edtPosicaoChange
    end
    object edtQuantidade: TEdit
      Left = 206
      Top = 56
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      OnChange = edtQuantidadeChange
    end
  end
  object btnMensagem: TBitBtn
    Left = 289
    Top = 427
    Width = 160
    Height = 38
    Align = alRight
    Caption = 'Exibir dados registro &atual'
    TabOrder = 2
    OnClick = btnMensagemClick
    ExplicitLeft = 319
  end
  object BitBtn1: TBitBtn
    Left = 449
    Top = 427
    Width = 160
    Height = 38
    Align = alRight
    Caption = 'Exibir dados de &todos registros'
    TabOrder = 3
    OnClick = BitBtn1Click
    ExplicitLeft = 469
  end
  object BitBtn2: TBitBtn
    Left = 609
    Top = 427
    Width = 160
    Height = 38
    Align = alRight
    Caption = 'Exibir &quantidade de registros'
    TabOrder = 4
    OnClick = BitBtn2Click
    ExplicitLeft = 619
  end
end
