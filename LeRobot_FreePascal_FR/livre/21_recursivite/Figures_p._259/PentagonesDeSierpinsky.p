{$mode macpas} program PentagonesDeSierpinsky;
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
     
 function TroisPuissance(N : integer) : integer;
 begin
  if N <= 0 then
   begin
    TroisPuissance := 1;
   end
  else 
   begin
    TroisPuissance := 3 * TroisPuissance(N - 1);
   end;
 end;

 var I : integer;
    
begin
 for I := 1 to 4 do
  begin
   cf(blanc); eh; pe; lg(324 div TroisPuissance(I)); Pentagone(I); MarquerUnePause;
  end;
 st;
end.


