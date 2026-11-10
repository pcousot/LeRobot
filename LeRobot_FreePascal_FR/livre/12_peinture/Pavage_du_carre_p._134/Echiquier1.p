{$mode macpas} program Echiquier1;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavages du carré, page 134.                         *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner un échiquier 8 x 8 }
 
 procedure CarreBlanc;
  { Dessiner un carré blanc de longueur de côté 2 en partant  du }
  { coin inférieur gauche et en arrivant au coin inférieur droit }
  { avec le robot orienté dans la même direction nord ou sud.    }
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    avf(2); pqtd; 
   end;
  pqtd; avf(2); pqtg; 
 end;

 procedure CarreNoir;
  { Dessiner un carré noir de longueur de côté  2  en partant du }
  { coin inférieur gauche et en arrivant au coin inférieur droit }
  { avec le robot orienté dans la même direction nord ou sud.    }
 begin
  CarreBlanc;
  { Mettre le robot dans le crré blanc et peindre en noir. }
  lc; phtg; av; peindre; 
  { Retourner au coin inférieur droit. }
  pdt; av; p3htg; bc; 
 end;

 var
  I : integer;
  J : integer;
begin
 avf(6);
 for I := 1 to 4 do
  begin
   { Dessiner une ligne impaire de huit carrés alternativement }
   { blancs et noirs. }
   for J := 1 to 4 do
    begin
     CarreBlanc; 
     CarreNoir;
    end;
   { Retourner le robot pour dessiner une ligne paire de droite }
   { à gauche. }
   pdt; 
   { Dessiner une ligne paire de huit carrés alternativement }
   { blancs et noirs. }
   for J := 1 to 4 do
    begin
     CarreBlanc; 
     CarreNoir;
    end;
   { Descendre le robot pour dessiner une ligne impaire de }
   { de gauche à droite. }
   lc; avf(4); pdt; bc; 
  end;
 st;
end.