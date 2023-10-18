object frmListarVenda: TfrmListarVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 428
  ClientWidth = 774
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 33
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object dbgListarVenda: TDBGrid
    Left = 0
    Top = 33
    Width = 774
    Height = 366
    Align = alClient
    DataSource = DM.dsrVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgListarVendaDrawColumnCell
    OnDblClick = dbgListarVendaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codvenda'
        Title.Caption = 'C'#243'digo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf_cliente'
        Title.Caption = 'Cpf'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_cliente'
        Title.Caption = 'Cliente'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade_cliente'
        Title.Caption = 'Cidade'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf_cliente'
        Title.Caption = 'Uf'
        Width = 26
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 399
    Width = 774
    Height = 29
    Hint = 'Clique aqui para excluir a cidade'
    Align = alBottom
    TabOrder = 2
    object btnExcluir: TBitBtn
      Left = 677
      Top = 1
      Width = 96
      Height = 27
      Hint = 'Clique aqui para excluir a cidade'
      Align = alRight
      Caption = 'E&xcluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnInserir: TBitBtn
      Left = 485
      Top = 1
      Width = 96
      Height = 27
      Hint = 'Clique aqui para adicionar uma cidade'
      Align = alRight
      Caption = '&Inserir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnEditar: TBitBtn
      Left = 581
      Top = 1
      Width = 96
      Height = 27
      Hint = 'Clique aqui para editar a cidade'
      Align = alRight
      Caption = '&Editar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnEditarClick
    end
  end
end
