var i,j,n,m,k:integer;
    a:array[0..500,0..500]of longint;
    b:array[0..500]of longint;
begin
  assign(input,'travel.in');reset(input);
  assign(output,'travel.out');rewrite(output);
  readln(m,n);
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=maxlongint div 3;
  for i:=1 to m do
  begin
    j:=0;
    while not eoln do
    begin
      inc(j);
      read(b[j]);
      for k:=1 to j-1 do
        a[b[k],b[j]]:=1;
    end;readln;
  end;
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        if a[i,j]>a[i,k]+a[k,j] then
          a[i,j]:=a[i,k]+a[k,j];
   if a[1,n]=maxlongint div 3 then writeln('NO')
      else writeln(a[1,n]-1);
   close(input);close(output);
end.