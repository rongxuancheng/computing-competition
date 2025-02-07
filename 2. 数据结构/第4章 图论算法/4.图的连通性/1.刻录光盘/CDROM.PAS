const
     infile='cdrom.in';
     outfile='cdrom.out';
var
   vanishing:array[1..100] of boolean;
   stu_num,father:byte;
   g:array[1..100,1..100] of boolean;

procedure datainit;
begin
     fillchar(vanishing,sizeof(vanishing),0);
     fillchar(g,sizeof(g),0);
end;

procedure readata;
var i,j:byte;
begin
     assign(input,infile);
     reset(input);
     readln(stu_num);
     for i:=1 to stu_num do
         repeat
               read(j);
               if j>0 then g[i,j]:=true;
         until j=0;
     close(input);
end;

procedure floyed;
var i,j,k:byte;
begin
     for k:=1 to stu_num do
         for i:=1 to stu_num do
             if g[i,k] then
                for j:=1 to stu_num do
                    if g[k,j] and not g[i,j] then
                       g[i,j]:=true;
end;

procedure merge(var i,j:byte);
var k:byte;
begin
     for k:=1 to stu_num do
     begin
          if not vanishing[k] and g[k,j] then
             begin
                  g[k,i]:=true; g[k,j]:=false;
             end;
          if not vanishing[k] and g[j,k] then
             begin
                  g[i,k]:=true; g[j,k]:=false;
             end;
     end;
     g[i,i]:=false; g[i,j]:=false;
end;

procedure shrink;
var i,j:byte;
begin
     for i:=1 to stu_num do
         if not vanishing[i] then
            for j:=1 to stu_num do
                if (i<>j)and not vanishing[j] and g[i,j] and g[j,i] then
                   begin
                        vanishing[j]:=true;
                        merge(i,j);
                   end;
end;

function nofather(var i:byte):boolean;
var j:byte;
begin
     for j:=1 to stu_num do
         if g[j,i] then
            begin
                 nofather:=false;
                 exit;
            end;
     nofather:=true;
end;

procedure stat;
var i:byte;
begin
     father:=0;
     for i:=1 to stu_num do
         if not vanishing[i] and nofather(i) then
            inc(father);
end;

procedure out;
begin
     assign(output,outfile);
     rewrite(output);
     writeln(father);
     close(output);
end;

begin
     datainit;
     readata;
     floyed;
     shrink;
     stat;
     out;
end.
