{$mode macpas} program StriesOctogonales;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Stries sur octogone, pa105.                         *}
 {*                                                     *}
 {*******************************************************}
 var
  I : integer; 
  J : integer;
begin
 lc; avf(5); bc; lg(4);
 for I := 1 to 8 do
  begin
   { Dessiner 10 stries de longueurs 2, 4, 8, ...20. }
   for J := 1 to 10 do
    begin
     { Dessiner une strie de longueur (2 * J) centrée sur un côté }
     { de l'octogone. }
     avf(J); avf(-2 * J); avf(J); 
     { Passer à la strie suivante (sans tracer le côté de l'octo- }
     { gone). }
     lc; pqtd; av; pqtg; bc; 
    end;
   { Tourner le robot perpendiculairement au côté suivant. } 
   phtd; 
  end;
 st;
end.