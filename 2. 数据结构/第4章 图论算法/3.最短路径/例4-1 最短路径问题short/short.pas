Program p5_1(Input, Output);
Type point = Record
               x, y : integer
             End;
Var g:Array[1..100,1..100] Of Real;
    pos:Array[1..100] Of point;
    n,m,x,y,i,j,k,s,t:integer;

Function dist(i,j:Integer):Real;
  Begin
    dist:=sqrt(sqr(pos[i].x - pos[j].x) + sqr(pos[i].y - pos[j].y))
  End;

Begin  {main}
  Assign(Input, 'short.in');Reset(Input);
  Assign(Output, 'short.out');Rewrite(Output);
  Readln(n);
  For i := 1 To n Do
    Readln(pos[i].x, pos[i].y);
  For i := 1 To n Do
    For j := 1 To n Do
      g[i,j] := 1e30;
  Readln(m);
  For i := 1 To m Do
    Begin
      Readln(x, y);
      g[x,y] := dist(x, y);
      g[y,x] := g[x,y]
    End;
  Readln(s, t);
  For k := 1 To n Do
    For i := 1 To n Do
      If i <> k Then
        For j := 1 To n Do
          If (i<>j) And (k<>j) And (g[i,k]+g[k,j]<g[i,j])
            Then g[i,j]:=g[i,k] + g[k,j];
  Writeln(g[s,t]:0:2);
  Close(Input);Close(Output);
End.
