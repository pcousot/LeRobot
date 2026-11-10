{$mode macpas} program FriseEnCoeur;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 ag;
 for I := 1 to 10 do 
  begin
   { Dessiner un motif composé d'un S miroir et d'un S }
    { S miroir de gauche }
    vd; vd; vd; vg; vg; vg;
    { Rejoindre le S miroir de droite }
    lc; av; av; pqtd; av; av; pqtg; bc;
    { S de droite }
    vg; vg; vg; vd; vd; vd; 
    { Rejoindre le début du motif suivant à droite }
    lc; av; av; pqtd; av; av; pqtg; bc;
  end;
 st;
end.