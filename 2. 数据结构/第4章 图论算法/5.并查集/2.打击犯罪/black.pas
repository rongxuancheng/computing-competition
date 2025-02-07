var n,max,i,j,r1,r2:longint;
    b,s,father:array [0..1000] of longint;
    a:array [0..1000,0..1000] of longint;

function find(x:longint):longint;
begin
  if father[x]<>x then father[x]:=find(father[x]);
  find:=father[x];
end;

begin
  assign(input,'black.in');reset(input);
  assign(output,'black.out');rewrite(output);
  readln(n);
  max:=n div 2;
  for i:=1 to n do
  begin
    read(b[i]);
    for j:=1 to b[i] do
      read(a[i,j]);
  end;
  for i:=1 to n do
  begin
    father[i]:=i; s[i]:=1;
  end;
  for i:=n downto 1 do
    for j:=1 to b[i] do
      if a[i,j]>i then
      begin
        r1:=find(i);
        r2:=find(a[i,j]);
        if r1<>r2 then
        begin
          father[r2]:=r1;
          s[r1]:=s[r1]+s[r2];
        end;
        if (s[r1]>max) then
        begin
          writeln(i);
          close(input);close(output);
          halt;
        end;
     end;
end.
