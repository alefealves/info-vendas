unit View.Produtos.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Model.Produtos.DM, Vcl.Menus;

type
  TViewProdutosBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  protected
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  public

  end;

var
  ViewProdutosBuscar: TViewProdutosBuscar;

implementation

{$R *.dfm}

uses
  View.Produtos.Cadastrar;

procedure TViewProdutosBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LCondicao := '';
  LStrBuscar := QuotedStr('%'+ edtBuscar.Text +'%').ToLower;

  case rdGroupFiltros.ItemIndex of
   0: LCondicao := 'where ( p.id like ' + LStrBuscar + ' )';
   1: LCondicao := 'where ( lower(p.nome) like ' + LStrBuscar + ' )';
   2: LCondicao := 'where ( p.codigo_barras like ' + LStrBuscar + ' )';
   3: LCondicao := 'where ( lower(s.nome) like ' + LStrBuscar + ' )';
  end;

  ModelProdutosDM.ProdutosBuscar(LCondicao);

  inherited;
end;

procedure TViewProdutosBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
  LViewProdutosCadastrar: TViewProdutosCadastrar;
begin
  inherited;
  LViewProdutosCadastrar := TViewProdutosCadastrar.Create(nil);
  try
    LViewProdutosCadastrar.IdRegistroAlterar := AId;
    if(LViewProdutosCadastrar.ShowModal = mrOk)then
    begin
      inherited UltId := LViewProdutosCadastrar.UltId;
      Self.BuscarDados;
    end;
  finally
    LViewProdutosCadastrar.Free;
  end;
end;

procedure TViewProdutosBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelProdutosDM = nil) then
    ModelProdutosDM := TModelProdutosDM.Create(nil);
end;

procedure TViewProdutosBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelProdutosDM);
end;

end.
