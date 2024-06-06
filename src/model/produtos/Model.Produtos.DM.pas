unit Model.Produtos.DM;

interface

uses
  System.SysUtils, System.Classes, Model.Connection.DM, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TModelProdutosDM = class(TDataModule)
    QProdutosCadastro: TFDQuery;
    QLook: TFDQuery;
    QProdutosBusca: TFDQuery;
    QProdutosCadastroID: TIntegerField;
    QProdutosCadastroID_SUBGRUPO: TIntegerField;
    QProdutosCadastroNOME: TStringField;
    QProdutosCadastroDESCRICAO: TStringField;
    QProdutosCadastroPRECO_CUSTO: TFMTBCDField;
    QProdutosCadastroPORCENTAGEM: TFMTBCDField;
    QProdutosCadastroPRECO_VENDA: TFMTBCDField;
    QProdutosCadastroUNIDADE: TStringField;
    QProdutosCadastroCODIGO_BARRAS: TStringField;
    QProdutosBuscaID: TIntegerField;
    QProdutosBuscaNOME: TStringField;
    QProdutosBuscaPRECO_CUSTO: TFMTBCDField;
    QProdutosBuscaPORCENTAGEM: TFMTBCDField;
    QProdutosBuscaPRECO_VENDA: TFMTBCDField;
    QProdutosBuscaUNIDADE: TStringField;
    QProdutosBuscaCODIGO_BARRAS: TStringField;
    QProdutosBuscaID_SUBGRUPO: TIntegerField;
    QProdutosBuscaSUBGRUPO_NOME: TStringField;
    QProdutosCadastroIMAGEM: TStringField;
    QLookID: TIntegerField;
    QLookNOME: TStringField;
    QLookPRECO_VENDA: TFMTBCDField;
    QLookUNIDADE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure QProdutosCadastroAfterInsert(DataSet: TDataSet);
    procedure QProdutosCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure ProdutosBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdProduto: Integer);
    procedure ValidaDadosQueryCadastro;
    function LookProduto(const ACodBarras: string): Boolean;
  end;

var
  ModelProdutosDM: TModelProdutosDM;
  Query_QProdutosBusca: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Exceptions.FieldName;

procedure TModelProdutosDM.CadastrarGet(const AIdProduto: Integer);
begin
  QProdutosCadastro.Close;
  QProdutosCadastro.SQL.Clear;
  QProdutosCadastro.SQL.Add('select * from produtos ');
  QProdutosCadastro.SQL.Add('where (id = :IdProduto)');
  QProdutosCadastro.ParamByName('IdProduto').AsInteger := AIdProduto;
  QProdutosCadastro.Open;
end;

procedure TModelProdutosDM.ProdutosBuscar(const ACondicao: string);
begin
  QProdutosBusca.Close;
  QProdutosBusca.SQL.Clear;
  QProdutosBusca.SQL.Text := Query_QProdutosBusca;
  QProdutosBusca.SQL.Add(ACondicao);
  QProdutosBusca.Open;
end;

procedure TModelProdutosDM.QProdutosCadastroAfterInsert(DataSet: TDataSet);
begin
  QProdutosCadastroPRECO_CUSTO.AsFloat := 0;
  QProdutosCadastroPORCENTAGEM.AsFloat := 0;
  QProdutosCadastroPRECO_VENDA.AsFloat := 0;
  QProdutosCadastroUNIDADE.AsString := 'UN';
end;

procedure TModelProdutosDM.QProdutosCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidaDadosQueryCadastro;
end;

function TModelProdutosDM.LookProduto(const ACodBarras: string): Boolean;
begin

  QLook.Close;
  QLook.ParamByName('CodBarras').AsString := ACodBarras;
  QLook.Open;

  Result := not QLook.IsEmpty;
end;

procedure TModelProdutosDM.DataModuleCreate(Sender: TObject);
begin
  Query_QProdutosBusca := QProdutosBusca.SQL.Text;
end;

procedure TModelProdutosDM.ValidaDadosQueryCadastro;
begin
  if (QProdutosCadastroNOME.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Preencha o campo nome', QProdutosCadastroNOME.FieldName);

  if (QProdutosCadastroDESCRICAO.AsString.Trim.IsEmpty) and (QProdutosCadastroDESCRICAO.AsString.Trim.Length < 10) then
    raise ExceptionsFieldName.Create('Preencha o campo descrição com no mínimo 10 caracteres', QProdutosCadastroNOME.FieldName);

  if (QProdutosCadastroID_SUBGRUPO.AsInteger <= 0) then
    raise ExceptionsFieldName.Create('Preencha o campo código subgrupo', QProdutosCadastroID_SUBGRUPO.FieldName);

  if (QProdutosCadastroPRECO_CUSTO.AsFloat < 0) then
    raise ExceptionsFieldName.Create('Preencha o campo preco custo', QProdutosCadastroPRECO_CUSTO.FieldName);

  if (QProdutosCadastroPORCENTAGEM.AsFloat < 0) then
    raise ExceptionsFieldName.Create('Preencha o campo porcentagem', QProdutosCadastroPORCENTAGEM.FieldName);

  if (QProdutosCadastroPRECO_VENDA.AsFloat <= 0) then
    raise ExceptionsFieldName.Create('Preencha o campo preco de venda', QProdutosCadastroPRECO_VENDA.FieldName);

  if (QProdutosCadastroPRECO_VENDA.AsFloat < QProdutosCadastroPRECO_CUSTO.AsFloat) then
    raise ExceptionsFieldName.Create('O preco de venda não pode ser menor que o preco de custo', QProdutosCadastroPRECO_VENDA.FieldName);

  if (QProdutosCadastroUNIDADE.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Informe a unidade', QProdutosCadastroUNIDADE.FieldName);

  if (QProdutosCadastroCODIGO_BARRAS.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Informe a código de barras', QProdutosCadastroCODIGO_BARRAS.FieldName);

end;

end.
