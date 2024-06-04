inherited ViewSubgruposCadastrar: TViewSubgruposCadastrar
  Caption = 'Subgrupos Cadastrar/Alterar'
  ClientHeight = 304
  ClientWidth = 555
  OnShow = FormShow
  ExplicitWidth = 567
  ExplicitHeight = 342
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 555
    Height = 263
    ExplicitWidth = 549
    ExplicitHeight = 254
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 38
      Height = 15
      Caption = 'C'#243'digo'
      FocusControl = edtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 34
      Height = 15
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TDBEdit
      Left = 16
      Top = 40
      Width = 145
      Height = 23
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TDBEdit
      Left = 16
      Top = 93
      Width = 480
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  inherited pnBottom: TPanel
    Top = 263
    Width = 555
    ExplicitTop = 254
    ExplicitWidth = 549
    inherited btnCancelar: TBitBtn
      Left = 424
      TabOrder = 1
      ExplicitLeft = 418
    end
    inherited btnGravar: TBitBtn
      Left = 294
      TabOrder = 0
      ExplicitLeft = 288
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelSubgruposDM.QSubgruposCadastro
    Left = 488
    Top = 24
  end
end
