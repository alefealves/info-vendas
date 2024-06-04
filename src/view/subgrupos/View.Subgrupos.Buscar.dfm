inherited ViewSubgruposBuscar: TViewSubgruposBuscar
  Caption = 'Subgupos Buscar'
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
      Width = 653
      ExplicitWidth = 647
    end
  end
  inherited pnGrid: TPanel
    Width = 737
    Height = 428
    ExplicitWidth = 737
    inherited DBGrid1: TDBGrid
      Width = 737
      Height = 419
    end
  end
  inherited pnBottom: TPanel
    Top = 505
    Width = 737
    ExplicitWidth = 737
    inherited rdGroupFiltros: TRadioGroup
      Width = 371
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)')
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
    ExplicitWidth = 737
    inherited lbTotal: TLabel
      Left = 578
      ExplicitLeft = 578
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelSubgruposDM.QSubgruposBusca
  end
end
