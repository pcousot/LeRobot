{$mode macpas} program MotifDeBeard;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motif de Beard, page 220.                           *}
 {*                                                     *}
 {*******************************************************}

 const
  GrilleInitiale = 3; { >= 3 }
  NbCouronnes = 4;

 procedure CarreNoirDroit;
 begin
  av; pqtd; av; pqtd; av; pqtd; av; phtg; peindre; pdt; av;
 end;
 
 procedure CarreNoirOblique;
 begin
  av; pqtd; av; pqtd; av; pqtd; av; lc; p3htd; av; peindre; av; bc; 
 end;
 
 function Tg(X : real) : real;
  const
   MinPosReal = 1.2e-38;
   MaxPosReal = 3.4e+38;
 begin
  if abs(cos(X)) <= MinPosReal then
   begin
    Tg := MaxPosReal;
   end
  else
   begin
    Tg := (sin(X) / cos(X));
   end;
  end;
 
 procedure Couronne;
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    CarreNoirDroit;
    lg(valLgX / sqrt(2)); 
    CarreNoirOblique;
    lg(valLgX * sqrt(2)); 
   end;
 end;
 
 procedure Motif;
  var I : integer;
 begin
  for I := 1 to (NbCouronnes - 1) do
   begin
    Couronne;
    { Placer le robot au coin inférieur gauche du carré supérieur }
    { gauche de la couronne suivante.                             }
    lc; av; pqtg; 
    lg(valLgX * Tg((3 * pi) / 8)); 
    av; pqtd; bc;
   end;
  Couronne;
 end;
 
begin
 lg(GrilleInitiale); Motif; st;
end.