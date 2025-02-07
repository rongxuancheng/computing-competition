program badman;
var n,m,i,j,num,max,min,u,x,y,v:longint;
    w:array[1..1000,1..1000]of longint;
    dis,r:array[1..1000]of longint;
    bo:array[1..1000]of boolean;
begin
  assign(input,'city.in');reset(input);
  assign(output,'city.out');rewrite(output);

  readln(n,m);
  fillchar(w,sizeof(w),$7f div 3);
  for i:=1 to m do
  begin
    read(x,y,w[x,y]);
    w[y,x]:=w[x,y];
  end;

  max:=0;
  fillchar(dis,sizeof(dis),$7f div 3);
  fillchar(bo,sizeof(bo),true);
  dis[1]:=0;
  for j:=1 to n do
  begin
    min:=maxlongint;
    for i:=1 to n do
     if (bo[i])and(dis[i]<min) then
      begin
        min:=dis[i];
        u:=i;
      end;
    bo[u]:=false;
    if dis[u]>max then max:=dis[u];
    for v:=1 to n do
      if (bo[v]=true)and(w[v,u]<dis[v]) then
        dis[v]:=w[v,u];
   end;
   writeln(n-1,' ',max);
   close(input);close(output);
end.
