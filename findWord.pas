program FindWord;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  sen : string;
  wrd : string;
  word: string;

{*

  Finds the word at the n-th place in a string
  i: integer, used for the for-loop
  spc: integer, holds the number of occurences of the space string

*}

function findWord(sntc: string; index: integer): string;
var
  i : integer;
  spc: integer;
begin

  spc := 0;
  wrd := '';

  (* Loops through the given string *)
  for i := 0 to high(sntc) do
  begin

    if(index = 0) and (sntc[i+1] <> ' ') and (spc = 0) then
    begin
    
      wrd := wrd + sntc[i+1]
    
    end
    else
    begin
      
      (* Increments the spc variable by one if the string at given position is a space *)
      if(sntc[i+1] = ' ') then
      begin
        spc := spc+1;
      end;
      (* if the 'spc' - variable is equal to the given index then add the following characters to the 'wrd' - variable *)
      if(spc = index) and (sntc[i+1] <> ' ') then
      begin
        wrd := wrd + sntc[i+1]
      end;
    end;

  end;

  result := wrd;

end;

begin

  sen := 'Hallo hier ist Maxwell';
  word := findWord(sen, 0);
  writeln(sen);
  writeln(word);

end.
