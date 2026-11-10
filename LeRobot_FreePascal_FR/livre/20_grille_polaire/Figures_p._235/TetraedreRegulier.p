{$mode macpas} program TetraedreRegulier;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développements des solides de Platon, page 235.     *}
 {*                                                     *}
 {*******************************************************}

 const Cote = 25;

 procedure TriangleEquilateral;
 begin
  lgRT(Cote, 60); phtd; av; pqtd; av; p3htd; avf(2); pdt; avf(2); pqtg; 
 end;

begin
 TriangleEquilateral; TriangleEquilateral;
 phtg; av; phtg; avf(2); pqtd;
 TriangleEquilateral;
 st;
end.