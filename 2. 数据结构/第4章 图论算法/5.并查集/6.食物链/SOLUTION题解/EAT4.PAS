const
  maxn=50000;
var
  pr:array[1..maxn] of longint;
  z:array[1..maxn] of integer;
  index,ans,n,k,d,x,y:longint;

  l1,l2:array[1..maxn] of longint;
  m,z1,z2,i,p,q,t1,t2:longint;

procedure check(x,y,d:longint);
begin
  t1:=1;
  l1[t1]:=x;
  z1:=0;
  while pr[x]<>0 do begin
    inc(z1,z[x]);
    x:=pr[x];
    inc(t1);
    l1[t1]:=x
  end;

  t2:=1;
  l2[t2]:=y;
  z2:=0;
  while pr[y]<>0 do begin
    inc(z2,z[y]);
    y:=pr[y];
    inc(t2);
    l2[t2]:=y
  end;

  p:=l1[t1];
  q:=l2[t2];
  if p=q
    then begin
           z1:=(z2-z1)mod 3;
           if z1<0 then inc(z1,3);
           if z1+1=d
             then
             else inc(ans);
           if t1>t2
             then begin
                    z1:=0;
                    for i:=t1-1 downto 1 do begin
                      z1:=(z1+z[l1[i]])mod 3;
                      pr[l1[i]]:=p;
                      z[l1[i]]:=z1
                    end
                  end
             else begin
                    z2:=0;
                    for i:=t2-1 downto 1 do begin
                      z2:=(z2+z[l2[i]]) mod 3;
                      pr[l2[i]]:=p;
                      z[l2[i]]:=z2
                    end
                  end
         end
    else begin
           if p<q
             then begin
                    m:=p;
                    z2:=(d-1+z1-z2) mod 3;
                    if z2<0 then inc(z2,3);
                    z1:=0;
                    pr[q]:=m;
                    z[q]:=z2
                  end
             else begin
                    m:=q;
                    z1:=(z2-z1-d+1) mod 3;
                    if z1<0 then inc(z1,3);
                    z2:=0;
                    pr[p]:=m;
                    z[p]:=z1
                  end;
           for i:=t1-1 downto 1 do begin
             z1:=(z1+z[l1[i]])mod 3;
             pr[l1[i]]:=m;
             z[l1[i]]:=z1
           end;
           for i:=t2-1 downto 1 do begin
             z2:=(z2+z[l2[i]]) mod 3;
             pr[l2[i]]:=m;
             z[l2[i]]:=z2
           end;
         end
end;
begin
  assign(input,'eat.in');
  reset(input);
  assign(output,'eat.out');
  rewrite(output);
  readln(n,k);
  ans:=0;
  fillchar(pr,sizeof(pr),0);
  for index:=1 to k do begin
    readln(d,x,y);
    if (x>n)or(y>n)
      then inc(ans)
      else if x=y
             then if d=1
                    then
                    else inc(ans)
             else check(x,y,d)
  end;
  writeln(ans);
  close(input);
  close(output)
end.
