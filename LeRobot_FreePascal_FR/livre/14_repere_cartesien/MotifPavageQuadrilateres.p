{$mode macpas} program MotifPavageQuadrilateres;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motif du pavage de quadrilatères inscrit dans un    *}
 {* carré (6 x 6), page 157.                            *}
 {*                                                     *}
 {*******************************************************}

 { Motif du pavage de quadrilatères inscrit dans un carré (6 x 6) }
 
 procedure Motif;
  { Dessiner un motif dans un  carré (MotifX x MotifY), le robot par- }
  { tant  et  arrivant  au centre du motif orienté vers le nord. }
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    lc; pqtg; av; bc; 
    p3htd; av; av; pqtg; av; pdt; av; 
    phtg; av; av; pdt; av; pqtd; av; pqtd; av; 
    lc; p3htd; av; av; av; bc;
    phtd;  
  end;
 end; 

begin
 Motif;
 st;
end.