inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Buscar Cidades'
  ClientHeight = 546
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited pnTop: TPanel
    inherited edtBuscar: TEdit
      Width = 677
      ExplicitWidth = 683
    end
  end
  inherited pnGrid: TPanel
    Height = 419
    inherited DBGrid1: TDBGrid
      Height = 419
    end
  end
  inherited pnBottom: TPanel
    Top = 496
    inherited rdGroupFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'UF')
    end
  end
  inherited pnTotal: TPanel
    Top = 476
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
