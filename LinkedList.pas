program LinkedList;

(*

  Simple Linked List program in Pascal.

*)

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

(* Declaring types *)
type
  TpNode = ^TtNode;
  TtNode = record
    value: string;
    next: TpNode;
  end;

(* Initializing variables *)
var
  head: TtNode;
  node1: TtNode;
  node2: TtNode;
  node3: TtNode;
  prevNode: TtNode;
  currNode: TtNode;

(* Program entry point *)
begin

  (* Setting values and pointers by hand *)
  head.value := 'head';
  node1.value := 'node1';
  node2.value := 'node2';
  node3.value := 'node3';
  node3.next := nil;

  head.next := @node1;
  node1.next := @node2;
  node2.next := @node3;

  (* Entry point into the linked list *)
  currNode.next := @head;
  
  (* Printing the node values to the command line *)
  while currNode.next <> nil do
  begin

    writeln(currNode.next^.value);
    if currNode.next.next <> nil then
    currNode.next^ := currNode.next^.next^
    (* Breaks loop if we reached the end of the linked list *)
    else
    break;

  end;

end.
