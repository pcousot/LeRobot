{$mode macpas}  program MacintoshSE;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Micro-ordinateur, page 147.                         *}
 {*                                                     *}
 {*******************************************************}

 procedure Rectangle (Hauteur : integer; Largeur : integer);
  { Dessiner  un  rectangle  de  hauteur  et largeur passés en }
  { paramètres, le robot partant et arrivant au coin inférieur }
  { gauche, orienté vers le nord.                              }
  var I : integer;
 begin
  for I := 1 to 2 do
   begin
    avf(Hauteur);
    pqtd;
    avf(Largeur);
    pqtd;  
   end;
 end;

begin 
 { Clavier }
 Rectangle(1, 8);
 { Boitier }
 av; pqtd; av; pqtg; Rectangle(3, 6);
 avf(3); Rectangle(5, 6);
 { Ecran }
 pqtd; av; pqtg; lc; av; bc; Rectangle(3, 4);
 { Logo représenté par une croix }
 pdt; lc; avf(3); bc; dc;
 { Lecteur de disquettes inférieur }
 pqtg; lc; av; av; bc; avf(2);
 { Lecteur de disquettes supérieur }
 pqtg; lc; av; pqtg; bc; avf(2);
 st;
end.