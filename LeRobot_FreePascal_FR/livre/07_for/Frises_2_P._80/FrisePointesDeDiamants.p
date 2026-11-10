{$mode macpas} program FrisePointesDeDiamants;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Rectangle;
  { Dessiner un rectangle, le robot partant du coin inférieur }
  { gauche  et arrivant au coin inférieur droit, orienté vers }
	{ le nord. } 
 begin
  av; av; pqtd; av; av; av; av; pqtd; av; av; pqtd; av; av; av; av; 
 end;
 
 procedure PointeDeDiamant;
  { Dessiner une pointe de diamant, le robot partant du coin }
  { inférieur  gauche  et  arrivant au coin inférieur droit, }
  { orienté vers le nord. } 
 begin
  Rectangle;
  p3htd; av; pqtg; av; pdt; av; phtg; av; av; phtg; av; pdt; av; 
  pqtg; av; p3htg;  
 end;
 
 procedure Frise;
  { Dessiner une frise de dix pointes de diamants juxtaposées }
  var I : integer;
 begin
  for I := 1 to 10 do
   begin
    PointeDeDiamant;
   end;
 end;
 
begin
 ag; Frise; st; 
end.