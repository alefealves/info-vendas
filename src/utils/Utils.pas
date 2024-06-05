unit Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.ComCtrls,
  Exceptions.FieldName,
  RTTI.FieldName;

type
  TUtils = class
  private
  public
    class function GetPastaRaiz: string;
    class function GetPastaImg: string;
    class function GetPastaImgProdutos: string;
    class procedure TratarExceptionsFieldName(const AForm: TForm; const E: ExceptionsFieldName);
    class procedure SetFocusComponent(const AWinControl: TWinControl);
  end;

implementation

class procedure TUtils.TratarExceptionsFieldName(const AForm: TForm; const E: ExceptionsFieldName);
var
  LRttiContext: TRttiContext;
  LRttiType: TRttiType;
  LRttiField: TRttiField;
  LCustomAttribute: TCustomAttribute;
  LFieldName: FieldName;
  LComponent: TComponent;
begin
  LRttiContext := TRttiContext.Create;
  LRttiType := LRttiContext.GetType(AForm.ClassInfo);
  for LRttiField in LRttiType.GetFields do
  begin
     if(LRttiField.Parent <> LRttiType)then
       Continue;
     for LCustomAttribute in LRttiField.GetAttributes do
     begin
        if not(LCustomAttribute is FieldName)then
          Continue;
        LFieldName := FieldName(LCustomAttribute);
        if(LFieldName.Nome.ToUpper <> E.FieldName)then
          Continue;
        LComponent := AForm.FindComponent(LRttiField.Name);
        if(LComponent = nil)then
          Continue;
        if not(LComponent is TWinControl)then
          Continue;

        Self.SetFocusComponent(TWinControl(LComponent));
     end;
  end;
  raise Exception.Create(E.Message);
end;

class function TUtils.GetPastaRaiz: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)));
end;

class function TUtils.GetPastaImg: string;
begin
  Result := IncludeTrailingPathDelimiter(Self.GetPastaRaiz + 'Img');
end;

class function TUtils.GetPastaImgProdutos: string;
begin
  Result := IncludeTrailingPathDelimiter(Self.GetPastaImg + 'Produtos');
end;

class procedure TUtils.SetFocusComponent(const AWinControl: TWinControl);
var
  LParent: TComponent;
begin
  LParent := AWinControl.Parent;
  while(LParent <> nil)and(LParent.ClassParent <> TForm)do
  begin
    if(LParent is TTabSheet)then
      if(not TTabSheet(LParent).Showing)then
        TTabSheet(LParent).Show;

    LParent := TWinControl(LParent).Parent;
  end;

  if(AWinControl.CanFocus)then
    AWinControl.SetFocus;
end;

initialization
  ForceDirectories(TUtils.GetPastaImgProdutos);


end.
