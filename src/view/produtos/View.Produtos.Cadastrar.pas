unit View.Produtos.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Model.Produtos.DM, Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName, Vcl.ComCtrls, Vcl.Imaging.pngimage, Model.Subgrupos.DM,
  View.Subgrupos.Buscar;

type
  TViewProdutosCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;

    [FieldName('NOME')]
    edtNome: TDBEdit;
    Label3: TLabel;

    [FieldName('DESCRICAO')]
    edtDescricao: TDBEdit;

    Label4: TLabel;

    [FieldName('ID_SUBGRUPO')]
    edtIdSubgrupo: TDBEdit;

    edtNomeSubgrupo: TEdit;
    Label5: TLabel;

    [FieldName('PRECO_CUSTO')]
    edtPrecoCusto: TDBEdit;

    Label6: TLabel;

    [FieldName('PORCENTAGEM')]
    edtPorcentagem: TDBEdit;

    Label7: TLabel;

    [FieldName('PRECO_VENDA')]
    edtPrecoVenda: TDBEdit;


    Label8: TLabel;

    [FieldName('UNIDADE')]
    edtUnidade: TDBEdit;

    Label9: TLabel;

    [FieldName('CODIGO_BARRAS')]
    edtCodigoBarras: TDBEdit;

    edtImagem: TPanel;
    ImagemProduto: TImage;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtIdSubgrupoExit(Sender: TObject);
    procedure edtIdSubgrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

implementation

{$R *.dfm}

uses
  Exceptions.FieldName, Utils;

procedure TViewProdutosCadastrar.edtIdSubgrupoExit(Sender: TObject);
var
   LModelSubgruposDM: TModelSubgruposDM;
begin
  inherited;

  edtNomeSubgrupo.Clear;
  if(Trim(edtIdSubgrupo.Text).IsEmpty)then
    Exit;

  LModelSubgruposDM := TModelSubgruposDM.Create(nil);

  try
    LModelSubgruposDM.LookSubgrupo(StrToIntDef(edtIdSubgrupo.Text,0));
    if(LModelSubgruposDM.QLook.IsEmpty)then
    begin
      edtIdSubgrupo.SetFocus;
      raise Exception.Create('Subgrupo não localizado');
    end;

    edtNomeSubgrupo.Text := LModelSubgruposDM.QLookNOME.AsString;

  finally
    LModelSubgruposDM.Free;
  end;

end;

procedure TViewProdutosCadastrar.edtIdSubgrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F8)then
  begin
    ViewSubgruposBuscar := TViewSubgruposBuscar.Create(nil);
    try
      if(ViewSubgruposBuscar.ShowModal = mrOk)then
        edtIdSubgrupo.Text := ViewSubgruposBuscar.IdSelecionado.ToString;
    finally
      FreeAndNil(ViewSubgruposBuscar);
    end;
  end;
end;

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
