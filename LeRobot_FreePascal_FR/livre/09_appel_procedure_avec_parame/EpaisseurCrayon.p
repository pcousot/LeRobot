{$mode macpas} program EpaisseurCrayon;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* EpaisseurCrayon, page 105.                          *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 eh; pqtd; 
 for I := 1 to 4 do
  begin
   lc; pqtd; avf(I); pqtg; bc; 
   ag; ec(12 * I); av;
  end;
 dg; st;
end.