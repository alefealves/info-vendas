unit Model.Cidades.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Connection.DM;

type
  TModelCidadesDM = class(TDataModule)
    QCidadesCadastro: TFDQuery;
    QCidadesBusca: TFDQuery;
    QCidadesCadastroID: TIntegerField;
    QCidadesCadastroNOME: TStringField;
    QCidadesCadastroUF: TStringField;
    QCidadesCadastroCODIGO_IBGE: TIntegerField;
    QCidadesBuscaID: TIntegerField;
    QCidadesBuscaNOME: TStringField;
    QCidadesBuscaUF: TStringField;
    QCidadesBuscaCODIGO_IBGE: TIntegerField;
    procedure QCidadesCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure CidadesBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdCidade: Integer);
    procedure ValidaDadosQueryCadastro;
  end;

var
  ModelCidadesDM: TModelCidadesDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Exceptions.FieldName;

procedure TModelCidadesDM.CadastrarGet(const AIdCidade: Integer);
begin
  QCidadesCadastro.Close;
  QCidadesCadastro.SQL.Clear;
  QCidadesCadastro.SQL.Add('select * from cidades ');
  QCidadesCadastro.SQL.Add('where (id = :IdCidade)');
  QCidadesCadastro.ParamByName('IdCidade').AsInteger := AIdCidade;
  QCidadesCadastro.Open;
end;

procedure TModelCidadesDM.CidadesBuscar(const ACondicao: string);
begin
  QCidadesBusca.Close;
  QCidadesBusca.SQL.Clear;
  QCidadesBusca.SQL.Add('select * from cidades ');
  QCidadesBusca.SQL.Add(ACondicao);
  QCidadesBusca.Open;
end;

procedure TModelCidadesDM.QCidadesCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidaDadosQueryCadastro;
end;

procedure TModelCidadesDM.ValidaDadosQueryCadastro;
begin
  if (QCidadesCadastroNOME.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Preencha o campo nome', 'NOME');

  if (QCidadesCadastroUF.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Preencha o campo UF', 'UF');

  if (QCidadesCadastroCODIGO_IBGE.AsInteger > 0) then
  begin
    if (Length(QCidadesCadastroCODIGO_IBGE.AsString) <> 7) then
      raise ExceptionsFieldName.Create('Código do IBGE deve conter 7 dígitos.', 'CODIGO_IBGE');
  end;
end;

end.
