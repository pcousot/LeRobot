{$mode macpas} program EtoileFractaleDeSedgewick1;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Etoile fractale de Sedgewick, page 261.             *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre(X, Y, L : integer);
  { Dessiner un carré centré en (X, Y) de longueur de côté 2 * L }
  var I : integer;
 begin
  deplacer(X - L, Y - L);
  for I := 1 to 4 do
   begin
    avf(2 * L); pqtd; 
   end;
 end;

 procedure Etoile(X, Y, L : integer);
 begin
  if L > 0 then
   begin
    Etoile(X - L, Y + L, L div 2);
    Etoile(X + L, Y + L, L div 2);
    Etoile(X - L, Y - L, L div 2);
    Etoile(X + L, Y - L, L div 2);
    Carre(X, Y, L);
   end;
 end;
 
begin
 lg(3); Etoile(0, 0, 16);
 st; 
end.