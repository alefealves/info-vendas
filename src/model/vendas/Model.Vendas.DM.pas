unit Model.Vendas.DM;

interface

uses
  System.SysUtils, System.Classes, Model.Connection.DM, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TModelVendasDM = class(TDataModule)
    QVendasCadastrar: TFDQuery;
    QVendasItensCadastrar: TFDQuery;
    QVendasItensListar: TFDQuery;
    QVendasCadastrarID: TIntegerField;
    QVendasCadastrarID_PESSOA: TIntegerField;
    QVendasCadastrarDATA: TDateField;
    QVendasCadastrarHORA: TTimeField;
    QVendasCadastrarTOTAL_BRUTO: TFMTBCDField;
    QVendasCadastrarTOTAL_DESCONTOS: TFMTBCDField;
    QVendasCadastrarTOTAL_ACRESCIMOS: TFMTBCDField;
    QVendasCadastrarTOTAL_LIQUIDO: TFMTBCDField;
    QVendasItensCadastrarID: TIntegerField;
    QVendasItensCadastrarID_VENDA: TIntegerField;
    QVendasItensCadastrarID_PRODUTO: TIntegerField;
    QVendasItensCadastrarQUANTIDADE: TFMTBCDField;
    QVendasItensCadastrarVALOR_UNITARIO: TFMTBCDField;
    QVendasItensCadastrarDESCONTO: TFMTBCDField;
    QVendasItensCadastrarACRESCIMO: TFMTBCDField;
    QVendasItensCadastrarTOTAL_LIQUIDO: TFMTBCDField;
    QVendasItensListarID: TIntegerField;
    QVendasItensListarID_VENDA: TIntegerField;
    QVendasItensListarID_PRODUTO: TIntegerField;
    QVendasItensListarQUANTIDADE: TFMTBCDField;
    QVendasItensListarVALOR_UNITARIO: TFMTBCDField;
    QVendasItensListarDESCONTO: TFMTBCDField;
    QVendasItensListarACRESCIMO: TFMTBCDField;
    QVendasItensListarTOTAL_LIQUIDO: TFMTBCDField;
    QVendasItensListarPRODUTO_NOME: TStringField;
    QVendasItensCadastrarTOTAL_BRUTO: TFMTBCDField;
    procedure QVendasCadastrarAfterInsert(DataSet: TDataSet);
    procedure QVendasItensCadastrarAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure VendasGet(const AIdVenda: Integer = 0);
    procedure VendasItensGet(const AIdItem: Integer = 0);
    procedure VendasItensListar(const AIdVenda: Integer = 0; const AIdItemVendaFocar: Integer = 0);
  end;

var
  ModelVendasDM: TModelVendasDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelVendasDM }

procedure TModelVendasDM.VendasGet(const AIdVenda: Integer = 0);
begin
  QVendasCadastrar.Close;
  QVendasCadastrar.ParamByName('IdVenda').AsInteger := AIdVenda;
  QVendasCadastrar.Open;
end;

procedure TModelVendasDM.VendasItensGet(const AIdItem: Integer);
begin
  QVendasItensCadastrar.Close;
  QVendasItensCadastrar.ParamByName('IdItem').AsInteger := AIdItem;
  QVendasItensCadastrar.Open;
end;

procedure TModelVendasDM.VendasItensListar(const AIdVenda: Integer = 0; const AIdItemVendaFocar: Integer = 0);
begin
  QVendasItensListar.DisableControls;
  try
    QVendasItensListar.Close;
    QVendasItensListar.ParamByName('IdVenda').AsInteger := AIdVenda;
    QVendasItensListar.Open;

    if(AIdItemVendaFocar > 0)then
      QVendasItensListar.Locate('ID', AIdItemVendaFocar, [loCaseInsensitive]);
  finally
    QVendasItensListar.EnableControls;
  end;
end;

procedure TModelVendasDM.QVendasCadastrarAfterInsert(DataSet: TDataSet);
begin
  QVendasCadastrarID_PESSOA.AsInteger := 1;
  QVendasCadastrarDATA.AsDateTime := Date;
  QVendasCadastrarHORA.AsDateTime := Time;
  QVendasCadastrarTOTAL_BRUTO.AsFloat := 0;
  QVendasCadastrarTOTAL_DESCONTOS.AsFloat := 0;
  QVendasCadastrarTOTAL_ACRESCIMOS.AsFloat := 0;
  QVendasCadastrarTOTAL_LIQUIDO.AsFloat := 0;
end;

procedure TModelVendasDM.QVendasItensCadastrarAfterInsert(DataSet: TDataSet);
begin
  QVendasItensCadastrarQUANTIDADE.AsFloat := 1;
  QVendasItensCadastrarVALOR_UNITARIO.AsFloat := 0;
  QVendasItensCadastrarTOTAL_LIQUIDO.AsFloat := 0;
  QVendasItensCadastrarDESCONTO.AsFloat := 0;
  QVendasItensCadastrarACRESCIMO.AsFloat := 0;
  QVendasItensCadastrarTOTAL_BRUTO.AsFloat := 0;
end;

end.
