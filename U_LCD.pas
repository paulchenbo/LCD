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
    btn6: TButton;
    lst: TListBox;
    lbl5: TLabel;
    lbl6: TLabel;
    btn7: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure scrlbr2Change(Sender: TObject);
    procedure scrlbr1Change(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
const
  X0 = 240;
  Y0 = 240;
  X  = 480;
  Y  = 480;
{$R *.dfm}
// y=tg(Roll)*(x+240)-240-sin(Pitch)*240
procedure TForm1.btn1Click(Sender: TObject);
begin
  LCD.Canvas.FillRect(Canvas.ClipRect);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  x1,y1:Integer ;
begin
  LCD.Canvas.MoveTo(0,Y0);
  LCD.Canvas.ClipRect;
  LCD.Canvas.Pen.Color:=clRed;
  LCD.Canvas.LineTo(X,Y0);
  for y1:=0 to Y-1 do
    for x1:=0 to X-1 do
      if y1<=240 then
        LCD.Canvas.Pixels[x1,y1]:=clBlue
      else
        LCD.Canvas.Pixels[x1,y1]:=clGray;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  y1:integer;
  x1:Integer;
begin
  LCD.Canvas.Pen.Color:=clBlack;
  LCD.Canvas.MoveTo(0,Round(tan(Roll.Value*PI/180)*(0-X0)+Y0-sin(Pitch.Value*PI/180)*Y0));
  for x1:=0 to x-1 do
  begin
    y1:=Round(tan(Roll.Value*PI/180)*(x1-X0)+Y0-sin(Pitch.Value*PI/180)*Y0);
    LCD.Canvas.LineTo(x1,y1);
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  x1,y1:Integer ;
  Y2:integer;
begin
  for x1:=0 to X-1 do
  begin
    Y2:=Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0);
    for y1:=0 to y-1 do
    begin
      if y1<=Y2 then
         LCD.Canvas.Pixels[x1,y1]:=clBlue
      else
        LCD.Canvas.Pixels[x1,y1]:=clGray;
    end;
  end;
end;

procedure TForm1.btn5Click(Sender: TObject);
var
  x1,y1:Integer ;
begin
  if Roll.Value>0 then
  begin
    for x1:=0 to X0-1 do
    begin
      for y1:=Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0) to Y0-1  do
      begin
        LCD.Canvas.Pixels[x1,y1]:=clGray
      end;
    end;
    for x1:=x0 to x-1 do
    begin
      for y1:=y0 to Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0)-1 do
      begin
        LCD.Canvas.Pixels[x1,y1]:=clBlue
      end;
    end;
    end
  else
  begin
    for x1:=0 to x0-1 do
      begin
        for y1:=y0 to Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0)-1  do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clBlue
        end;
      end;
      for x1:=x0 to x-1 do
      begin
        for y1:=Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0) to Y0-1 do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clGray
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

procedure TForm1.btn6Click(Sender: TObject);
var
  x1,y1:integer;
  x2,y2:integer;
begin
  LCD.Canvas.MoveTo(0,Round(tan(Roll.Value*PI/180)*(0-X0)+Y0-sin(Pitch.Value*PI/180)*Y0));
  for x1:=0 to x-1 do
  begin
    y1:=Round(tan(Roll2.Value*PI/180)*(x1-X0)+Y0-sin(Pitch2.Value*PI/180)*Y0);
    LCD.Canvas.LineTo(x1,y1);
  end;
  if Roll.Value=Roll2.Value then
    Exit;
  x2:=Round((sin(Pitch.Value*PI/180)-sin(Pitch2.Value*PI/180))*y0/(Tan(Roll.Value*PI/180)-Tan(Roll2.Value*PI/180)))+x0;
  y2:=Round(tan(Roll.Value*PI/180)*(x2-x0)+y0-sin(Pitch.Value*PI/180)*y0);
  lbl5.Caption:=IntToStr(x2);
  lbl6.Caption:=IntToStr(y2)
end;

procedure TForm1.btn7Click(Sender: TObject);
var
  Y_cross:array[1..2] of integer;
  X_cross:array[1..2] of integer;
  cross:array[1..2] of integer;
  x1,y1:Integer;
begin
  Y_cross[1]:=Round(tan(Roll.Value*PI/180)*(0-X0)+Y0-sin(Pitch.Value*PI/180)*Y0);
  Y_cross[2]:=Round(tan(Roll2.Value*PI/180)*(0-X0)+Y0-sin(Pitch2.Value*PI/180)*Y0);
  if Roll.Value<>0 then
    X_cross[1]:=Round(Cotan(Roll.Value*PI/180)*(sin(Pitch.Value*PI/180)-1)*y0+x0);
  if Roll2.Value<>0 then
    X_cross[2]:=Round(Cotan(Roll2.Value*PI/180)*(sin(Pitch2.Value*PI/180)-1)*y0+x0);
  if Roll.Value=Roll2.Value then
  begin
    if Pitch.Value>Pitch2.Value then
      for x1:=0 to x-1 do
      begin
        for y1:=Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0) to Round(tan(Roll2.Value*PI/180)*(x1-x0)+y0-sin(Pitch2.Value*PI/180)*y0)  do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clBlue
        end;
      end;
    if Pitch.Value<Pitch2.Value then
      for x1:=0 to x-1 do
      begin
        for y1:=Round(tan(Roll2.Value*PI/180)*(x1-x0)+y0-sin(Pitch2.Value*PI/180)*y0) to Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0)  do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clGray
        end;
      end;
  end
  else
    begin
    cross[1]:=Round((sin(Pitch.Value*PI/180)-sin(Pitch2.Value*PI/180))*y0/(Tan(Roll.Value*PI/180)-Tan(Roll2.Value*PI/180)))+x0;
    cross[2]:=Round(tan(Roll.Value*PI/180)*(cross[1]-x0)+y0-sin(Pitch.Value*PI/180)*y0);
    if Roll2.Value<Roll.Value then
    begin
      for x1:=0 to cross[1]-1 do
      begin
        for y1:=Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0) to Round(tan(Roll2.Value*PI/180)*(x1-x0)+y0-sin(Pitch2.Value*PI/180)*y0)  do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clBlue
        end;
      end;
      for x1:=cross[1] to x-1 do
      begin
        for y1:=Round(tan(Roll2.Value*PI/180)*(x1-x0)+y0-sin(Pitch2.Value*PI/180)*y0) to Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0) do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clGray
        end;
      end;
    end;
    if Roll2.Value>Roll.Value then
    begin
      for x1:=0 to cross[1]-1 do
      begin
        for y1:=Round(tan(Roll2.Value*PI/180)*(x1-x0)+y0-sin(Pitch2.Value*PI/180)*y0) to Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0)  do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clGray
        end;
      end;
      for x1:=cross[1] to x-1 do
      begin
        for y1:=Round(tan(Roll.Value*PI/180)*(x1-x0)+y0-sin(Pitch.Value*PI/180)*y0) to Round(tan(Roll2.Value*PI/180)*(x1-x0)+y0-sin(Pitch2.Value*PI/180)*y0) do
        begin
          LCD.Canvas.Pixels[x1,y1]:=clBlue
        end;
      end;
    end;
  end;
  Roll.Value:=Roll2.Value;
  Pitch.Value:=Pitch2.Value;
end;

end.
