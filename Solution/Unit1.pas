unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    Memo_enter: TMemo;
    lbl_enter: TLabel;
    lbl_even: TLabel;
    Memo_output_even: TMemo;
    Memo_output_not_even: TMemo;
    lbl_not_even: TLabel;
    Main_menu: TMainMenu;
    N1: TMenuItem;
    Save: TMenuItem;
    Save_as: TMenuItem;
    Open: TMenuItem;
    Clear: TMenuItem;
    New: TMenuItem;
    Run: TMenuItem;
    Exit: TMenuItem;
    Open_Dialog: TOpenDialog;
    Save_Dialog: TSaveDialog;
    procedure ExitClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure Save_asClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure RunClick(Sender: TObject);
    procedure Memo_enterKeyPress(Sender: TObject; var Key: Char);
  end;

var
  Form1: TForm1;
  Name_of_File : string;

implementation

{$R *.dfm}

procedure TForm1.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ClearClick(Sender: TObject);
begin
  Memo_enter.Clear;
  Memo_output_even.Clear;
  Memo_output_not_even.Clear;
end;

procedure TForm1.SaveClick(Sender: TObject);
begin
  if Name_of_File <> ''
  then Memo_enter.Lines.SaveToFile(Name_of_File)
  else
    begin
      Save_As.Click;
      Name_of_File := '';
    end;
end;

procedure TForm1.OpenClick(Sender: TObject);
begin
  if Open_Dialog.Execute
  then
    begin
      Memo_enter.Lines.LoadFromFile(Open_Dialog.FileName);
      Name_of_File := Open_Dialog.FileName;
    end;
end;

procedure TForm1.Save_asClick(Sender: TObject);
begin
  if Save_Dialog.Execute then
    begin
       Memo_enter.Lines.SaveToFile(Save_Dialog.FileName);
       Name_of_File := Save_Dialog.FileName;
    end;
end;

procedure TForm1.NewClick(Sender: TObject);
var
  Text : string;
begin
  Text := Memo_enter.Text;
  if (Text <> '') or (Name_of_File <> '')
  then
    begin
      if Name_of_File <> ''
      then Save.Click
      else
        begin
          Save_As.Click;
          Name_of_File := '';
        end;
    end;
  Clear.Click;
end;

procedure TForm1.RunClick(Sender: TObject);
var
  line_memo : string;
  is_num : Boolean;
  i, j : Integer;
  res_even, res_not_even : string;
  new_el : string;
begin
  Memo_output_even.Clear;
  Memo_output_not_even.Clear;
  i := 0;
  is_num := True;
  while is_num and (i <= Memo_enter.Lines.Count) do
    begin
      line_memo := Memo_enter.Lines[i];
      j := 1;
      while is_num and (j <= Length(line_memo)) do
        begin
          is_num := ((line_memo[j] >= '0') and (line_memo[j] <= '9')) or (line_memo[j] = ' ');
          Inc(j);
        end;
      Inc(i);
    end;

  if is_num then
    begin
      for i := 0 to Memo_enter.Lines.Count do
        begin
          res_even := '';
          res_not_even := '';
          line_memo := Memo_enter.Lines[i] + ' ';
          new_el := '';
          for j := 1 to Length(line_memo) do
            begin
              if line_memo[j] <> ' '
              then new_el := new_el + line_memo[j]
              else
                begin
                  if new_el <> '' then
                    begin
                      if odd(StrToInt(new_el[Length(new_el)]))
                      then res_not_even := res_not_even + new_el + ' '
                      else res_even := res_even + new_el + ' ';
                      new_el := '';
                    end;
                end;
            end;
          if res_even <> '' then Memo_output_even.Lines.Add(res_even);
          if res_not_even <> '' then Memo_output_not_even.Lines.Add(res_not_even);
        end;
    end;
end;

procedure TForm1.Memo_enterKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #08, #13, ' '])
    then Key := #0;
end;

end.
