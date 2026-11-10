{$mode macpas} program FrisePodiums;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
  var X : integer;
begin 
 ag; pqtd; 
 for X := 1 to 10 do 
  begin
   { Le robot étant orienté à l'est, dessiner deux marches du podium }
   { en montant }
   av; pqtg; av; pqtd; av; pqtg; av; 
   { Dessiner le sommet du podium }
   pqtd; av; pqtd;
   { Le robot étant orienté au sud, dessiner deux marches du podium en }
   { descendant }
   av; pqtg; av; pqtd; av;
   { Orienter le robot à l'est }
   pqtg; 
  end;
 st;
end.