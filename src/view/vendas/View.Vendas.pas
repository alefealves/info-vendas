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
  Model.Vendas.DM,
  Utils,
  Model.Produtos.DM;
type
  TViewVendas = class(TForm)
    pnBackTudo: TPanel;
    pnMsgTopo: TPanel;
    lbMsg: TLabel;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DS_VendasItensListarDataChange(Sender: TObject; Field: TField);
  private
    FDM: TModelVendasDM;
    procedure ProcessarF2;
    procedure LimparTela;
    procedure ImagemPadrao;
    procedure ProcessarEsc;
    procedure CancelarVenda;
    procedure ProcessarF3;
    procedure ProcessarEnterNoEdtLancamento;
    procedure TotalizarVenda;
  public
  end;
var
  ViewVendas: TViewVendas;
implementation
{$R *.dfm}
procedure TViewVendas.FormCreate(Sender: TObject);
begin
  if(ModelVendasDM = nil)then
    ModelVendasDM := TModelVendasDM.Create(nil);

  FDM := ModelVendasDM;

  if(ModelProdutosDM = nil)then
    ModelProdutosDM := TModelProdutosDM.Create(nil);
end;

procedure TViewVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ModelVendasDM);
  FreeAndNil(ModelProdutosDM);
end;

procedure TViewVendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case(Key)of
    VK_F2:
     Self.ProcessarF2;
    VK_F3:
     Self.ProcessarF3;
    VK_F4:
    begin
      if(ssAlt in Shift)then
        Key := 0;
    end;
    VK_Escape:
      Self.ProcessarEsc;
  end;
end;

procedure TViewVendas.ProcessarF2;
begin
  if(FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  Self.LimparTela;
  FDM.QVendasCadastrar.Append;
  lbMsg.Caption := 'Inserindo produtos na venda';
  edtLancamento.SetFocus;
end;

procedure TViewVendas.LimparTela;
begin
  FDM.VendasGet;
  FDM.VendasItensGet;
  FDM.VendasItensListar;
  Self.ImagemPadrao;
  lbMsg.Caption := 'Tecle F2 para iniciar uma nova venda';
end;

procedure TViewVendas.ImagemPadrao;
begin
  imgFoto.Picture.LoadFromFile(TUtils.GetPastaImg + 'Add-Imagem.png');
end;

procedure TViewVendas.ProcessarEsc;
begin
  if(FDM.QVendasCadastrar.State in dsEditModes)then
    Self.CancelarVenda
  else
    Self.Close;
end;

procedure TViewVendas.CancelarVenda;
begin
  if(Application.MessageBox('Confirma o cancelamento deste venda:', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES)
  then
    Exit;

  FDM.QVendasCadastrar.Cancel;
  Self.LimparTela;
end;

procedure TViewVendas.ProcessarF3;
begin
  if not (FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  FDM.QVendasCadastrar.Post;
  Self.LimparTela;

  edtLancamento.SetFocus;
end;

procedure TViewVendas.edtLancamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
    Self.ProcessarEnterNoEdtLancamento;
end;

procedure TViewVendas.ProcessarEnterNoEdtLancamento;
begin
  if not (FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  if(Trim(edtLancamento.Text).IsEmpty)then
    Exit;

  if(not ModelProdutosDM.LookProduto(edtLancamento.Text))then
  begin
     edtLancamento.SetFocus;
     raise Exception.Create('Produto não encontrado');
  end;

  if(FDM.QVendasCadastrar.State in [dsInsert])then
  begin
    FDM.QVendasCadastrar.Post;
    FDM.QVendasCadastrar.Edit;
  end;

  FDM.QVendasItensCadastrar.Append;
  FDM.QVendasItensCadastrarID_VENDA.AsInteger := FDM.QVendasCadastrarID.AsInteger;
  FDM.QVendasItensCadastrarID_PRODUTO.AsInteger := ModelProdutosDM.QLookID.AsInteger;
  FDM.QVendasItensCadastrarQUANTIDADE.AsFloat := 1;
  FDM.QVendasItensCadastrarVALOR_UNITARIO.AsFloat := ModelProdutosDM.QLookPRECO_VENDA.AsFloat;
  FDM.QVendasItensCadastrarTOTAL_BRUTO.AsFloat :=
    FDM.QVendasItensCadastrarQUANTIDADE.AsFloat * FDM.QVendasItensCadastrarVALOR_UNITARIO.AsFloat;
  FDM.QVendasItensCadastrarDESCONTO.AsFloat := 0;
  FDM.QVendasItensCadastrarACRESCIMO.AsFloat := 0;
  FDM.QVendasItensCadastrarTOTAL_LIQUIDO.AsFloat := FDM.QVendasItensCadastrarTOTAL_BRUTO.AsFloat -
    FDM.QVendasItensCadastrarDESCONTO.AsFloat + FDM.QVendasItensCadastrarACRESCIMO.AsFloat;
  FDM.QVendasItensCadastrar.Post;

  FDM.VendasItensListar(FDM.QVendasCadastrarID.AsInteger, FDM.QVendasItensCadastrarID.AsInteger);

  Self.TotalizarVenda;

  edtLancamento.Clear;
  edtLancamento.SetFocus;
end;

procedure TViewVendas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(not Odd(TDBGrid(Sender).DataSource.DataSet.RecNo))then
    DBGrid1.Canvas.Brush.Color := $00DDDDDD;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TViewVendas.TotalizarVenda;
begin
  if not (FDM.QVendasCadastrar.State in dsEditModes)then
    Exit;

  FDM.VendasTotalizar(FDM.QVendasCadastrarID.AsInteger);
  FDM.QVendasCadastrarTOTAL_BRUTO.AsFloat := FDM.QVendasTotalizarTOTALBRUTO.AsFloat;
  FDM.QVendasCadastrarTOTAL_DESCONTOS.AsFloat := FDM.QVendasTotalizarTOTALDESCONTO.AsFloat;
  FDM.QVendasCadastrarTOTAL_ACRESCIMOS.AsFloat := FDM.QVendasTotalizarTOTALACRESCIMO.AsFloat;
  FDM.QVendasCadastrarTOTAL_LIQUIDO.AsFloat := FDM.QVendasTotalizarTOTALLIQUIDO.AsFloat;
  FDM.QVendasCadastrar.Post;
  FDM.QVendasCadastrar.Edit;
end;

procedure TViewVendas.DS_VendasItensListarDataChange(Sender: TObject; Field: TField);
var
  LFileImg : string;
begin
  if(FDM.QVendasItensListar.IsEmpty)then
    Exit;

  if(FDM.QVendasItensListarID.AsInteger <= 0)then
    Exit;

  if(FDM.QVendasItensListarIMAGEM.AsString.Trim.IsEmpty)then
  begin
    Self.ImagemPadrao;
    Exit;
  end;

  LFileImg := TUtils.GetPastaImgProdutos + FDM.QVendasItensListarIMAGEM.AsString.Trim;

  if(not FileExists(LFileImg))then
  begin
    Self.ImagemPadrao;
    Exit;
  end;

  imgFoto.Picture.LoadFromFile(LFileImg);
end;

end.
