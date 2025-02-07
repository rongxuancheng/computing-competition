program LJ;
var n,p,c,i,j,x,y,min,head,tail,tot,u:longint;
    dis,b,num:array[1..800]of longint;
    w:array[1..800,1..800]of longint;
    team:array[1..1605] of longint;
a:array[1..800,0..800]of longint;
exist:array[1..800] of boolean;
begin
  assign(input,'butter.in');reset(input);
  assign(output,'butter.out');rewrite(output);
  readln(n,p,c);
  for i:=1 to n do readln(b[i]);
  for i:=1 to p do
    for j:=1 to p do
      w[i,j]:=maxlongint div 3;
  for i:=1 to c do
  begin
    readln(x,y,w[x,y]);
    inc(num[x]);
    a[x,num[x]]:=y;
    inc(num[y]);
    a[y,num[y]]:=x;
    w[y,x]:=w[x,y];
  end;
  min:=maxlongint;
  for i:=1 to p do
  begin
    for j:=1 to p do dis[j]:=maxlongint div 3;
    fillchar(team,sizeof(team),0);
    fillchar(exist,sizeof(exist),false);
    dis[i]:=0;team[1]:=i;head:=0;tail:=1; exist[i]:=true;
    repeat
      inc(head);
      head:=((head-1) mod 1601)+1;
      u:=team[head]; exist[u]:=false;
      for j:=1 to num[u] do
        if dis[a[u,j]]>dis[u]+w[u,a[u,j]] then
        begin
          dis[a[u,j]]:=dis[u]+w[u,a[u,j]];
          if exist[ a[u,j] ]=false then
           begin
             inc(tail); tail:=((tail-1) mod 1601)+1;
             team[tail]:=a[u,j];
             exist[ a[u,j] ]:=true;
           end;
      end;
    until head=tail;
    tot:=0;
    for j:=1 to n do tot:=tot+dis[b[j]];
    if tot<min then min:=tot;
  end;
  writeln(min);
  close(input);close(output);
end.
