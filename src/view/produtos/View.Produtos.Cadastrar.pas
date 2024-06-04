unit View.Produtos.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Model.Produtos.DM, Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName, Vcl.ComCtrls;

type
  TViewProdutosCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;

    [FieldName('NOME')]
    edtNome: TDBEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

implementation

{$R *.dfm}

uses
  Exceptions.FieldName, Utils;

procedure TViewProdutosCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelProdutosDM.CadastrarGet(inherited IdRegistroAlterar);
  if (DataSource1.DataSet.IsEmpty) then
    DataSource1.DataSet.Append
  else
    DataSource1.DataSet.Edit;

  edtNome.SetFocus;
end;

procedure TViewProdutosCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.DataSet.Post;
  except
    on E: ExceptionsFieldName do
      TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

end.
