unit Model.Subgrupos.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Model.Connection.DM;

type
  TModelSubgruposDM = class(TDataModule)
    QSubgruposCadastro: TFDQuery;
    QSubgruposBusca: TFDQuery;
    QSubgruposCadastroID: TIntegerField;
    QSubgruposCadastroNOME: TStringField;
    QSubgruposBuscaID: TIntegerField;
    QSubgruposBuscaNOME: TStringField;
    QLook: TFDQuery;
    QLookNOME: TStringField;
    procedure QSubgruposCadastroBeforePost(DataSet: TDataSet);
  private

    { Private declarations }
  public
    procedure SubgruposBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdSubgrupo: Integer);
    procedure ValidaDadosQueryCadastro;
    procedure LookSubgrupo(const AIdSubgrupo: Integer);
  end;

var
  ModelSubgruposDM: TModelSubgruposDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Exceptions.FieldName;

procedure TModelSubgruposDM.CadastrarGet(const AIdSubgrupo: Integer);
begin
  QSubgruposCadastro.Close;
  QSubgruposCadastro.SQL.Clear;
  QSubgruposCadastro.SQL.Add('select * from subgrupos ');
  QSubgruposCadastro.SQL.Add('where (id = :IdSubgrupo)');
  QSubgruposCadastro.ParamByName('IdSubgrupo').AsInteger := AIdSubgrupo;
  QSubgruposCadastro.Open;
end;

procedure TModelSubgruposDM.SubgruposBuscar(const ACondicao: string);
begin
  QSubgruposBusca.Close;
  QSubgruposBusca.SQL.Clear;
  QSubgruposBusca.SQL.Add('select * from subgrupos ');
  QSubgruposBusca.SQL.Add(ACondicao);
  QSubgruposBusca.Open;
end;

procedure TModelSubgruposDM.LookSubgrupo(const AIdSubgrupo: Integer);
begin
  QLook.Close;
  QLook.ParamByName('IdSubgrupo').AsInteger := AIdSubgrupo;
  QLook.Open;
end;

procedure TModelSubgruposDM.QSubgruposCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidaDadosQueryCadastro;
end;

procedure TModelSubgruposDM.ValidaDadosQueryCadastro;
begin
  if (QSubgruposCadastroNOME.AsString.Trim.IsEmpty) then
    raise ExceptionsFieldName.Create('Preencha o campo nome', 'NOME');

end;

end.
