program ProblemEat;
  const
    infname='eat.in';
    outfname='eat.out';
  var
    i,k,n,d,x,y,toterror,total:longint;
    data:array [1..50000] of longint;
    fa,next:array [1..150000] of longint;
    way:array [1..150000] of longint;

  function find(x:longint):longint;
    var
      i,j,len:longint;
    begin
      if x=0 then
      begin
        find:=0;
        exit;
      end;
      len:=0;
      while x<>fa[x] do
        begin
          inc(len);
          way[len]:=x;
          x:=fa[x];
        end;
      for i:=1 to len do
        begin
          j:=way[i];
          fa[j]:=x;
          fa[next[j]]:=next[x];
          fa[next[next[j]]]:=next[next[x]];
        end;
      find:=x;
    end;

  procedure work1; {d=1}
    var
      fax,fay:longint;
    begin
      fax:=find(data[x]); fay:=find(data[y]);
      data[x]:=fax; data[y]:=fay;

      if (fax=0) and (fay=0) then {new a kind}
      begin
        inc(total); fa[total]:=total;
        data[x]:=total; data[y]:=total;

        next[total]:=total+1;
        inc(total); fa[total]:=total; next[total]:=total+1;
        inc(total); fa[total]:=total; next[total]:=data[x];
        exit;
      end;

      if (fax>0) and (fay=0) then
      begin
        data[y]:=data[x];
        exit;
      end;

      if (fax=0) and (fay>0) then
      begin
        data[x]:=data[y];
        exit;
      end;

      if (fax>0) and (fay>0) then
      begin
        if fax=fay then exit; {same then exit}
        if (fax=next[fay]) or (fax=next[next[fay]]) then {one circle,but not same}
        begin
          inc(toterror);
          exit;
        end;
        fa[fay]:=fax;
        fa[next[fay]]:=next[fax];
        fa[next[next[fay]]]:=next[next[fax]];
        data[y]:=data[x]; {join two circle}
      end;
    end;

  procedure work2; {d=2}
    var
      fax,fay:longint;
    begin
      fax:=find(data[x]); fay:=find(data[y]);
      data[x]:=fax; data[y]:=fay;

      if (fax=0) and (fay=0) then
      begin
        if x=y then
        begin
          inc(toterror);
          exit;
        end;
        inc(total); fa[total]:=total;
        data[x]:=total; data[y]:=total+1;

        next[total]:=total+1;
        inc(total); fa[total]:=total; next[total]:=total+1;
        inc(total); fa[total]:=total; next[total]:=data[x];
        exit;
      end;

      if (fax=0) and (fay>0) then
      begin
        data[x]:=next[next[fay]];
        exit;
      end;

      if (fax>0) and (fay=0) then
      begin
        data[y]:=next[fax];
        exit;
      end;

      if (fax>0) and (fay>0) then
      begin
        if (fax=fay) or (next[next[fax]]=fay) then
        begin
          inc(toterror);
          exit;
        end;
        if next[fax]=fay then exit;

        fa[fay]:=next[fax];
        fa[next[fay]]:=next[next[fax]];
        fa[next[next[fay]]]:=fax;

        data[y]:=next[fax];
      end;
    end;

  begin
    toterror:=0; total:=0;
    fillchar(data,sizeof(data),0);
    fillchar(fa,sizeof(fa),0);

    assign(input,infname);
    reset(input);
    read(n,k);
    for i:=1 to k do
      begin
        read(d,x,y);
        if (x>n) or (y>n) or (x<1) or (y<1) {range error}
        then inc(toterror)
        else if d=1
             then work1
             else work2;
      end;
    close(input);

    assign(output,outfname);
    rewrite(output);
    writeln(toterror);
    close(output);
  end.
