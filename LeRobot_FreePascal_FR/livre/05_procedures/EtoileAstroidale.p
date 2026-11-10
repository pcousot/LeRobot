{$mode macpas} program EtoileAstroidale;
 uses Robot1, Robot2;
 { Dessiner une étoile formée de quatre astroïdes à boucles }
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 procedure Arc;
 begin
  phtg; vd; phtg; vd; phtg; vd; 
 end;
 
 procedure Astroide;
 begin
  Arc; p3htd; Arc; p3htd; Arc; p3htd; Arc;
 end;
 
 procedure Etoile;
 begin
  Astroide; phtd; Astroide; phtd; Astroide; phtd; Astroide; 
 end;
 
begin
 Etoile; st; 
end.
