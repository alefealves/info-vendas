object ModelProdutosDM: TModelProdutosDM
  OnCreate = DataModuleCreate
  Height = 250
  Width = 483
  PixelsPerInch = 120
  object QProdutosCadastro: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      '*'
      'from produtos')
    Left = 128
    Top = 96
    object QProdutosCadastroID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000000'
    end
    object QProdutosCadastroID_SUBGRUPO: TIntegerField
      DisplayLabel = 'C'#243'd. Subgrupo'
      FieldName = 'ID_SUBGRUPO'
      Origin = 'ID_SUBGRUPO'
      DisplayFormat = '000000'
    end
    object QProdutosCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object QProdutosCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object QProdutosCadastroPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'Preco Custo'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      EditFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroPORCENTAGEM: TFMTBCDField
      DisplayLabel = 'Porcentagem'
      FieldName = 'PORCENTAGEM'
      Origin = 'PORCENTAGEM'
      EditFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'Preco Venda'
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      EditFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object QProdutosCadastroCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
    end
  end
  object QLook: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      'nome'
      'from produtos'
      'where (id = :IdProduto)')
    Left = 240
    Top = 160
    ParamData = <
      item
        Name = 'IDPRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QLookNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object QProdutosBusca: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      'p.ID,'
      'p.NOME,'
      'p.PRECO_CUSTO,'
      'p.PORCENTAGEM,'
      'p.PRECO_VENDA,'
      'p.UNIDADE,'
      'p.CODIGO_BARRAS,'
      'p.id_subgrupo,'
      's.nome subgrupo_nome'
      'from produtos p'
      'inner join subgrupos s'
      'on p.id_subgrupo = s.id'
      '')
    Left = 352
    Top = 96
    object QProdutosBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000000'
    end
    object QProdutosBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object QProdutosBuscaPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'Preco Custo'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaPORCENTAGEM: TFMTBCDField
      DisplayLabel = 'Porcentagem'
      FieldName = 'PORCENTAGEM'
      Origin = 'PORCENTAGEM'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'Preco Venda'
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object QProdutosBuscaCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
    end
    object QProdutosBuscaID_SUBGRUPO: TIntegerField
      DisplayLabel = 'C'#243'd. Subgrupo'
      FieldName = 'ID_SUBGRUPO'
      Origin = 'ID_SUBGRUPO'
      DisplayFormat = '000000'
    end
    object QProdutosBuscaSUBGRUPO_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Subgrupo'
      FieldName = 'SUBGRUPO_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
