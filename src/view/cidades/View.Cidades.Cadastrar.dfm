inherited ViewCidadesCadastrar: TViewCidadesCadastrar
  Caption = 'Cidades Cadastrar/Alterar'
  ClientHeight = 303
  ClientWidth = 604
  OnShow = FormShow
  ExplicitWidth = 616
  ExplicitHeight = 341
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 604
    Height = 262
    ExplicitWidth = 598
    ExplicitHeight = 253
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
      FocusControl = edtNome
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 120
      Width = 15
      Height = 15
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 176
      Width = 66
      Height = 15
      Caption = 'C'#243'digo IBGE'
      FocusControl = edtCodigoIBGE
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
      Top = 88
      Width = 480
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edtCodigoIBGE: TDBEdit
      Left = 16
      Top = 197
      Width = 145
      Height = 23
      DataField = 'CODIGO_IBGE'
      DataSource = DataSource1
      TabOrder = 3
    end
    object cBoxUP: TDBComboBox
      Left = 16
      Top = 139
      Width = 145
      Height = 23
      Style = csDropDownList
      DataField = 'UF'
      DataSource = DataSource1
      DropDownCount = 28
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO'
        'EX')
      TabOrder = 2
    end
  end
  inherited pnBottom: TPanel
    Top = 262
    Width = 604
    ExplicitTop = 253
    ExplicitWidth = 598
    inherited btnCancelar: TBitBtn
      Left = 473
      TabOrder = 1
      ExplicitLeft = 467
    end
    inherited btnGravar: TBitBtn
      Left = 343
      TabOrder = 0
      ExplicitLeft = 337
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesCadastro
    Left = 536
    Top = 32
  end
end
