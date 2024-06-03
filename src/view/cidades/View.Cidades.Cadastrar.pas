unit View.Cidades.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Model.Cidades.DM, Vcl.Mask, Vcl.DBCtrls;

type
  TViewCidadesCadastrar = class(TViewHerancasCadastrar)
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigoIBGE: TDBEdit;
    cBoxUP: TDBComboBox;
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdRegistroAlterar: Integer;
  public
    property IdRegistroAlterar: Integer read FIdRegistroAlterar write FIdRegistroAlterar;
  end;

implementation

{$R *.dfm}

procedure TViewCidadesCadastrar.btnGravarClick(Sender: TObject);
begin

  if (Trim(edtNome.Text).IsEmpty) then
  begin
    edtNome.SetFocus;
    raise Exception.Create('Preencha o campo nome');
  end;

  if (Trim(cBoxUP.Text).IsEmpty) then
  begin
    edtNome.SetFocus;
    raise Exception.Create('Preencha o campo UF');
  end;

  if (not Trim(edtCodigoIBGE.Text).IsEmpty) then
  begin
    if (Length(edtCodigoIBGE.Text) <> 7) then
    begin
      edtNome.SetFocus;
      raise Exception.Create('Código do IBGE deve conter 7 dígitos.');
    end;
  end;

  DataSource1.DataSet.Post;

  inherited;
end;

procedure TViewCidadesCadastrar.FormCreate(Sender: TObject);
begin
  inherited;
  FIdRegistroAlterar := 0;
end;

procedure TViewCidadesCadastrar.FormShow(Sender: TObject);
begin
  inherited;

  ModelCidadesDM.CadastrarGet(FIdRegistroAlterar);
  if (DataSource1.DataSet.IsEmpty) then
    DataSource1.DataSet.Append
  else
    DataSource1.DataSet.Edit;

  edtNome.SetFocus;
end;

end.
