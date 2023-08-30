object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 276
  ClientWidth = 525
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
  object gbxControles: TGroupBox
    Left = 0
    Top = 0
    Width = 525
    Height = 68
    Align = alTop
    Caption = ' Opera'#231#245'es '
    TabOrder = 0
    object lblValor1: TLabel
      Left = 10
      Top = 18
      Width = 33
      Height = 13
      Caption = 'Valor 1'
    end
    object lblValor2: TLabel
      Left = 184
      Top = 18
      Width = 33
      Height = 13
      Caption = 'Valor 2'
    end
    object lblOperacao: TLabel
      Left = 336
      Top = 18
      Width = 47
      Height = 13
      Caption = 'Opera'#231#227'o'
    end
    object edtValor1: TEdit
      Left = 10
      Top = 34
      Width = 168
      Height = 21
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 0
    end
    object edtValor2: TEdit
      Left = 184
      Top = 34
      Width = 146
      Height = 21
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 1
    end
    object cboOperacao: TComboBox
      Left = 336
      Top = 34
      Width = 180
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnKeyDown = cboOperacaoKeyDown
    end
  end
  object gbxResultado: TGroupBox
    Left = 0
    Top = 68
    Width = 525
    Height = 173
    Align = alTop
    Caption = ' Resultados '
    TabOrder = 1
    object lbxResultado: TListBox
      Left = 2
      Top = 15
      Width = 521
      Height = 156
      Align = alClient
      Color = 16316664
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object btnCalcular: TButton
    Left = 323
    Top = 241
    Width = 101
    Height = 35
    Hint = 'Clique aqui para calcular'
    Align = alRight
    Caption = '&Calcular'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnCalcularClick
    ExplicitLeft = 424
  end
  object btnLimpar: TButton
    Left = 424
    Top = 241
    Width = 101
    Height = 35
    Hint = 'Clique aqui para limpar os dados da tela'
    Align = alRight
    Caption = '&Limpar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnLimparClick
  end
end
