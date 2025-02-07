var
  v,i,j,k,n:longint;
  ch:char;  s:string;
  a:array[0..100,1..100]of int64;
begin
  assign(input,'shopth.in');reset(input);
  assign(output,'shopth.out');rewrite(output);
  readln(n,v);
  fillchar(a,sizeof(a),$7f div 2);
  for i:=1 to n do
    for j:=1 to n do
    begin
      if eoln then ch:='-'else read(ch);
      s:='';
      repeat
        s:=s+ch;
        if eoln then break;
        read(ch);
      until ch=' ';
      if s<>'-'then val(s,a[i,j]);
      if j=n then readln;
    end;
  for i:=1 to n do
    for j:=1 to n do
      for k:=1 to n do
        if a[j,k]>a[j,i]+a[i,k]then a[j,k]:=a[j,i]+a[i,k];
  for i:=1 to n do
    if i<>v then writeln('(',v,' -> ',i,') = ',a[v,i]);
  close(input);close(output);
end.