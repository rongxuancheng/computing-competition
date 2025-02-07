program candy;
var last:array[1..100000] of longint;
    other,pre:array[1..10000000] of longint;
    q:array[1..100000] of longint;
    s:array[1..100000] of longint;
    v:array[1..100000] of boolean;
    l,r,t:longint;
    n,p,c,m,i,j:longint;
    x,y,e:longint;
    max:longint;
begin
  assign(input,'candy.in');reset(input);
  assign(output,'candy.out');rewrite(output);
  readln(n,p,c);
  readln(m);
  e:=0;
  for i:=1 to p do
  begin
    readln(x,y);
    inc(e);
    pre[e]:=last[x];
    last[x]:=e;
    other[e]:=y;
    inc(e);
    pre[e]:=last[y];
    last[y]:=e;
    other[e]:=x;
  end;
  l:=0;r:=1;
  v[c]:=true;
  q[1]:=c;
  s[1]:=1;
  max:=1;
  while l<>r do
  begin
    l:=l mod n+1;
    t:=q[l];
    p:=last[t];
    while p<>0 do
    begin
      if not v[other[p]] then
      begin
        r:=r mod n+1;
        v[other[p]]:=true;
        q[r]:=other[p];
        s[r]:=s[l]+1;
        if s[r]>max then max:=s[r];
      end;
      p:=pre[p];
    end;
  end;
  writeln(max+m);
  close(output);
end.