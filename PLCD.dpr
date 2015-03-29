program PLCD;

uses
  Forms,
  U_LCD in 'U_LCD.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
