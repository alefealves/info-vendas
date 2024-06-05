program InfoVendas;

uses
  Vcl.Forms,
  View.Principal in 'src\view\View.Principal.pas' {ViewPrincipal},
  Model.Connection.DM in 'src\model\connection\Model.Connection.DM.pas' {ModelConnectionDM: TDataModule},
  Model.Subgrupos.DM in 'src\model\subgrupos\Model.Subgrupos.DM.pas' {ModelSubgruposDM: TDataModule},
  View.Herancas.Buscar in 'src\view\herancas\View.Herancas.Buscar.pas' {ViewHerancasBuscar},
  View.Produtos.Buscar in 'src\view\produtos\View.Produtos.Buscar.pas' {ViewProdutosBuscar},
  View.Herancas.Cadastrar in 'src\view\herancas\View.Herancas.Cadastrar.pas' {ViewHerancasCadastrar},
  View.Produtos.Cadastrar in 'src\view\produtos\View.Produtos.Cadastrar.pas' {ViewProdutosCadastrar},
  Model.Pessoas.DM in 'src\model\pessoas\Model.Pessoas.DM.pas' {ModelPessoasDM: TDataModule},
  View.Pessoas.Buscar in 'src\view\pessoas\View.Pessoas.Buscar.pas' {ViewPessoasBuscar},
  View.Pessoas.Cadastrar in 'src\view\pessoas\View.Pessoas.Cadastrar.pas' {ViewPessoasCadastrar},
  Exceptions.FieldName in 'src\exceptions\Exceptions.FieldName.pas',
  RTTI.FieldName in 'src\RTTI\RTTI.FieldName.pas',
  Utils in 'src\utils\Utils.pas',
  Model.Cidades.DM in 'src\model\cidades\Model.Cidades.DM.pas' {ModelCidadesDM: TDataModule},
  View.Cidades.Buscar in 'src\view\cidades\View.Cidades.Buscar.pas' {ViewCidadesBuscar},
  View.Cidades.Cadastrar in 'src\view\cidades\View.Cidades.Cadastrar.pas' {ViewCidadesCadastrar},
  Model.Produtos.DM in 'src\model\produtos\Model.Produtos.DM.pas' {ModelProdutosDM: TDataModule},
  View.Subgrupos.Buscar in 'src\view\subgrupos\View.Subgrupos.Buscar.pas' {ViewSubgruposBuscar},
  View.Subgrupos.Cadastrar in 'src\view\subgrupos\View.Subgrupos.Cadastrar.pas' {ViewSubgruposCadastrar},
  View.Vendas in 'src\view\vendas\View.Vendas.pas' {ViewVendas},
  Model.Vendas.DM in 'src\model\vendas\Model.Vendas.DM.pas' {ModelVendasDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de vendas multicamadas';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TModelConnectionDM, ModelConnectionDM);
  Application.Run;
end.
