Program relation1;
const	
	maxn=20000;
type
	eletype=record
		   rank,father	:integer;
	end;

procedure work;
var  
   opt :array[1..maxn] of eletype;
   m,i,q :longint;
   n,x,y :integer;

 procedure mdf(r1,r2:integer);
  var
   path  :array[1..maxn]of integer;
    k,i	 :integer;
  begin
	k:=0;
	repeat
	  inc(k);
          path[k]:=r1;
	  r1:=opt[r1].father;
	until r1=opt[r1].father;                      {查r1所属集合的代表}
	for i:=1 to k-2 do  opt[path[i]].father:=r1;  {路径压缩优化，把这个路径上的点全部指向根结点}
	k:=0;
	repeat
	   inc(k);
           path[k]:=r2;
	   r2:=opt[r2].father;
	until r2=opt[r2].father;
	for i:=1 to k-2 do  opt[path[i]].father:=r2;  {同上}
	if r1=r2 then exit;            {r1和r2已属于同一集合，则退出；否则做下面的合并}
	if opt[r1].rank<opt[r2].rank   {采用按秩合并}
		  then begin
			  opt[r1].father:=r2;
			  inc(opt[r2].rank,opt[r1].rank);
		       end
		else begin
			opt[r2].father:=r1;
			inc(opt[r1].rank,opt[r2].rank);
		     end;
  end;

 begin{work}
    readln(n,m);
    for i:=1 to n do begin           {初始化}
		       opt[i].father:=i;
		       opt[i].rank:=1;
	             end;
    for i:=1 to m do begin
		       readln(x,y);
		       mdf(x,y);     {建立关联}
	             end;

    readln(q);
    for i:=1 to q do 
      begin
	readln(x,y);
        repeat
           x:=opt[x].father;
        until x=opt[x].father;    {查x所属集合的代表}
        repeat
           y:=opt[y].father;
        until y=opt[y].father;    {查y所属集合的代表}
		if opt[x].father=opt[y].father
			then writeln('Yes')
			else writeln('No');
    end;
 end;

Begin{main}
	assign(input, 'relation.in'); reset(input);
	assign(output, 'relation.out');rewrite(output);
	work;
close(input);close(output);
End.
