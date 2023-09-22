object frmCidade: TfrmCidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cidade'
  ClientHeight = 85
  ClientWidth = 512
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
  object pnlCidade: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 57
    Align = alTop
    TabOrder = 0
    object lblNome: TLabel
      Left = 6
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblUF: TLabel
      Left = 440
      Top = 8
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object dbeNome: TDBEdit
      Left = 6
      Top = 23
      Width = 432
      Height = 21
      DataField = 'nome'
      DataSource = DM.dsrCidade
      TabOrder = 0
    end
    object dbcUF: TDBComboBox
      Left = 440
      Top = 23
      Width = 65
      Height = 21
      Style = csDropDownList
      DataField = 'uf'
      DataSource = DM.dsrCidade
      Items.Strings = (
        'ES'
        'RJ'
        'MG'
        'SP')
      TabOrder = 1
    end
  end
  object btnGravar: TBitBtn
    Left = 304
    Top = 57
    Width = 104
    Height = 28
    Align = alRight
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object btnCancelar: TBitBtn
    Left = 408
    Top = 57
    Width = 104
    Height = 28
    Align = alRight
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
end
