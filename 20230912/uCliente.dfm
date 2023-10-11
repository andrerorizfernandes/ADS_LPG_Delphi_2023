object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 139
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
    Height = 108
    Align = alTop
    TabOrder = 0
    object lblNome: TLabel
      Left = 6
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblIdade: TLabel
      Left = 368
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Idade'
    end
    object lblCpf: TLabel
      Left = 431
      Top = 8
      Width = 17
      Height = 13
      Caption = 'Cpf'
    end
    object lblCidade: TLabel
      Left = 6
      Top = 58
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblUf: TLabel
      Left = 539
      Top = 58
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object dbeNome: TDBEdit
      Left = 6
      Top = 23
      Width = 355
      Height = 21
      DataField = 'nome'
      DataSource = DM.dsrCliente
      TabOrder = 0
    end
    object dbeIdade: TDBEdit
      Left = 367
      Top = 23
      Width = 58
      Height = 21
      DataField = 'idade'
      DataSource = DM.dsrCliente
      TabOrder = 1
    end
    object dbeCpf: TDBEdit
      Left = 430
      Top = 23
      Width = 152
      Height = 21
      DataField = 'cpf'
      DataSource = DM.dsrCliente
      TabOrder = 2
    end
    object dblCidade: TDBLookupComboBox
      Left = 6
      Top = 77
      Width = 526
      Height = 21
      DataField = 'codcidade'
      DataSource = DM.dsrCliente
      KeyField = 'codcidade'
      ListField = 'nome;uf'
      ListSource = DM.dsrCidade
      TabOrder = 3
    end
    object dbeUf: TDBEdit
      Left = 536
      Top = 77
      Width = 46
      Height = 21
      TabStop = False
      DataField = 'uf'
      DataSource = DM.dsrCidade
      Enabled = False
      TabOrder = 4
    end
  end
  object btnGravar: TBitBtn
    Left = 384
    Top = 108
    Width = 104
    Height = 31
    Align = alRight
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object btnCancelar: TBitBtn
    Left = 488
    Top = 108
    Width = 104
    Height = 31
    Align = alRight
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
end
