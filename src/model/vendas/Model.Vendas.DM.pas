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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelVendasDM: TModelVendasDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
