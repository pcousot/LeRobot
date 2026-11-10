{$mode macpas} program CarreDeSierpinsky;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Carrés de Sierpinski, page 257.                     *}
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
    pqtd; 
    Segment(N - 1);
    pqtd; 
    Segment(N - 1);
    pqtd; 
    Segment(N - 1);
    pqtd; 
    lc; Segment(N - 1); bc; 
    Segment(N - 1);
   end;
 end;
 
 procedure Carre(N : integer);
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    Segment(N); pqtd;
   end; 
 end;
    
begin
 ag; eb; lg(2); Carre(4); st; 
end.

