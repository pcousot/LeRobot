{$mode macpas} program EtoileFractaleDeSedgewick2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Etoile fractale de Sedgewick, page 261.             *}
 {*                                                     *}
 {*******************************************************}

 const
  Aucun = 0;
  NW = 1;
  NE = 2;
  SE = 3;
  SW = 4; 
 
 procedure Carre(X, Y, L : integer; CM : integer);
  { Dessiner un carré centré en (X, Y) de longueur de côté 2 * L et auquel il manque }
  { le coin C }
  var I : integer;
 begin
  deplacer(X - L, Y);
  for I := NW to SW do
   begin
    if I = CM then
     begin
      lc;
     end;
    avf(L); pqtd; avf(L); 
    bc;
   end;
 end;

 procedure Etoile(X, Y, L : integer; CM : integer);
 begin
  if L > 0 then
   begin
    if CM <> NW then
     begin
      Etoile(X - L, Y + L, L div 2, SE);
     end;
    if CM <> NE then
     begin
      Etoile(X + L, Y + L, L div 2, SW);
     end;
    if CM <> SW then
     begin
      Etoile(X - L, Y - L, L div 2, NE);
     end;
    if CM <> SE then
     begin
      Etoile(X + L, Y - L, L div 2, NW);
     end;
    Carre(X, Y, L, CM);
   end;
 end;
 
begin
 lg(3); Etoile(0, 0, 16, Aucun); st; 
end.