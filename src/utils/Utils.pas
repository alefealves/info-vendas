unit Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RTTI,
  Vcl.Forms,
  Vcl.Controls,
  Exceptions.FieldName,
  RTTI.FieldName;

type
  TUtils = class
  private
  public
    class procedure TratarExceptionsFieldName(const AForm: TForm; const E: ExceptionsFieldName);
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

        TWinControl(LComponent).SetFocus;
     end;
  end;

  raise Exception.Create(E.Message);
end;

end.
