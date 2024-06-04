object ModelSubgruposDM: TModelSubgruposDM
  Height = 231
  Width = 440
  PixelsPerInch = 120
  object QSubgruposCadastro: TFDQuery
    BeforePost = QSubgruposCadastroBeforePost
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM subgrupos')
    Left = 72
    Top = 96
    object QSubgruposCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object QSubgruposCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
  end
  object QSubgruposBusca: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'SELECT * FROM subgrupos')
    Left = 232
    Top = 96
    object QSubgruposBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '/'
    end
    object QSubgruposBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
  end
  object QLook: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      'nome'
      'from subgrupos'
      'where (id = :IdSubgrupo)')
    Left = 368
    Top = 104
    ParamData = <
      item
        Name = 'IDSUBGRUPO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QLookNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
  end
end
