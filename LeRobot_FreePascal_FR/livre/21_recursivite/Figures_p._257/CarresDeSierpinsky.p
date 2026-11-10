{$mode macpas} program CarresDeSierpinsky;
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
   cf(blanc); ag; eb; lg(162 div TroisPuissance(I)); Carre(I); MarquerUnePause;
  end;
end.

