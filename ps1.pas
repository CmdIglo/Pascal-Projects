program Project1;

(*

 Code for school, doesnt work tho

*)

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  ARR_LEN = 10;

type
  strArr = array [0..ARR_LEN] of string;
  TpointNode = ^TtypeNode;
  TtypeNode = record
      value: byte;
      next: TpointNode;
  end;

(*

 Ersetzt alle Dr. mit Doktor und alle Prof. mit Professor

*)
function expand(word: string): string;
var
  indexProf : integer;
  indexDr : integer;
  i : integer;
  ende: Boolean;

begin

  (*Checkt ob das Wort Prof. im String enthalten ist*)
  while (pos('Prof.', word) > 0) do
  begin
    indexProf := pos('Prof.', word);
    delete(word, indexProf, 5);
    insert('Professor', word, indexProf);
  end;

  (*Checkt ob das Wort Dr. im String enthalten ist*)
  while (pos('Dr.', word) > 0) do
  begin
    indexDr := pos('Dr.', word);
    delete(word, indexDr, 3);
    insert('Doktor', word, indexDr);
  end;

  (*Gibt den veränedrten String wieder aus*)
  expand := word;

end;

(*Splittet das eingegebene Wort in 3-lange Substrings*)
function split(wrd: string; var overflow : string): strArr;
var
  index: integer;
  arrStr: strArr;
  subStr: string;
  j:integer;
  chr: string;

begin

  index := 1;
  subStr := '';
  j:= 0;

  (*solange der Satz in 3-lange Substrings unterteilt wetrden kann, tue das*)
  while (index <= high(wrd)) and (index + 3 <= high(wrd)+2) do
  begin

    subStr := copy(wrd, index, high(wrd)-index);
    subStr := copy(wrd, index, 3);
    inc(index, 3);

    (*Wenn der Substring noch in das vorher deklarierte array passt, füge ihn hinzu*)
    if(j <= high(arrStr)) then
    begin
      arrStr[j] := subStr;
      j := j+1;
    end
    (*Wenn nicht, füge ihn dem Overflow-String hinzu*)
    else
    begin
      overflow := overflow + subStr;
    end;

  end;

  (*
    gibt das Array als strings aus
  *)
  for chr in arrStr do
  begin
  if(chr <> '') then
    writeln(chr);
  end;

  (*writeln(overflow);*)
  split := arrStr;

end;

(*Gibt eine Linked List aus*)
procedure print(head: TtypeNode);
var
  prev : TtypeNode;
  resstr : string;
  value : string;

begin

  prev.next := @head;
  resstr := '';
  while (prev.next <> nil) do
  begin

    str(prev.next^.value, value);
    resstr := resstr + value + ' ';
    prev := prev.next^;

  end;

  writeln(resstr);

end;

(*Entfernt elemente aus einer linked list, wenn sie durch eine gegebene Nummer teilbar sind*)
procedure remove(head: TtypeNode; var new: TtypeNode; num: integer);
var
  curr : TtypeNode;

begin

  curr := head;
  while (curr.next <> nil) do
  begin

    if((curr.value mod num) = 0) then
    begin
      new := curr.next^;
    end
    else
    begin
      new := curr;
    end;

    if((curr.next.value mod num) = 0) then
    begin
      new.next := curr.next.next;
    end
    else
    begin
      new.next := curr.next;
    end;
    curr := curr.next^;

  end;

  new := new;
end;

var
  overflow: string;
  head: TtypeNode;
  node1: TtypeNode;
  node2: TtypeNode;
  node3: TtypeNode;
  new: TtypeNode;

begin

  head.value := 1;
  head.next := @node1;
  node1.value := 2;
  node1.next := @node2;
  node2.value := 3;
  node2.next := @node3;
  node3.value := 4;
  node3.next := nil;

  writeln(expand('Prof. Dr. Harald und Prof. Dr. Dr. sebastian iwanowski'));
  split('Hallo Welt du bist cool', overflow);
  writeln(overflow);
  print(head);
  remove(head, new, 2);
  readln;

end.
