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
    QLookNOME: TStringField;
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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ProdutosBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdProduto: Integer);
    procedure ValidaDadosQueryCadastro;
    procedure LookProduto(const AIdProduto: Integer);
  end;

var
  Query_QProdutosBusca: string;
  ModelProdutosDM: TModelProdutosDM;

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

procedure TModelProdutosDM.LookProduto(const AIdProduto: Integer);
begin
  QLook.Close;
  QLook.ParamByName('IdProduto').AsInteger := AIdProduto;
  QLook.Open;
end;

procedure TModelProdutosDM.DataModuleCreate(Sender: TObject);
begin
  Query_QProdutosBusca := QProdutosBusca.SQL.Text;
end;

procedure TModelProdutosDM.ValidaDadosQueryCadastro;
begin
  //
end;

end.
