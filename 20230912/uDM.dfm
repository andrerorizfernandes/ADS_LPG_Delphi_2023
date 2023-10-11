object DM: TDM
  OldCreateOrder = False
  Height = 389
  Width = 600
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=erp'
      'User_Name=root'
      'Password=18071988'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.6\lib\libmysql.dll'
    Left = 136
    Top = 24
  end
  object qryCidade: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '  c.codcidade,'
      '  c.nome,'
      '  c.uf'
      'FROM cidade c')
    Left = 40
    Top = 96
    object qryCidadecodcidade: TFDAutoIncField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryCidadenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qryCidadeuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 2
    end
  end
  object qryCliente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '  c.codcliente,'
      '  c.nome,'
      '  c.idade,'
      '  c.cpf,'
      '  c.codcidade,'
      '  cd.nome cidade,'
      '  cd.uf'
      'FROM cliente c'
      'INNER JOIN cidade cd ON cd.codcidade = c.codcidade')
    Left = 104
    Top = 96
    object qryClientecodcliente: TFDAutoIncField
      FieldName = 'codcliente'
      Origin = 'codcliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qryClienteidade: TIntegerField
      FieldName = 'idade'
      Origin = 'idade'
      Required = True
    end
    object qryClientecpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      Size = 11
    end
    object qryClientecodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
    object qryClientecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryClienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  object qryVenda: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '  v.codvenda,'
      '  v.codcliente,'
      '  v.descricao,'
      '  v.quantidade,'
      '  v.valor,'
      '  cl.cpf cpf_cliente,'
      '  cl.nome nome_cliente,'
      '  c.nome cidade_cliente,'
      '  c.uf uf_cliente'
      'FROM venda v'
      'INNER JOIN cliente cl ON cl.codcliente = v.codcliente'
      'INNER JOIN cidade c ON c.codcidade = cl.codcidade')
    Left = 168
    Top = 96
    object qryVendacodvenda: TFDAutoIncField
      FieldName = 'codvenda'
      Origin = 'codvenda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryVendacodcliente: TIntegerField
      FieldName = 'codcliente'
      Origin = 'codcliente'
      Required = True
    end
    object qryVendadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object qryVendaquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object qryVendavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 20
      Size = 6
    end
    object qryVendacpf_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf_cliente'
      Origin = 'cpf'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryVendanome_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_cliente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryVendacidade_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade_cliente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryVendauf_cliente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf_cliente'
      Origin = 'uf'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  object dsrCidade: TDataSource
    DataSet = qryCidade
    Left = 40
    Top = 144
  end
  object dsrCliente: TDataSource
    DataSet = qryCliente
    Left = 104
    Top = 144
  end
  object dsrVenda: TDataSource
    DataSet = qryVenda
    Left = 168
    Top = 144
  end
  object qryAuxiliar: TFDQuery
    CachedUpdates = True
    Connection = Conexao
    Left = 232
    Top = 96
  end
end
