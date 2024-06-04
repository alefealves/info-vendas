inherited ViewPessoasCadastrar: TViewPessoasCadastrar
  Caption = 'Pessoas Cadastrar/Alterar'
  ClientHeight = 512
  ClientWidth = 838
  OnShow = FormShow
  ExplicitWidth = 850
  ExplicitHeight = 550
  TextHeight = 15
  inherited pnDados: TPanel
    Width = 838
    Height = 471
    ExplicitWidth = 832
    ExplicitHeight = 462
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 38
      Height = 15
      Caption = 'C'#243'digo'
      FocusControl = edtID
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 82
      Top = 16
      Width = 72
      Height = 15
      Caption = 'Nome/Razao'
      FocusControl = edtNome
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 390
      Top = 21
      Width = 44
      Height = 15
      Caption = 'Fantasia'
      FocusControl = edtFantasia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 104
      Width = 21
      Height = 15
      Caption = 'Cep'
      FocusControl = edtCEP
    end
    object Label5: TLabel
      Left = 102
      Top = 104
      Width = 102
      Height = 15
      Caption = 'C'#243'digo Cidade (F8)'
      FocusControl = edtID_CIDADE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 390
      Top = 104
      Width = 49
      Height = 15
      Caption = 'Endereco'
      FocusControl = edtEndereco
    end
    object Label7: TLabel
      Left = 746
      Top = 104
      Width = 44
      Height = 15
      Caption = 'N'#250'mero'
      FocusControl = edtNumero
    end
    object Label8: TLabel
      Left = 16
      Top = 160
      Width = 31
      Height = 15
      Caption = 'Bairro'
      FocusControl = edtBairro
    end
    object Label9: TLabel
      Left = 390
      Top = 160
      Width = 77
      Height = 15
      Caption = 'Complemento'
      FocusControl = edtComplemento
    end
    object Label10: TLabel
      Left = 746
      Top = 160
      Width = 64
      Height = 15
      Caption = 'Nascimento'
      FocusControl = edtNascimento
    end
    object Label11: TLabel
      Left = 16
      Top = 208
      Width = 44
      Height = 15
      Caption = 'Telefone'
      FocusControl = edtTelefone
    end
    object Label12: TLabel
      Left = 243
      Top = 205
      Width = 37
      Height = 15
      Caption = 'Celular'
      FocusControl = edtCelular
    end
    object Label13: TLabel
      Left = 390
      Top = 208
      Width = 29
      Height = 15
      Caption = 'Email'
      FocusControl = edtEmail
    end
    object Label14: TLabel
      Left = 243
      Top = 264
      Width = 21
      Height = 15
      Caption = 'CPF'
      FocusControl = edtCPF
    end
    object Label15: TLabel
      Left = 349
      Top = 264
      Width = 15
      Height = 15
      Caption = 'RG'
      FocusControl = edtRG
    end
    object Label16: TLabel
      Left = 435
      Top = 264
      Width = 27
      Height = 15
      Caption = 'CNPJ'
      FocusControl = edtCNPJ
    end
    object Label17: TLabel
      Left = 715
      Top = 264
      Width = 9
      Height = 15
      Caption = 'IE'
      FocusControl = edtIE
    end
    object Label18: TLabel
      Left = 16
      Top = 328
      Width = 74
      Height = 15
      Caption = 'Data Cadastro'
      FocusControl = edtDH_CADASTRO
    end
    object edtID: TDBEdit
      Left = 16
      Top = 37
      Width = 60
      Height = 23
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TDBEdit
      Left = 82
      Top = 37
      Width = 302
      Height = 23
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edtFantasia: TDBEdit
      Left = 390
      Top = 37
      Width = 436
      Height = 23
      DataField = 'FANTASIA'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edtAtivo: TDBCheckBox
      Left = 16
      Top = 74
      Width = 50
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edtCliente: TDBCheckBox
      Left = 72
      Top = 74
      Width = 65
      Height = 17
      Caption = 'Cliente'
      DataField = 'CLIENTE'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edtFornecedor: TDBCheckBox
      Left = 143
      Top = 74
      Width = 80
      Height = 17
      Caption = 'Fornecedor'
      DataField = 'FORNECEDOR'
      DataSource = DataSource1
      TabOrder = 5
    end
    object edtCEP: TDBEdit
      Left = 16
      Top = 120
      Width = 80
      Height = 23
      DataField = 'CEP'
      DataSource = DataSource1
      TabOrder = 6
    end
    object edtID_CIDADE: TDBEdit
      Left = 102
      Top = 120
      Width = 80
      Height = 23
      DataField = 'ID_CIDADE'
      DataSource = DataSource1
      TabOrder = 7
      OnExit = edtID_CIDADEExit
      OnKeyDown = edtID_CIDADEKeyDown
    end
    object edtCidade: TEdit
      Left = 184
      Top = 120
      Width = 200
      Height = 23
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtEndereco: TDBEdit
      Left = 390
      Top = 120
      Width = 350
      Height = 23
      DataField = 'ENDERECO'
      DataSource = DataSource1
      TabOrder = 9
    end
    object edtNumero: TDBEdit
      Left = 746
      Top = 120
      Width = 80
      Height = 23
      DataField = 'NUMERO'
      DataSource = DataSource1
      TabOrder = 10
    end
    object edtBairro: TDBEdit
      Left = 16
      Top = 176
      Width = 368
      Height = 23
      DataField = 'BAIRRO'
      DataSource = DataSource1
      TabOrder = 11
    end
    object edtComplemento: TDBEdit
      Left = 390
      Top = 176
      Width = 350
      Height = 23
      DataField = 'COMPLEMENTO'
      DataSource = DataSource1
      TabOrder = 12
    end
    object edtNascimento: TDBEdit
      Left = 746
      Top = 176
      Width = 80
      Height = 23
      DataField = 'NASCIMENTO'
      DataSource = DataSource1
      TabOrder = 13
    end
    object edtTelefone: TDBEdit
      Left = 16
      Top = 224
      Width = 221
      Height = 23
      DataField = 'TELEFONE'
      DataSource = DataSource1
      TabOrder = 14
    end
    object edtCelular: TDBEdit
      Left = 243
      Top = 224
      Width = 141
      Height = 23
      DataField = 'CELULAR'
      DataSource = DataSource1
      TabOrder = 15
    end
    object edtEmail: TDBEdit
      Left = 390
      Top = 224
      Width = 436
      Height = 23
      DataField = 'EMAIL'
      DataSource = DataSource1
      TabOrder = 16
    end
    object rdGroupJuridico: TDBRadioGroup
      Left = 13
      Top = 264
      Width = 224
      Height = 49
      Caption = 'Tipo Jur'#237'dico'
      Columns = 2
      DataField = 'TIPO_JURIDICO'
      DataSource = DataSource1
      Items.Strings = (
        'Pessoa F'#237'sica'
        'Pessoa Jur'#237'dica')
      TabOrder = 17
      Values.Strings = (
        '1'
        '2')
      OnClick = rdGroupJuridicoClick
    end
    object edtCPF: TDBEdit
      Left = 243
      Top = 280
      Width = 100
      Height = 23
      DataField = 'CPF'
      DataSource = DataSource1
      TabOrder = 18
    end
    object edtRG: TDBEdit
      Left = 349
      Top = 280
      Width = 80
      Height = 23
      DataField = 'RG'
      DataSource = DataSource1
      TabOrder = 19
    end
    object edtCNPJ: TDBEdit
      Left = 435
      Top = 280
      Width = 274
      Height = 23
      DataField = 'CNPJ'
      DataSource = DataSource1
      TabOrder = 20
    end
    object edtIE: TDBEdit
      Left = 715
      Top = 280
      Width = 111
      Height = 23
      DataField = 'IE'
      DataSource = DataSource1
      TabOrder = 21
    end
    object edtDH_CADASTRO: TDBEdit
      Left = 16
      Top = 344
      Width = 221
      Height = 23
      Color = clBtnFace
      DataField = 'DH_CADASTRO'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 22
    end
  end
  inherited pnBottom: TPanel
    Top = 471
    Width = 838
    ExplicitTop = 462
    ExplicitWidth = 832
    inherited btnCancelar: TBitBtn
      Left = 707
      ExplicitLeft = 701
    end
    inherited btnGravar: TBitBtn
      Left = 577
      ExplicitLeft = 571
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasCadastro
    Left = 688
    Top = 64
  end
end
