{$mode macpas} program PavageCarresCoinsArrondis;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}

 procedure Rangee;
  var
   I : integer;
   J : integer;
 begin
  { Dessiner une rangée de pavés }
  for  I := 1 to 20 do 
   begin
    { Dessiner un pavé }
    bc;
    for J := 1 to 4 do
     begin
      { Dessiner un coté du pavé }
      av; vd;
     end;
    { Rejoindre le début du pavé suivant }
    lc; pqtd; av; av; pqtg;
   end;
 end;

 procedure Retour;
  var I : integer;
  { Rejoindre le début de la rangée suivante de pavés }
 begin
  pdt; av; pqtd;
  for I := 1 to 40 do 
   begin
    av;
   end;
  pqtg; av; pdt;
 end;
 
 procedure Pavage;
  { Dessiner 10 rangées de pavés }
  var I : integer;
 begin
  for  I := 1 to 10 do
   begin
    Rangee; Retour;
   end;
 end;
 
begin
 { Placer le robot en haut à gauche de l'écran }
 eh; ag; lc; pdt; av; av; pdt; bc; 
 Pavage;
 st;
end.