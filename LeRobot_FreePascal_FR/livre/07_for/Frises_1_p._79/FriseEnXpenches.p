{$mode macpas} program FriseEnXpenches;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 var l : integer;
begin 
 ag;
 for l := 1 to 20 do 
  begin 
   { Le robot étant tourné vers le nord, dessiner un X penché }
     { Branche NW-SE }
       pqtd; av; phtd; av; av; phtg; av;
     { Revenir au centre du X }
       pdt; av; phtd; av;
     { Demi-branche SW }
       pqtg; av; p3htg; av;
     { Revenir au centre du X }
       pdt; av; p3htd; av;
     { Demi-branche NE }
       av; p3htg; av;
     { Retourner le robot vers le nord }
       pqtd;
  end; 
 st;
end.