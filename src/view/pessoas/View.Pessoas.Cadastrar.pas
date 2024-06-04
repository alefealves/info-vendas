unit View.Pessoas.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Model.Pessoas.DM,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Exceptions.FieldName, Utils, RTTI.FieldName, View.Cidades.Buscar;

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
    procedure edtID_CIDADEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtID_CIDADEExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPessoasCadastrar: TViewPessoasCadastrar;

implementation

{$R *.dfm}

uses
  Model.Cidades.DM;

procedure TViewPessoasCadastrar.edtID_CIDADEExit(Sender: TObject);
var
   LModelCidadesDM: TModelCidadesDM;
begin
  inherited;

  edtCidade.Clear;
  if(Trim(edtID_CIDADE.Text).IsEmpty)then
    Exit;

  LModelCidadesDM := TModelCidadesDM.Create(nil);

  try
    LModelCidadesDM.LookCidade(StrToIntDef(edtID_CIDADE.Text,0));
    if(LModelCidadesDM.QLook.IsEmpty)then
    begin
      edtID_CIDADE.SetFocus;
      raise Exception.Create('Cidade não localizada');
    end;

    edtCidade.Text := LModelCidadesDM.QLookNOME.AsString + ' / ' +
                      LModelCidadesDM.QLookUF.AsString;

  finally
    LModelCidadesDM.Free;
  end;

end;

procedure TViewPessoasCadastrar.edtID_CIDADEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F8)then
  begin
    ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);
    try
      if(ViewCidadesBuscar.ShowModal = mrOk)then
        edtID_CIDADE.Text := ViewCidadesBuscar.IdSelecionado.ToString;
    finally
      FreeAndNil(ViewCidadesBuscar);
    end;
  end;
end;

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
