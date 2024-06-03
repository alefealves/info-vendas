inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades Buscar'
  ClientHeight = 546
  ClientWidth = 737
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 749
  TextHeight = 15
  inherited pnTop: TPanel
    Width = 737
    inherited edtBuscar: TEdit
      Width = 677
      ExplicitWidth = 683
    end
  end
  inherited pnGrid: TPanel
    Width = 737
    Height = 419
    inherited DBGrid1: TDBGrid
      Width = 737
      Height = 419
    end
  end
  inherited pnBottom: TPanel
    Top = 496
    Width = 737
    inherited rdGroupFiltros: TRadioGroup
      Width = 371
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'UF (F3)')
    end
    inherited btnCadastrar: TBitBtn
      Left = 372
    end
    inherited btnUtilizar: TBitBtn
      Left = 554
    end
    inherited btnFechar: TBitBtn
      Left = 645
    end
    inherited btnAlterar: TBitBtn
      Left = 463
    end
  end
  inherited pnTotal: TPanel
    Top = 476
    Width = 737
    inherited lbTotal: TLabel
      Left = 578
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
