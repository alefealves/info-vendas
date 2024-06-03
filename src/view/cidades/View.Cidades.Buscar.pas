unit View.Cidades.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Model.Cidades.DM;

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
  LCondicao: string;
begin
  LCondicao := '';
  case rdGroupFiltros.ItemIndex of
   0: LCondicao := 'where ( id like ' + QuotedStr('%'+ edtBuscar.Text +'%') + ' )';
   1: LCondicao := 'where ( nome like ' + QuotedStr('%'+ edtBuscar.Text +'%') + ' )';
   2: LCondicao := 'where ( uf like ' + QuotedStr('%'+ edtBuscar.Text +'%') + ' )';
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
