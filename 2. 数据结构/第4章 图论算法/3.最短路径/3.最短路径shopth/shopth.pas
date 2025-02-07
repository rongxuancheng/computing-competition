var n,i,j,t,k:integer;s,z:string;
    a:array[1..80,1..80]of int64;
begin
  assign(input,'shopth.in');reset(input);
  assign(output,'shopth.out');rewrite(output);
  readln(n);
  readln(t);
  fillchar(a,sizeof(a),$7f div 2);
  for i:=1 to n do
  begin
    k:=0;j:=1;
    readln(s);s:=s+' ';
    repeat
      z:='';inc(k);
      while s[k]<>' ' do
      begin
        z:=z+s[k];
        inc(k);
      end;
      if (z<>'-')and(z<>'') then val(z,a[i,j]);
      inc(j);
    until k=length(s);
  end;
  for k:=1 to n do
   for i:=1 to n do
     for j:=1 to n do
      if a[i,j]>a[i,k]+a[k,j] then a[i,j]:=a[i,k]+a[k,j];
  for i:=1 to n do
    if i<>t then writeln('(',t,' -> ',i,') = ',a[t,i]);
  close(input);close(output);
end.
