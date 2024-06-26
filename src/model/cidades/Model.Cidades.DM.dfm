object ModelCidadesDM: TModelCidadesDM
  Height = 231
  Width = 440
  PixelsPerInch = 120
  object QCidadesCadastro: TFDQuery
    BeforePost = QCidadesCadastroBeforePost
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM CIDADES')
    Left = 72
    Top = 96
    object QCidadesCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object QCidadesCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QCidadesCadastroUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QCidadesCadastroCODIGO_IBGE: TIntegerField
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
  end
  object QCidadesBusca: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM CIDADES')
    Left = 232
    Top = 96
    object QCidadesBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000000'
    end
    object QCidadesBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QCidadesBuscaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QCidadesBuscaCODIGO_IBGE: TIntegerField
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
  end
  object QLook: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      'nome,'
      'uf'
      'from cidades'
      'where (id = :IdCidade)')
    Left = 368
    Top = 104
    ParamData = <
      item
        Name = 'IDCIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QLookNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QLookUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
end
