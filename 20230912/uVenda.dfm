object frmVenda: TfrmVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Venda'
  ClientHeight = 131
  ClientWidth = 592
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
  object pnlCliente: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 97
    Align = alTop
    TabOrder = 0
    object lblDescricao: TLabel
      Left = 6
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lblQuantidade: TLabel
      Left = 368
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object lblValor: TLabel
      Left = 431
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lblCliente: TLabel
      Left = 6
      Top = 53
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lblUf: TLabel
      Left = 536
      Top = 53
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object lblCidade: TLabel
      Left = 431
      Top = 53
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object dbeDescricao: TDBEdit
      Left = 6
      Top = 23
      Width = 355
      Height = 21
      DataField = 'descricao'
      DataSource = DM.dsrVenda
      TabOrder = 0
    end
    object dbeQuantidade: TDBEdit
      Left = 367
      Top = 23
      Width = 58
      Height = 21
      DataField = 'quantidade'
      DataSource = DM.dsrVenda
      TabOrder = 1
    end
    object dbeValor: TDBEdit
      Left = 430
      Top = 23
      Width = 152
      Height = 21
      DataField = 'valor'
      DataSource = DM.dsrVenda
      TabOrder = 2
    end
    object dblCliente: TDBLookupComboBox
      Left = 6
      Top = 68
      Width = 418
      Height = 21
      DataField = 'codcliente'
      DataSource = DM.dsrVenda
      KeyField = 'codcliente'
      ListField = 'nome'
      ListSource = DM.dsrCliente
      TabOrder = 3
    end
    object dbeUf: TDBEdit
      Left = 536
      Top = 68
      Width = 46
      Height = 21
      TabStop = False
      DataField = 'uf'
      DataSource = DM.dsrCliente
      Enabled = False
      TabOrder = 5
    end
    object dbeCidade: TDBEdit
      Left = 431
      Top = 68
      Width = 99
      Height = 21
      TabStop = False
      DataField = 'cidade'
      DataSource = DM.dsrCliente
      Enabled = False
      TabOrder = 4
    end
  end
  object btnGravar: TBitBtn
    Left = 384
    Top = 97
    Width = 104
    Height = 34
    Align = alRight
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
    ExplicitTop = 108
    ExplicitHeight = 31
  end
  object btnCancelar: TBitBtn
    Left = 488
    Top = 97
    Width = 104
    Height = 34
    Align = alRight
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
    ExplicitTop = 108
    ExplicitHeight = 31
  end
end
