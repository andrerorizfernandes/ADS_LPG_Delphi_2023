object frmListarCliente: TfrmListarCliente
  Left = 0
  Top = 0
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 33
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object dbgListarCliente: TDBGrid
    Left = 0
    Top = 33
    Width = 774
    Height = 366
    Align = alClient
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
      ExplicitLeft = 678
      ExplicitTop = 6
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
      ExplicitLeft = 575
      ExplicitTop = 6
    end
  end
end