const
  finp = 'eat.in';
  fout = 'eat.out';
  maxn = 60000;
  map: array[1 .. 3, 1 .. 3] of longint = ((1, 2, 3), (2, 3, 1), (3, 1, 2));
  mirror: array[1 .. 3] of longint = (1, 3, 2);

type
  Tnode = record
    f, kind: longint;
  end;

var
  tree: array[1 .. maxn] of Tnode;
  n, talk, sum, idx, d, x, y: longint;

function root(p: longint): longint;
var
  bk, nw: Tnode;
begin
  nw.kind := 1; nw.f := p;
  while tree[nw.f].f > 0 do begin
    nw.kind := map[tree[nw.f].kind, nw.kind];
    nw.f := tree[nw.f].f;
  end;
  while tree[p].f > 0 do begin
    bk := tree[p]; tree[p] := nw; p := bk.f;
    nw.kind := map[nw.kind, mirror[bk.kind]];
  end;
  root := nw.f;
end;

procedure insert(d, x, y: longint);
var
  xx, yy: longint;
begin
  xx := root(x); yy := root(y);
  if xx <> yy then begin
    tree[xx].f := tree[xx].f + tree[yy].f;
    tree[yy].kind := map[map[tree[x].kind, d], mirror[tree[y].kind]];
    tree[yy].f := xx;
  end else
  if map[mirror[tree[x].kind], tree[y].kind] <> d then sum := sum + 1;
end;

begin
  readln(n, talk);
  for idx := 1 to n do tree[idx].f := - 1;
  for idx := 1 to n do tree[idx].kind := 1;
  sum := 0;
  for idx := 1 to talk do begin
    readln(d, x, y);
    if (1 <= x) and (x <= n) and (1 <= y) and (y <= n) then insert(d, x, y)
                                                       else sum := sum + 1;
  end;
  writeln(sum);
end.
