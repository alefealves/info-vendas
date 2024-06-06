inherited ViewProdutosBuscar: TViewProdutosBuscar
  Caption = 'Produtos Buscar'
  ClientHeight = 555
  ClientWidth = 737
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 749
  TextHeight = 15
  inherited pnTop: TPanel
    Width = 737
    ExplicitWidth = 731
    inherited edtBuscar: TEdit
      Width = 641
      ExplicitWidth = 635
    end
  end
  inherited pnGrid: TPanel
    Width = 737
    Height = 428
    ExplicitWidth = 731
    inherited DBGrid1: TDBGrid
      Width = 737
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAGEM'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_BARRAS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_SUBGRUPO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBGRUPO_NOME'
          Width = 64
          Visible = True
        end>
    end
  end
  inherited pnBottom: TPanel
    Top = 505
    Width = 737
    ExplicitWidth = 731
    inherited rdGroupFiltros: TRadioGroup
      Width = 371
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'C'#243'digo Barras (F3)'
        'Subgrupo (F4)')
      ExplicitWidth = 365
    end
    inherited btnCadastrar: TBitBtn
      Left = 372
      ExplicitLeft = 366
    end
    inherited btnUtilizar: TBitBtn
      Left = 554
      ExplicitLeft = 548
    end
    inherited btnFechar: TBitBtn
      Left = 645
      ExplicitLeft = 639
    end
    inherited btnAlterar: TBitBtn
      Left = 463
      ExplicitLeft = 457
    end
  end
  inherited pnTotal: TPanel
    Top = 485
    Width = 737
    ExplicitWidth = 731
    inherited lbTotal: TLabel
      Left = 578
      Height = 18
      ExplicitLeft = 578
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelProdutosDM.QProdutosBusca
  end
end
