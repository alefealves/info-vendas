unit Exceptions.FieldName;

interface

uses
  system.SysUtils;

type
  ExceptionsFieldName = class(Exception)
  private
    FFieldName: String;
  public
    constructor Create(const AMessage, AFieldName: string); reintroduce;
    property FieldName: String read FFieldName write FFieldName;

  end;

implementation

{ ExceptionsFieldName }

constructor ExceptionsFieldName.Create(const AMessage, AFieldName: string);
begin
  Self.Message := AMessage;
  FFieldName := AFieldName;
end;

end.
