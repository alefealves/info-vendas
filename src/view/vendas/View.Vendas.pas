unit View.Vendas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Imaging.pngimage,
  Model.Vendas.DM;

type
  TViewVendas = class(TForm)
    pnBackTudo: TPanel;
    pnMsgTopo: TPanel;
    Label1: TLabel;
    pnCorpo: TPanel;
    pnCorpoEsquerda: TPanel;
    pnCorpoDireta: TPanel;
    Label2: TLabel;
    edtLancamento: TEdit;
    pnBackValores: TPanel;
    Label3: TLabel;
    edtQuantidade: TDBEdit;
    Label4: TLabel;
    edtValorUnitario: TDBEdit;
    Label5: TLabel;
    edtDesconto: TDBEdit;
    Label6: TLabel;
    edtAcrescimo: TDBEdit;
    Label7: TLabel;
    edtTotalLiquido: TDBEdit;
    Panel2: TPanel;
    pnBackImg: TPanel;
    imgFoto: TImage;
    pnRodapeDireita: TPanel;
    DBGrid1: TDBGrid;
    pnRodapeEquerda: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    pnBackTotalVenda: TPanel;
    lbTotalDaVenda: TLabel;
    edtTotalDaVenda: TDBEdit;
    pnBackDadosDaVenda: TPanel;
    Panel6: TPanel;
    Label13: TLabel;
    lbDBDataVenda: TDBText;
    Label14: TLabel;
    lbDBVendaNumero: TDBText;
    DS_VendasCadastrar: TDataSource;
    DS_VendasItensListar: TDataSource;
    DS_VendasItensCadastrar: TDataSource;
    Label15: TLabel;
    DBText1: TDBText;

  private

  public

  end;

var
  ViewVendas: TViewVendas;

implementation

{$R *.dfm}


end.
