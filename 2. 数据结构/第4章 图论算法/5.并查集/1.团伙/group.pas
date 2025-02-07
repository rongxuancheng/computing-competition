var f:array[0..1000,0..1000] of boolean;
    father:array[0..1000] of longint;
    i,k,n,m,x,y,tot,ch:longint;

function find(x:longint):longint;
begin
  if father[x]<>x then father[x]:=find(father[x]);
  find:=father[x];
end;

procedure union(x,y:longint);
var r1,r2:longint;
begin
  r1:=find(x);
  r2:=find(y);
  if r1<>r2 then father[r1]:=r2;
end;

begin
  assign(input,'group.in');reset(input);
  assign(output,'group.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do father[i]:=i;
  for i:=1 to m do
    begin
      readln(ch,x,y);
      if ch=0 then union(x,y)
      else
        begin
          f[x,y]:=true; f[y,x]:=true;
          for k:=1 to n do
           //if (k<>x) and (k<>y) then
             begin
               if f[x,k] then union(k,y);
               if f[k,y] then union(k,x);
             end;
        end;
    end;
  for i:=1 to n do if find(i)=i then inc(tot);
  writeln(tot);
  close(input);close(output);
end.
