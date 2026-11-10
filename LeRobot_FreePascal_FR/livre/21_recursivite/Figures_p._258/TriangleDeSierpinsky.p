{$mode macpas} program TriangleDeSierpinsky;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Triangles de Sierpinski, page 258.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure Segment (N : integer);
 begin
  if N = 0 then
   begin
    av;
   end
  else
   begin
    Segment(N - 1);
    Segment(N - 1);
    rt(-120);
    Segment(N - 1);
    rt(-120);
    Segment(N - 1);
    rt(-120);
    lc; Segment(N - 1); bc; 
    Segment(N - 1);
   end;
 end;
 
 procedure Triangle (N : integer);
  var I : integer;
 begin
  rt(-30); 
  for I := 1 to 3 do
   begin
    segment(N); rt(-120); 
   end;
 end;
     
begin
 eb; ag; lg(3); Triangle(4); st;
end.

