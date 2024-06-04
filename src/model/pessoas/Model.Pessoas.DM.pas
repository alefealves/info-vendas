unit Model.Pessoas.DM;

interface

uses
  System.SysUtils, System.Classes, Model.Connection.DM, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Exceptions.FieldName;

type
  TModelPessoasDM = class(TDataModule)
    QPessoasCadastro: TFDQuery;
    QPessoasBusca: TFDQuery;
    QPessoasBuscaID: TIntegerField;
    QPessoasBuscaNOME_PESSOA: TStringField;
    QPessoasBuscaFANTASIA: TStringField;
    QPessoasBuscaCLIENTE: TStringField;
    QPessoasBuscaFORNECEDOR: TStringField;
    QPessoasBuscaID_CIDADE: TIntegerField;
    QPessoasBuscaNOME_CIDADE: TStringField;
    QPessoasBuscaUF: TStringField;
    QPessoasBuscaENDERECO: TStringField;
    QPessoasBuscaCELULAR: TStringField;
    QPessoasCadastroID: TIntegerField;
    QPessoasCadastroNOME: TStringField;
    QPessoasCadastroFANTASIA: TStringField;
    QPessoasCadastroCLIENTE: TStringField;
    QPessoasCadastroFORNECEDOR: TStringField;
    QPessoasCadastroCEP: TStringField;
    QPessoasCadastroID_CIDADE: TIntegerField;
    QPessoasCadastroENDERECO: TStringField;
    QPessoasCadastroNUMERO: TStringField;
    QPessoasCadastroBAIRRO: TStringField;
    QPessoasCadastroCOMPLEMENTO: TStringField;
    QPessoasCadastroTELEFONE: TStringField;
    QPessoasCadastroCELULAR: TStringField;
    QPessoasCadastroEMAIL: TStringField;
    QPessoasCadastroTIPO_JURIDICO: TIntegerField;
    QPessoasCadastroCPF: TStringField;
    QPessoasCadastroCNPJ: TStringField;
    QPessoasCadastroIE: TStringField;
    QPessoasCadastroATIVO: TStringField;
    QPessoasCadastroNASCIMENTO: TDateField;
    QPessoasCadastroDH_CADASTRO: TSQLTimeStampField;
    QPessoasCadastroRG: TStringField;
    procedure QPessoasCadastroAfterInsert(DataSet: TDataSet);
    procedure QPessoasCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure CadastrarGet(const AIdPessoa: Integer);
    procedure PessoasBuscar(const ACondicao: string);
    procedure ValidaDadosQueryCadastro;
  end;

var
  ModelPessoasDM: TModelPessoasDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TModelPessoasDM.CadastrarGet(const AIdPessoa: Integer);
begin
  QPessoasCadastro.Close;
  QPessoasCadastro.SQL.Clear;
  QPessoasCadastro.SQL.Add('select * from pessoas ');
  QPessoasCadastro.SQL.Add('where (id = :IdPessoa)');
  QPessoasCadastro.ParamByName('IdPessoa').AsInteger := AIdPessoa;
  QPessoasCadastro.Open;
end;

procedure TModelPessoasDM.PessoasBuscar(const ACondicao: string);
begin
  QPessoasBusca.Close;
  QPessoasBusca.SQL.Clear;
  QPessoasBusca.SQL.Add('select ');
  QPessoasBusca.SQL.Add('pessoas.ID,');
  QPessoasBusca.SQL.Add('pessoas.NOME NOME_PESSOA,');
  QPessoasBusca.SQL.Add('pessoas.FANTASIA, ');
  QPessoasBusca.SQL.Add('pessoas.CLIENTE, ');
  QPessoasBusca.SQL.Add('pessoas.FORNECEDOR, ');
  QPessoasBusca.SQL.Add('pessoas.ID_CIDADE, ');
  QPessoasBusca.SQL.Add('CIDADES.NOME NOME_CIDADE, ');
  QPessoasBusca.SQL.Add('CIDADES.UF, ');
  QPessoasBusca.SQL.Add('pessoas.ENDERECO, ');
  QPessoasBusca.SQL.Add('pessoas.CELULAR ');
  QPessoasBusca.SQL.Add('from pessoas ');
  QPessoasBusca.SQL.Add('inner join cidades ');
  QPessoasBusca.SQL.Add('on (cidades.id = pessoas.id_cidade) ');
  QPessoasBusca.SQL.Add(ACondicao);
  QPessoasBusca.Open;
end;

procedure TModelPessoasDM.QPessoasCadastroAfterInsert(DataSet: TDataSet);
begin
  QPessoasCadastroATIVO.AsString := 'S';
  QPessoasCadastroCLIENTE.AsString := 'S';
  QPessoasCadastroFORNECEDOR.AsString := 'S';
  QPessoasCadastroDH_CADASTRO.AsDateTime := Now;
  QPessoasCadastroTIPO_JURIDICO.AsInteger := 1;
end;

procedure TModelPessoasDM.QPessoasCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidaDadosQueryCadastro;
end;

procedure TModelPessoasDM.ValidaDadosQueryCadastro;
begin
  if (QPessoasCadastroNOME.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Preencha o campo nome', 'NOME');

  if (QPessoasCadastroFANTASIA.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Preencha o campo fantasia', 'FANTASIA');

  if (QPessoasCadastroID_CIDADE.AsInteger <= 0) then
    raise ExceptionsFieldName.Create('Preencha o campo código cidade', 'ID_CIDADE');
end;

end.

