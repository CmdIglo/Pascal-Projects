program FindIndex;

(* 

  Finds the index of the first appearance of a number in a list 
  If the number isnt in the array, return -1
  
*)

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

(* Initializes an integer array with given values *)
var
  ints: array [0..5] of integer = (1, 2, 3, 4, 3, 2);

(* 
  The main function
  Finds the first appearance of a given integer in an integer-array
  i: integer, used for the for-loop
  ret: integer, return-value
  
*)
function findeIndex(arr: array of integer; num: integer) : integer;
var
  i : integer;
  ret : integer;
begin

  ret := -1;

  for i := 0 to high(arr) do
  begin
    if(arr[i] = num) then
    begin
      ret := i;
      exit(ret)
    end;
  end;

  exit(ret);

end;

(* Entry point of the program *)
begin

  writeln(findeIndex(ints, 3));

end.
