program Snow_Clearing;
var  ppp,pp,h,m:longint;
     x1,y1,x2,y2,ans:extended;
begin
  assign(input,'snow.in');
  assign(output,'snow.out');
  reset(input);
  rewrite(output);
  read(x1, y1);
  ans:=0;
  while not eof do
    begin
      readln(x1,y1,x2,y2);
      ans:=ans+sqrt(sqr(x1-x2)+sqr(y1-y2));
    end;
  ans:=ans*2/1000/20;
  h:=trunc(ans); m:=round(60*(ans-h));
  if m=60 then begin m:=0; inc(h) end;
  write(h,':');
  if m<10 then write(0); 
  writeln(m);
  close(output);
  close(input);
end.
