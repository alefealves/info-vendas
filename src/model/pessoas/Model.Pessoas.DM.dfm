object ModelPessoasDM: TModelPessoasDM
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QPessoasCadastro: TFDQuery
    AfterInsert = QPessoasCadastroAfterInsert
    BeforePost = QPessoasCadastroBeforePost
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select * from pessoas')
    Left = 232
    Top = 216
    object QPessoasCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object QPessoasCadastroNOME: TStringField
      DisplayLabel = 'Nome/Razao'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasCadastroFANTASIA: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 60
    end
    object QPessoasCadastroCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroCEP: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '99999-999'
      Size = 10
    end
    object QPessoasCadastroID_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo Cidade'
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      Required = True
    end
    object QPessoasCadastroENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QPessoasCadastroNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object QPessoasCadastroBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object QPessoasCadastroCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object QPessoasCadastroTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '(99)9999-9999'
      Size = 15
    end
    object QPessoasCadastroCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      EditMask = '(99)99999-9999'
      Size = 15
    end
    object QPessoasCadastroEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object QPessoasCadastroTIPO_JURIDICO: TIntegerField
      DisplayLabel = 'Tipo Juridico'
      FieldName = 'TIPO_JURIDICO'
      Origin = 'TIPO_JURIDICO'
    end
    object QPessoasCadastroCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '999.999.999-99'
      Size = 14
    end
    object QPessoasCadastroRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Size = 14
    end
    object QPessoasCadastroCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      EditMask = '99.999.999/9999-99'
      Size = 18
    end
    object QPessoasCadastroIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Size = 14
    end
    object QPessoasCadastroATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroNASCIMENTO: TDateField
      DisplayLabel = 'Nascimento'
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      EditMask = '99/99/9999'
    end
    object QPessoasCadastroDH_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DH_CADASTRO'
      Origin = 'DH_CADASTRO'
    end
  end
  object QPessoasBusca: TFDQuery
    Connection = ModelConnectionDM.FDConnection1
    SQL.Strings = (
      'select '
      'pessoas.ID,'
      'pessoas.NOME NOME_PESSOA,'
      'pessoas.FANTASIA,'
      'pessoas.CLIENTE,'
      'pessoas.FORNECEDOR,'
      'pessoas.ID_CIDADE,'
      'CIDADES.NOME NOME_CIDADE,'
      'CIDADES.UF,'
      'pessoas.ENDERECO,'
      'pessoas.CELULAR'
      'from pessoas'
      'inner join cidades'
      'on (cidades.id = pessoas.id_cidade)'
      'order by pessoas.id')
    Left = 416
    Top = 216
    object QPessoasBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPessoasBuscaNOME_PESSOA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasBuscaFANTASIA: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 60
    end
    object QPessoasBuscaCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscaFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscaID_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo Cidade'
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      Required = True
    end
    object QPessoasBuscaNOME_CIDADE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'NOME_CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QPessoasBuscaUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QPessoasBuscaENDERECO: TStringField
      DisplayLabel = 'Endereco'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QPessoasBuscaCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
  end
end
