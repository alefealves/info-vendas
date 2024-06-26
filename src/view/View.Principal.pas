unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  ShellAPI;


type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentaes1: TMenuItem;
    Financeiro1: TMenuItem;
    Fiscal1: TMenuItem;
    Empresas1: TMenuItem;
    Cidades1: TMenuItem;
    Pessoas1: TMenuItem;
    N1: TMenuItem;
    Subgruposdeprodutos1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Contasareceber1: TMenuItem;
    Configuraes1: TMenuItem;
    NFCe1: TMenuItem;
    procedure Cidades1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure Subgruposdeprodutos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

uses
  View.Cidades.Buscar,
  View.Pessoas.Buscar,
  View.Subgrupos.Buscar,
  View.Produtos.Buscar,
  View.Vendas;

procedure TViewPrincipal.Cidades1Click(Sender: TObject);
begin
  ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);
  try
    ViewCidadesBuscar.ShowModal;
  finally
    FreeAndNil(ViewCidadesBuscar);
  end;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TViewPrincipal.Pessoas1Click(Sender: TObject);
begin
  ViewPessoasBuscar := TViewPessoasBuscar.Create(nil);
  try
    ViewPessoasBuscar.ShowModal;
  finally
    FreeAndNil(ViewPessoasBuscar);
  end;
end;

procedure TViewPrincipal.Subgruposdeprodutos1Click(Sender: TObject);
begin
  ViewSubgruposBuscar := TViewSubgruposBuscar.Create(nil);
  try
    ViewSubgruposBuscar.ShowModal;
  finally
    FreeAndNil(ViewSubgruposBuscar);
  end;
end;

procedure TViewPrincipal.Produtos1Click(Sender: TObject);
begin
  ViewProdutosBuscar := TViewProdutosBuscar.Create(nil);
  try
    ViewProdutosBuscar.ShowModal;
  finally
    FreeAndNil(ViewProdutosBuscar);
  end;
end;

procedure TViewPrincipal.Vendas1Click(Sender: TObject);
begin
  ViewVendas := TViewVendas.Create(nil);
  try
    ViewVendas.ShowModal;
  finally
    FreeAndNil(ViewVendas);
  end;
end;

end.
