
const
     maxn=100;
     maxint=maxlongint div 4;
     maxq=10000;
var
   s:array[1..maxn] of longint;
   mark:array[1..maxn] of boolean;
   g:array[1..maxn,1..maxn] of longint;
   n,i,j,k,m,x,y,ans,t:longint;

begin
     assign(input,'msner.in');
     reset(input);
     assign(output,'msner.out');
     rewrite(output);

     filldword(g,sizeof(g)div 4,maxint);
     read(n,m);
     for i:=1 to m do
     begin
          read(x,y,t);
          if t<g[x,y] then
             begin
                  g[x,y]:=t;
                  g[y,x]:=t;
             end;
     end;
     for i:=1 to n do g[i,i]:=0;

     fillchar(mark,sizeof(mark),false);
     mark[1]:=true;
     for i:=1 to n do s[i]:=g[1,i];
     repeat
          k:=0;
          for j:=1 to n do
              if (not mark[j])and((k=0)or(s[k]>s[j])) then
                 k:=j;
          if k<>0 then
             begin
                  mark[k]:=true;
                  for j:=1 to n do
                      if (not mark[j])and(s[k]+g[k,j]<s[j]) then
                         s[j]:=s[k]+g[k,j];
             end;
     until k=0;

     ans:=0;
     for i:=1 to n do
         if s[i]>ans then ans:=s[i];
     if ans>=maxint
        then writeln(-1)
        else writeln(ans);
     close(input); close(output);
end.
