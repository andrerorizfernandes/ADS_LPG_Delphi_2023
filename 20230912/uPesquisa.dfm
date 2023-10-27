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
  object lblQuantidadeRegistros: TLabel
    Left = 0
    Top = 435
    Width = 907
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = '0 Registros '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 840
    ExplicitWidth = 67
  end
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
      OnClick = btnImprimirClick
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
      OnClick = btnExportarClick
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 110
    Width = 907
    Height = 325
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
      OnKeyPress = edtValorKeyPress
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
  object dppRelatorio: TppDBPipeline
    DataSource = DM.dsrPesquisa
    UserName = 'dppRelatorio'
    Left = 472
    Top = 296
  end
  object ppRelatorio: TppReport
    AutoStop = False
    DataPipeline = dppRelatorio
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Users\andre\Downloads\ADS_LPG_Delphi_2023\20230912\Report\Rel' +
      '_Cidade.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ConnectionSettings.MailService = 'SMTP'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.EnableMultiPlugin = False
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    ThumbnailSettings.ThumbnailSize = tsSmall
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.DigitalSignatureSettings.SignPDF = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.DropBoxSettings.DirectorySupport = True
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.GoogleDriveSettings.DirectorySupport = False
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.OneDriveSettings.DirectorySupport = True
    Left = 544
    Top = 296
    Version = '21.05'
    mmColumnWidth = 0
    DataPipelineName = 'dppRelatorio'
    object ppHeaderBand1: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 8731
        mmTop = 14815
        mmWidth = 10319
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Border.mmPadding = 0
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 14815
        mmWidth = 8467
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Border.mmPadding = 0
        Caption = 'Uf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 14817
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Border.mmPadding = 0
        Caption = 'Relat'#243'rio de cidades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 5821
        mmLeft = 74480
        mmTop = 4498
        mmWidth = 50006
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 795
        mmLeft = 5556
        mmTop = 11906
        mmWidth = 187855
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object dbtCodigo: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'dbtCodigo'
        Border.mmPadding = 0
        DataPipeline = dppRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dppRelatorio'
        mmHeight = 3704
        mmLeft = 8731
        mmTop = -265
        mmWidth = 17993
        BandType = 4
        LayerName = Foreground
      end
      object dbtCidade: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'dbtCidade'
        Border.mmPadding = 0
        DataPipeline = dppRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dppRelatorio'
        mmHeight = 3704
        mmLeft = 27781
        mmTop = -265
        mmWidth = 68264
        BandType = 4
        LayerName = Foreground
      end
      object dbtUf: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'dbtUf'
        Border.mmPadding = 0
        DataPipeline = dppRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dppRelatorio'
        mmHeight = 3704
        mmLeft = 97365
        mmTop = -265
        mmWidth = 68264
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 90090
        mmTop = 1585
        mmWidth = 18786
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
