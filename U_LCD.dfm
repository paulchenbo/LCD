object Form1: TForm1
  Left = 210
  Top = 150
  Width = 870
  Height = 551
  Caption = 'LCD'#27169#25311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LCD: TImage
    Left = 0
    Top = 0
    Width = 480
    Height = 480
  end
  object lbl1: TLabel
    Left = 520
    Top = 8
    Width = 36
    Height = 13
    Caption = #27178#28378#65306
  end
  object lbl2: TLabel
    Left = 520
    Top = 32
    Width = 36
    Height = 13
    Caption = #20463#20208#65306
  end
  object lbl3: TLabel
    Left = 528
    Top = 168
    Width = 36
    Height = 13
    Caption = #27178#28378#65306
  end
  object lbl4: TLabel
    Left = 528
    Top = 192
    Width = 36
    Height = 13
    Caption = #20463#20208#65306
  end
  object scrlbr1: TScrollBar
    Left = 0
    Top = 488
    Width = 480
    Height = 16
    Max = 90
    Min = -90
    PageSize = 0
    TabOrder = 0
    OnChange = scrlbr1Change
  end
  object scrlbr2: TScrollBar
    Left = 488
    Top = 0
    Width = 16
    Height = 480
    Kind = sbVertical
    Max = 90
    Min = -90
    PageSize = 0
    TabOrder = 1
    OnChange = scrlbr2Change
  end
  object Roll: TSpinEdit
    Left = 560
    Top = 4
    Width = 121
    Height = 22
    MaxValue = 90
    MinValue = -90
    TabOrder = 2
    Value = 0
  end
  object Pitch: TSpinEdit
    Left = 560
    Top = 28
    Width = 121
    Height = 22
    MaxValue = 90
    MinValue = -90
    TabOrder = 3
    Value = 0
  end
  object btn1: TButton
    Left = 528
    Top = 88
    Width = 75
    Height = 25
    Caption = #28165#23631
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 616
    Top = 88
    Width = 113
    Height = 25
    Caption = #21021#22987#21270#22352#26631#31995
    TabOrder = 5
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 528
    Top = 128
    Width = 75
    Height = 25
    Caption = #20998#30028#32447
    TabOrder = 6
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 616
    Top = 128
    Width = 75
    Height = 25
    Caption = #20840#37096#22635#20805
    TabOrder = 7
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 704
    Top = 128
    Width = 75
    Height = 25
    Caption = #37096#20998#22635#20805
    TabOrder = 8
    OnClick = btn5Click
  end
  object Roll2: TSpinEdit
    Left = 568
    Top = 164
    Width = 121
    Height = 22
    MaxValue = 90
    MinValue = -90
    TabOrder = 9
    Value = 0
  end
  object Pitch2: TSpinEdit
    Left = 568
    Top = 188
    Width = 121
    Height = 22
    MaxValue = 90
    MinValue = -90
    TabOrder = 10
    Value = 0
  end
end
