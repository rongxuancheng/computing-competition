var a:array[1..100,1..100]of integer;
    i,j,k,n,m,max,x,y,z:integer;
 begin
   assign(input,'msner.in');reset(input);
   assign(output,'msner.out');rewrite(output);
   readln(n,m);
   fillchar(a,sizeof(a),$7f);
   for i:=1 to m do
   begin
     readln(x,y,z);
     a[x,y]:=z;
     a[y,x]:=z;
   end;
   for k:=1 to n do
    for i:=1 to n do
     for j:=1 to n do
      if a[i,k]+a[k,j]<a[i,j] then a[i,j]:=a[i,k]+a[k,j];
   for i:=2 to n do
    if a[1,i]>max then max:=a[1,i];
   writeln(max);
   close(input);close(output);
 end.