object ModelVendasDM: TModelVendasDM
  Height = 300
  Width = 591
  PixelsPerInch = 120
  object QVendasCadastrar: TFDQuery
    AfterInsert = QVendasCadastrarAfterInsert
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select '
      '*'
      'from vendas'
      'where (id = :IdVenda)'
      '')
    Left = 64
    Top = 40
    ParamData = <
      item
        Name = 'IDVENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QVendasCadastrarID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QVendasCadastrarID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      Required = True
    end
    object QVendasCadastrarDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object QVendasCadastrarHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      Required = True
    end
    object QVendasCadastrarTOTAL_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasCadastrarTOTAL_DESCONTOS: TFMTBCDField
      FieldName = 'TOTAL_DESCONTOS'
      Origin = 'TOTAL_DESCONTOS'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasCadastrarTOTAL_ACRESCIMOS: TFMTBCDField
      FieldName = 'TOTAL_ACRESCIMOS'
      Origin = 'TOTAL_ACRESCIMOS'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasCadastrarTOTAL_LIQUIDO: TFMTBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
  end
  object QVendasItensCadastrar: TFDQuery
    AfterInsert = QVendasItensCadastrarAfterInsert
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      '*'
      'from vendas_itens'
      'where (id = :IdItem)')
    Left = 72
    Top = 128
    ParamData = <
      item
        Name = 'IDITEM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QVendasItensCadastrarID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = ',,0.00'
    end
    object QVendasItensCadastrarID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      Required = True
    end
    object QVendasItensCadastrarID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object QVendasItensCadastrarQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensCadastrarVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensCadastrarDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensCadastrarACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensCadastrarTOTAL_LIQUIDO: TFMTBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensCadastrarTOTAL_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
  end
  object QVendasItensListar: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      'vi.*,'
      'p.nome produto_nome,'
      'p.imagem'
      'from vendas_itens vi'
      'join produtos p '
      'on (vi.id_produto = p.id)'
      'where (vi.id_venda = :IdVenda)')
    Left = 264
    Top = 48
    ParamData = <
      item
        Name = 'IDVENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QVendasItensListarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000000'
    end
    object QVendasItensListarID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      Required = True
      DisplayFormat = '000000'
    end
    object QVendasItensListarID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      DisplayFormat = '000000'
    end
    object QVendasItensListarQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensListarVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensListarDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensListarACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensListarTOTAL_LIQUIDO: TFMTBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      DisplayFormat = ',,0.00'
      Precision = 18
      Size = 2
    end
    object QVendasItensListarPRODUTO_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO_NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QVendasItensListarTOTAL_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object QVendasItensListarIMAGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMAGEM'
      Origin = 'IMAGEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object QVendasTotalizar: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select'
      'sum(vi.quantidade) as TotalQuantidade,'
      'sum(vi.total_bruto) as TotalBruto,'
      'sum(vi.desconto) as TotalDesconto,'
      'sum(vi.acrescimo) as TotalAcrescimo,'
      'sum(vi.total_liquido) as TotalLiquido'
      'from vendas_itens vi'
      'where (vi.id_venda = :IdVenda)')
    Left = 272
    Top = 144
    ParamData = <
      item
        Name = 'IDVENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QVendasTotalizarTOTALQUANTIDADE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALQUANTIDADE'
      Origin = 'TOTALQUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QVendasTotalizarTOTALBRUTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALBRUTO'
      Origin = 'TOTALBRUTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QVendasTotalizarTOTALDESCONTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALDESCONTO'
      Origin = 'TOTALDESCONTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QVendasTotalizarTOTALACRESCIMO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALACRESCIMO'
      Origin = 'TOTALACRESCIMO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QVendasTotalizarTOTALLIQUIDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALLIQUIDO'
      Origin = 'TOTALLIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
