object Form1: TForm1
  Left = 156
  Top = 81
  Width = 732
  Height = 634
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Main_menu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_enter: TLabel
    Left = 8
    Top = 16
    Width = 222
    Height = 13
    Caption = '??????? ?????? ??? ???????? ???? ??? ?????????:'
  end
  object lbl_even: TLabel
    Left = 16
    Top = 336
    Width = 52
    Height = 13
    Caption = '??? ??????:'
  end
  object lbl_not_even: TLabel
    Left = 368
    Top = 336
    Width = 65
    Height = 13
    Caption = '??? ?? ??????:'
  end
  object Memo_enter: TMemo
    Left = 0
    Top = 32
    Width = 713
    Height = 289
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyPress = Memo_enterKeyPress
  end
  object Memo_output_even: TMemo
    Left = 0
    Top = 352
    Width = 353
    Height = 217
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Memo_output_not_even: TMemo
    Left = 360
    Top = 352
    Width = 353
    Height = 217
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Main_menu: TMainMenu
    Left = 392
    object N1: TMenuItem
      Caption = '????'
      object Save: TMenuItem
        Caption = '?????????'
        OnClick = SaveClick
      end
      object Save_as: TMenuItem
        Caption = '????????? ???'
        OnClick = Save_asClick
      end
      object Open: TMenuItem
        Caption = '???????'
        OnClick = OpenClick
      end
      object Clear: TMenuItem
        Caption = '????????'
        OnClick = ClearClick
      end
      object New: TMenuItem
        Caption = '?????'
        OnClick = NewClick
      end
      object Exit: TMenuItem
        Caption = '?????'
        OnClick = ExitClick
      end
    end
    object Run: TMenuItem
      Caption = 'Run'
      OnClick = RunClick
    end
  end
  object Open_Dialog: TOpenDialog
    Left = 456
  end
  object Save_Dialog: TSaveDialog
    Left = 520
  end
end
