{$mode macpas} program CouronnesLosangiques;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavages du carré, page 134.                         *}
 {*                                                     *}
 {*******************************************************}
  const
   NbCarres = 7; { Nombre de carrés (supposé impair) }
  var
   I : integer; 
   J : integer; 
begin
 phtd;
 { Dessiner un point (carré de côté nul) }
 dp;
 for I := 1 to NbCarres do
  begin
   { Placer le robot au point de départ du tracé du carré suivant. }
   p3htg; lc; av; p3htd; bc;
   { Dessiner un carré, de longueur de côté I, le robot démarrant et }
   { retournant au coin inférieur gauche, orienté au NW. }
   for J := 1 to 4 do
    begin
     avf(I); pqtd;
    end;
  end;
 { Peindre une couronne sur deux }
 ce; phtg; lc;
 for I := 1 to (NbCarres div 2) do
  begin
   av; peindre; av;
  end;
 { Peindre la dernière couronne de rang impair }
 av; peindre;
 st;
end.