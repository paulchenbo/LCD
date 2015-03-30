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
    btn5: TButton;
    lbl3: TLabel;
    lbl4: TLabel;
    Roll2: TSpinEdit;
    Pitch2: TSpinEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure scrlbr2Change(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
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
  x,y:Integer ;
begin
  LCD.Canvas.MoveTo(0,240);
  LCD.Canvas.ClipRect;
  LCD.Canvas.Pen.Color:=clRed;
  LCD.Canvas.LineTo(480,240);
  for y:=0 to 480-1 do
    for x:=0 to 480-1 do
      if y<=240 then
        LCD.Canvas.Pixels[x,y]:=clBlue
      else
        LCD.Canvas.Pixels[x,y]:=clGray;
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
  x,y:Integer ;
  Y0:integer;
begin
  for x:=0 to 480-1 do
  begin
    Y0:=Round(tan(Roll.Value*PI/180)*(x-240)+240-sin(Pitch.Value*PI/180)*240);
    for y:=0 to 480-1 do
    begin
      if y<=Y0 then
         LCD.Canvas.Pixels[x,y]:=clBlue
      else
        LCD.Canvas.Pixels[x,y]:=clGray;
    end;
  end;
end;

procedure TForm1.btn5Click(Sender: TObject);
var
  x,y:Integer ;
begin
  if Roll.Value>0 then
  begin
    for x:=0 to 240-1 do
    begin
      for y:=Round(tan(Roll.Value*PI/180)*(x-240)+240-sin(Pitch.Value*PI/180)*240) to 240  do
      begin
        LCD.Canvas.Pixels[x,y]:=clGray
      end;
    end;
    for x:=240 to 480-1 do
    begin
      for y:=240 to Round(tan(Roll.Value*PI/180)*(x-240)+240-sin(Pitch.Value*PI/180)*240) do
      begin
        LCD.Canvas.Pixels[x,y]:=clBlue
      end;
    end;
    end
  else
  begin
    for x:=0 to 240-1 do
      begin
        for y:= 240 to Round(tan(Roll.Value*PI/180)*(x-240)+240-sin(Pitch.Value*PI/180)*240)  do
        begin
          LCD.Canvas.Pixels[x,y]:=clBlue
        end;
      end;
      for x:=240 to 480-1 do
      begin
        for y:=Round(tan(Roll.Value*PI/180)*(x-240)+240-sin(Pitch.Value*PI/180)*240) to 240 do
        begin
          LCD.Canvas.Pixels[x,y]:=clGray
        end;
      end;
    end;
end;

procedure TForm1.scrlbr2Change(Sender: TObject);
begin
  Roll.Value:=scrlbr2.Position;
end;

procedure TForm1.scrlbr1Change(Sender: TObject);
begin
  Pitch.Value:=scrlbr1.Position;
end;

end.
