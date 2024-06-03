unit View.Pessoas.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Model.Pessoas.DM;

type
  TViewPessoasBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  protected
    procedure BuscarDados; override;
  public
    { Public declarations }
  end;

var
  ViewPessoasBuscar: TViewPessoasBuscar;

implementation

{$R *.dfm}

{ TViewPessoasBuscar }

procedure TViewPessoasBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LCondicao := '';
  LStrBuscar := QuotedStr('%'+ edtBuscar.Text +'%').ToLower;

  case rdGroupFiltros.ItemIndex of
   0: LCondicao := 'where ( pessoas.id like ' + LStrBuscar + ' ) order by pessoas.id';
   1: LCondicao := 'where ( lower(pessoas.nome) like ' + LStrBuscar + ' ) or (lower(pessoas.fantasia) like ' + LStrBuscar + ' ) order by pessoas.id';
   2: LCondicao := 'where ( lower(cidades.nome) like ' + LStrBuscar + ' ) order by pessoas.id';
  end;

  ModelPessoasDM.PessoasBuscar(LCondicao);

  inherited;
end;

procedure TViewPessoasBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelPessoasDM = nil) then
    ModelPessoasDM := TModelPessoasDM.Create(nil);
end;

procedure TViewPessoasBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelPessoasDM);
end;

end.
