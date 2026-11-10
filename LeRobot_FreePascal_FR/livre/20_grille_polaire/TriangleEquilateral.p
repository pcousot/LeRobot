{$mode macpas} program TriangleEquilateral;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Triangle équilatéral, exercice 38, page 228.        *}
 {*                                                     *}
 {*******************************************************}
 const
  LongueurCote = 50;
  Angle = 60; 
begin
 lgRT(LongueurCote, Angle); 
 phtd; av; pqtd; av; p3htd; avf(2); st; 
end.