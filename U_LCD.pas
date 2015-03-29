unit U_LCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls,Math;

type
  TForm1 = class(TForm)
    LCD: TImage;
    scrlbr1: TScrollBar;
    scrlbr2: TScrollBar;
    lbl1: TLabel;
    lbl2: TLabel;
    Roll: TSpinEdit;
    Pitch: TSpinEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// y=tg(Roll)*(x+240)-240-sin(Pitch)*240
procedure TForm1.btn1Click(Sender: TObject);
begin
  LCD.Canvas.FillRect(Canvas.ClipRect);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  i,j:Integer ;
begin
  LCD.Canvas.MoveTo(0,240);
  LCD.Canvas.ClipRect;
  LCD.Canvas.Pen.Color:=clRed;
  LCD.Canvas.LineTo(480,240);
  for j:=0 to 480-1 do
    for i:=0 to 480-1 do
      if j<=240 then
        LCD.Canvas.Pixels[i,j]:=clBlue
      else
        LCD.Canvas.Pixels[i,j]:=clGray;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  Y:integer;
  i:Integer;
begin
  LCD.Canvas.Pen.Color:=clBlack;
  LCD.Canvas.MoveTo(0,Round(tan(Roll.Value*PI/180)*(-240)+240-sin(Pitch.Value*PI/180)*240));
  for i:=0 to 480-1 do
  begin
    Y:=Round(tan(Roll.Value*PI/180)*(i-240)+240-sin(Pitch.Value*PI/180)*240);
    LCD.Canvas.LineTo(i,Y);
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  i,j:Integer ;
  Y:integer;
begin
  for j:=0 to 480-1 do
  begin
    Y:=Round(tan(Roll.Value*PI/180)*(j-240)+240-sin(Pitch.Value*PI/180)*240);
    for i:=0 to Y-1 do
       LCD.Canvas.Pixels[i,j]:=clGray;
    for i:=Y to 480-1 do
       LCD.Canvas.Pixels[i,j]:=clBlue;
  end;
end;

end.
