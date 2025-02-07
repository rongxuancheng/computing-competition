const
  maxn=2010;
  oo=1993101215;

var
  map:array[0..maxn,0..maxn] of longint;
  index,cost,cor:array[0..maxn] of longint;
  bool:array[0..maxn] of boolean;
  i,j,n,m,ans,u,v,w,p,q,min,tot:longint;

function minx(a,b:longint):longint;
begin
  if a>b then exit(b) else exit(a);
end;

procedure dfs(u:longint);
var i:longint;
begin
  bool[u]:=true;
  for i:=1 to n do
    if (map[u,i]=0) and (bool[i]=false) then
      begin
        cor[i]:=tot;
        dfs(i);
      end;
end;

begin
  readln(n,m);

  for i:=1 to n do
    for j:=1 to n do
      if i<>j then
        map[i,j]:=oo;

  for i:=1 to m do
    begin
      readln(p,u,v,w);
      if p=1 then
        begin
          ans:=ans+w;
          map[u,v]:=0;
          map[v,u]:=0;
        end;
      if p=2 then
        begin
          map[u,v]:=minx(map[u,v],w);
          map[v,u]:=minx(map[v,u],w);
        end;
    end;

  for i:=1 to n do
    if bool[i]=false then
      begin
        inc(tot);
        cor[i]:=tot;
        dfs(i);
      end;

  for i:=1 to n do
    for j:=1 to n do
      if cor[i]=cor[j] then
        begin
          map[i,j]:=0;
          map[j,i]:=0;
        end;

 { for i:=1 to n do
    writeln(i,' ',cor[i]);

  for i:=1 to n do
    begin
      for j:=1 to n do
        write(map[i,j],' ');
      writeln;
    end;       }

  for i:=1 to n do
    begin
      cost[i]:=map[1,i];
      index[i]:=1;
    end;

  for i:=1 to n-1 do
    begin
      min:=oo;
      for j:=1 to n do
        if (cost[j]<>-1) and (cost[j]<min) then
          begin
            q:=j;
            min:=cost[j];
          end;
      cost[q]:=-1;
      for j:=1 to n do
        if cost[j]>map[q,j] then
          begin
            cost[j]:=map[q,j];
            index[j]:=q;
          end;
    end;

  for i:=2 to n do
    ans:=ans+map[index[i],i];
  writeln(ans);
end.


