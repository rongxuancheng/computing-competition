var
  i,j,t,x:longint;
  ch:char;
  s1,s2:string;
  father:array[1..50001]of longint;
  b:array[1..50001]of string;

function weiz(s:string):longint;
begin
  for i:=1 to t do
    if b[i]=s then exit(i);
  inc(t);
  b[t]:=s;
  weiz:=t;
end;

function find(x:longint):longint;
begin
  while x<>father[x] do x:=father[x];
  exit(x);
end;

begin
  assign(input,'gen.in'); reset(input);
  assign(output,'gen.out'); rewrite(output);
  for i:=1 to 50001 do father[i]:=i;
  repeat
    read(ch);
    case ch of
    '#': readln(s1);
    '+':
     begin
      readln(s2);
      if s1<>s2 then father[find(weiz(s2))]:=find(weiz(s1));
     end;
    '?':
     begin
      readln(s2);
      writeln(s2,' ',b[find(weiz(s2))]);
     end;
    end;
  until ch='$';
  close(input);close(output);
end.
