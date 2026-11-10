{$mode macpas} program BandesEnTriangle;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quadrillages, carrés, spirale et tuyaux d'orgue,    *}
 {* page 78.                                            *}
 {*                                                     *}
 {*******************************************************}
 var
  I : integer; 
  J : integer;
begin
 { Dessiner 10 rectangles de tailles 1, 2,..., 10 empilés horizontalement }
 pdt; 
 for I := 1 to 10 do
  begin
   av; pqtd;
   for J := 1 to I do
    begin
     av; 
    end;
   pqtd; av; pqtd;
   for J := 1 to I do
    begin
     av; 
    end;
   lc; pqtg; av; pdt; bc; 
  end;
 st;
end.