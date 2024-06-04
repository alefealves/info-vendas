unit View.Pessoas.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Model.Pessoas.DM,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Exceptions.FieldName, Utils, RTTI.FieldName;

type
  TViewPessoasCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    edtID: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtFantasia: TDBEdit;
    edtAtivo: TDBCheckBox;
    edtCliente: TDBCheckBox;
    edtFornecedor: TDBCheckBox;
    Label4: TLabel;
    edtCEP: TDBEdit;
    Label5: TLabel;
    edtID_CIDADE: TDBEdit;
    edtCidade: TEdit;
    Label6: TLabel;
    edtEndereco: TDBEdit;
    Label7: TLabel;
    edtNumero: TDBEdit;
    Label8: TLabel;
    edtBairro: TDBEdit;
    Label9: TLabel;
    edtComplemento: TDBEdit;
    Label10: TLabel;
    edtNascimento: TDBEdit;
    Label11: TLabel;
    edtTelefone: TDBEdit;
    Label12: TLabel;
    edtCelular: TDBEdit;
    Label13: TLabel;
    edtEmail: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label14: TLabel;
    edtCPF: TDBEdit;
    Label15: TLabel;
    edtRG: TDBEdit;
    Label16: TLabel;
    edtCNPJ: TDBEdit;
    Label17: TLabel;
    edtIE: TDBEdit;
    Label18: TLabel;
    edtDH_CADASTRO: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPessoasCadastrar: TViewPessoasCadastrar;

implementation

{$R *.dfm}
procedure TViewPessoasCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelPessoasDM.CadastrarGet(inherited IdRegistroAlterar);
  if (DataSource1.DataSet.IsEmpty) then
    DataSource1.DataSet.Append
  else
    DataSource1.DataSet.Edit;

  edtNome.SetFocus;
end;

procedure TViewPessoasCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;


end.
