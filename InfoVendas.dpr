program InfoVendas;

uses
  Vcl.Forms,
  View.Principal in 'src\view\View.Principal.pas' {ViewPrincipal},
  Model.Connection.DM in 'src\model\connection\Model.Connection.DM.pas' {ModelConnectionDM: TDataModule},
  Model.Cidades.DM in 'src\model\cidades\Model.Cidades.DM.pas' {ModelCidadesDM: TDataModule},
  View.Herancas.Buscar in 'src\view\herancas\View.Herancas.Buscar.pas' {ViewHerancasBuscar},
  View.Cidades.Buscar in 'src\view\cidades\View.Cidades.Buscar.pas' {ViewCidadesBuscar},
  View.Herancas.Cadastrar in 'src\view\herancas\View.Herancas.Cadastrar.pas' {ViewHerancasCadastrar},
  View.Cidades.Cadastrar in 'src\view\cidades\View.Cidades.Cadastrar.pas' {ViewCidadesCadastrar},
  Model.Pessoas.DM in 'src\model\pessoas\Model.Pessoas.DM.pas' {ModelPessoasDM: TDataModule},
  View.Pessoas.Buscar in 'src\view\pessoas\View.Pessoas.Buscar.pas' {ViewPessoasBuscar},
  View.Pessoas.Cadastrar in 'src\view\pessoas\View.Pessoas.Cadastrar.pas' {ViewPessoasCadastrar},
  Exceptions.FieldName in 'src\exceptions\Exceptions.FieldName.pas',
  RTTI.FieldName in 'src\RTTI\RTTI.FieldName.pas',
  Utils in 'src\utils\Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de vendas multicamadas';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TModelConnectionDM, ModelConnectionDM);
  Application.CreateForm(TViewPessoasCadastrar, ViewPessoasCadastrar);
  Application.Run;
end.
