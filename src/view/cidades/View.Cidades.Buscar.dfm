inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades Buscar'
  ClientWidth = 737
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 749
  ExplicitHeight = 584
  TextHeight = 15
  inherited pnTop: TPanel
    Width = 737
    ExplicitWidth = 731
    inherited edtBuscar: TEdit
      Width = 665
      ExplicitWidth = 659
    end
  end
  inherited pnGrid: TPanel
    Width = 737
    ExplicitWidth = 731
    inherited DBGrid1: TDBGrid
      Width = 737
      Height = 419
    end
  end
  inherited pnBottom: TPanel
    Width = 737
    ExplicitWidth = 731
    inherited rdGroupFiltros: TRadioGroup
      Width = 371
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'UF (F3)')
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
    Width = 737
    ExplicitWidth = 731
    inherited lbTotal: TLabel
      Left = 578
      Height = 18
      ExplicitLeft = 578
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
