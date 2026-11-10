{$mode macpas} program PentagoneDeSierpinsky;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pentagones de Sierpinski, page 258.                 *}
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
    rt(-72);
    Segment(N - 1);
    rt(-72);
    Segment(N - 1);
    rt(-72);
    Segment(N - 1);
    rt(-72);
    Segment(N - 1);
    rt(-72);
    lc; Segment(N - 1); bc; 
    Segment(N - 1);
   end;
 end;
 
 procedure Pentagone (N : integer);
  var I : integer;
 begin
  for I := 1 to 5 do
   begin
    Segment(N - 1);
    rt(-72);
   end;
 end;
     
begin
 pe; eh; lg(4); Pentagone(4); st;
end.

