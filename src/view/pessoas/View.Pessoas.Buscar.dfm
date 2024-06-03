inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'ViewPessoasBuscar'
  ClientWidth = 754
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited pnTop: TPanel
    Width = 754
    ExplicitWidth = 748
  end
  inherited pnGrid: TPanel
    Width = 754
    inherited DBGrid1: TDBGrid
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 64
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CIDADE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Width = 64
          Visible = True
        end>
    end
  end
  inherited pnBottom: TPanel
    Width = 754
    inherited rdGroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome/Fantasia(F2)'
        'Cidade (F3)')
    end
  end
  inherited pnTotal: TPanel
    Width = 754
    inherited lbTotal: TLabel
      Height = 18
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
