{$mode macpas} program FriseDeCerclesSecants;
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
 { Tracer une frise de cercles sécants }
 for I := 1 to 40 do 
  begin
   { Tracer un cercle, en partant du point le plus à l'ouest, avec le }
   { robot orienté au nord }
   vd; vd; vd; vd;
   { Déplacer le robot au centre du cercle, orienté vers le nord }
   lc; pqtd; av; pqtg; bc; 
  end;
 st;
end.