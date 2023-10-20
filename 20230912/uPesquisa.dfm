object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 477
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rdgTipoPesquisa: TRadioGroup
    Left = 0
    Top = 0
    Width = 907
    Height = 49
    Align = alTop
    Caption = ' Selecione o tipo de pesquisa '
    Columns = 3
    Items.Strings = (
      'Cidade'
      'Cliente'
      'Venda')
    TabOrder = 0
    OnClick = rdgTipoPesquisaClick
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 448
    Width = 907
    Height = 29
    Hint = 'Clique aqui para excluir a cidade'
    Align = alBottom
    TabOrder = 3
    object btnSair: TBitBtn
      Left = 810
      Top = 1
      Width = 96
      Height = 27
      Hint = 'Clique aqui para excluir a cidade'
      Align = alRight
      Caption = '&Sair'
      ModalResult = 8
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object btnImprimir: TBitBtn
      Left = 618
      Top = 1
      Width = 96
      Height = 27
      Align = alRight
      Caption = '&Imprimir'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object btnExportar: TBitBtn
      Left = 714
      Top = 1
      Width = 96
      Height = 27
      Hint = 'Clique aqui para editar a cidade'
      Align = alRight
      Caption = '&Exportar'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 110
    Width = 907
    Height = 338
    Align = alClient
    DataSource = DM.dsrPesquisa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgPesquisaDrawColumnCell
  end
  object gbxParametrosPesquisa: TGroupBox
    Left = 0
    Top = 49
    Width = 907
    Height = 61
    Align = alTop
    Caption = ' Selecione os par'#226'metros da pesquisa '
    TabOrder = 1
    Visible = False
    object lblCampo: TLabel
      Left = 9
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Campo'
    end
    object lblTipoOperacao: TLabel
      Left = 195
      Top = 15
      Width = 83
      Height = 13
      Caption = 'Tipo de opera'#231#227'o'
    end
    object lblValor: TLabel
      Left = 381
      Top = 15
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object cboCampo: TComboBox
      Left = 9
      Top = 30
      Width = 179
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object cboTipoOperacao: TComboBox
      Left = 195
      Top = 30
      Width = 179
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        'Igual'
        'Diferente'
        'Inciado por'
        'Finalizado por'
        'Que contenha')
    end
    object edtValor: TEdit
      Left = 381
      Top = 30
      Width = 439
      Height = 21
      TabOrder = 2
    end
    object btnPesquisar: TBitBtn
      Left = 825
      Top = 27
      Width = 75
      Height = 26
      Caption = '&Pesquisar'
      TabOrder = 3
      OnClick = btnPesquisarClick
    end
  end
end
