program candy;
var i,n,s,t,m,j,k,l,p,c,x,y,ans,q,ss:longint;
    a:array[0..100000]of longint;
    pre,other,last:array[0..2000000]of longint;
    ff:array[0..2000000]of longint;
    v:array[0..1000000]of boolean;
begin
  assign(input,'candy.in');
  reset(input);
  assign(output,'candy.out');
  rewrite(output);
  read(n,p,c);
  read(m);
  for i:=1 to p do
    begin
      read(x,y);
      inc(ss);
      pre[ss]:=last[x];
      other[ss]:=y;
      last[x]:=ss;
      inc(ss);
      pre[ss]:=last[y];
      last[y]:=ss;
      other[ss]:=x;
    end;
  ff[1]:=c;
  a[c]:=1;
  v[c]:=true;
  p:=0;
  q:=1;
  while p<q do
    begin
      inc(p);
      i:=last[ff[p]];
      while i<>0 do
        begin
          if v[other[i]]=false then
            begin
              inc(q);
              ff[q]:=other[i];
              a[other[i]]:=a[ff[p]]+1;
              if a[other[i]]>ans then ans:=a[other[i]];
              v[other[i]]:=true;
            end;
          i:=pre[i];
        end;
    end;
  writeln(ans+m);
  close(output);
end. 
