{$mode macpas} program Balle;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Balle, page 116.                                    *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 { Dessiner une balle }
 for I := 1 to 4  do
  begin
   { Dessiner un quart de la balle }
     { Demi-cercle intérieur }
        lg(30); vg; vg;
     { Quart de cercle du bord }
        lg(30 * 2); vg; 
   { Remettre le robot au centre pour le quart suivant }
     ce;
  end;
 st;
end.