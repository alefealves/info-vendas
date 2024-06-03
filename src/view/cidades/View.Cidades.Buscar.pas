unit View.Cidades.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Model.Cidades.DM, Vcl.Menus;

type
  TViewCidadesBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  protected
    procedure BuscarDados; override;
  public

  end;

var
  ViewCidadesBuscar: TViewCidadesBuscar;

implementation

{$R *.dfm}

{ TViewCidadesBuscar }

procedure TViewCidadesBuscar.BuscarDados;
var
  LStrBuscar: string;
  LCondicao: string;
begin
  LCondicao := '';
  LStrBuscar := QuotedStr('%'+ edtBuscar.Text +'%').ToLower;

  case rdGroupFiltros.ItemIndex of
   0: LCondicao := 'where ( id like ' + LStrBuscar + ' )';
   1: LCondicao := 'where ( lower(nome) like ' + LStrBuscar + ' )';
   2: LCondicao := 'where ( lower(uf) like ' + LStrBuscar + ' )';
  end;

  ModelCidadesDM.CidadesBuscar(LCondicao);
  
  inherited;
end;

procedure TViewCidadesBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if (ModelCidadesDM = nil) then
    ModelCidadesDM := TModelCidadesDM.Create(nil);
end;

procedure TViewCidadesBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelCidadesDM);
end;

end.
