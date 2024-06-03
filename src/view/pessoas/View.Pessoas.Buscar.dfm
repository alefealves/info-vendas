inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'ViewPessoasBuscar'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 760
  ExplicitHeight = 584
  TextHeight = 15
  inherited pnGrid: TPanel
    inherited DBGrid1: TDBGrid
      Width = 748
      Height = 419
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PESSOA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Visible = True
        end>
    end
  end
  inherited pnBottom: TPanel
    inherited rdGroupFiltros: TRadioGroup
      Width = 382
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome/Fantasia(F2)'
        'Cidade (F3)')
    end
    inherited btnCadastrar: TBitBtn
      Left = 383
    end
    inherited btnUtilizar: TBitBtn
      Left = 565
    end
    inherited btnFechar: TBitBtn
      Left = 656
    end
    inherited btnAlterar: TBitBtn
      Left = 474
    end
  end
  inherited pnTotal: TPanel
    inherited lbTotal: TLabel
      Left = 589
      Height = 18
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
