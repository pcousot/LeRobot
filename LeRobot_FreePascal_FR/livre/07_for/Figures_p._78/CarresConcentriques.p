{$mode macpas} program CarresConcentriques;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quadrillages, carrés, spirale et tuyaux d'orgue,    *}
 {* page 78.                                            *}
 {*                                                     *}
 {*******************************************************}
  var
   I : integer; 
   J : integer; 
   K : integer;
begin
 phtd;
 { Dessiner un point (carré de côté nul) }
 dp;
 for I := 1 to 10 do
  begin
   { Placer le robot au point de départ du tracé du carré suivant. }
   p3htg; lc; av; p3htd; bc;
   { Dessiner un carré, de longueur de côté I, le robot démarrant et }
   { retournant au coin inférieur gauche, orienté au NW. }
   for J := 1 to 4 do
    begin
     { Avancer de I positions. }
     for K := 1 to I do
      begin
       av;
      end;
     pqtd;
    end;
  end;
 st;
end.