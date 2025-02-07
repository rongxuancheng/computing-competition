program Eat;

  const
    finp        = 'eat.in';
    fout        = 'eat.out';
    maxn        = 50002;
    result      : array[-1 .. 1 , -1 .. 1] of integer
                = ((1 , -1 , 0) , (0 , 1 , -1) , (-1 , 0 , 1));
    result2     : array[-1 .. 1 , -1 .. 1] of integer
                = ((0 , 1 , -1) , (-1 , 0 , 1) , (1 , -1 , 0));
    next        : array[-1 .. 1 , -1 .. 1] of integer
                = ((1 , -1 , 0) , (-1 , 0 , 1) , (0 , 1 , -1));
    behind      : array[-1 .. 1 , -1 .. 1] of integer
                = ((0 , -1 , 1) , (1 , 0 , -1) , (-1 , 1 , 0));

  var
    parent      : array[0 .. maxn] of longint;
    relation    : array[0 .. maxn] of integer;
    n , k , lie , i     : longint;
    x , y , a , b       : longint;
    u , v , d , nr   : integer;

  procedure find(x : longint; var y : longint; var d : integer);
    var
      z         : longint;
      now , r   : integer;
    begin
      d := 0; z := x;
      while parent[x] > 0 do begin
        d := next[d,relation[x]];
        x := parent[x];
      end;
      y := x; now := d;
      while z <> y do begin
        x := parent[z];
        parent[z] := y;
        r := relation[z];
        relation[z] := now;
        now := behind[now,r];
        z := x;
      end;
    end;

  procedure merge(a , b : longint; r : integer);
    begin
      if parent[a] > parent[b] then begin
        parent[b] := parent[a] + parent[b];
        parent[a] := b;
        relation[a] := r;
      end
      else begin
        parent[a] := parent[a] + parent[b];
        parent[b] := a;
        relation[b] := -r;
      end;
    end;

  begin
    assign(input , finp);
    reset(input);
    readln(n , k);
    for i := 1 to n do begin
      parent[i] := -1;
      relation[i] := 0;
    end;
    lie := 0;
    for i := 1 to k do begin
      readln(d , x , y);
      if (x > n) or (y > n) then begin
        lie := lie + 1;
        continue;
      end;
      find(x , a , u);
      find(y , b , v);
      if d = 2 then nr := result[u,v] else nr := result2[u,v];
      if a = b then
        if nr <> 0 then lie := lie + 1 else
      else merge(a , b , nr);
    end;
    close(input);
    assign(output , fout);
    rewrite(output);
    writeln(lie);
    close(output);
  end.
