{$mode macpas} program FriseLosanges;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Dent;
  { Dessiner une dent de scie /\ }
 begin
  av; av; pqtd; av; av; pqtg; 
 end;
 
 procedure Scie;
  { Dessiner une frise en dents de scie /\/\/\/\... }
  var I : integer;
 begin
  for I := 1 to 10 do
   begin
    Dent;
   end;
 end;
 
 procedure Frise;
  { Dessiner la frise de losanges }
  var J : integer;
 begin
  { Déplacement à gauche du cadre, orientation au NE }
  ag; phtd; 
  { Dessiner la frise de losanges par moitiés }
  for J := 1 to 2 do
   begin
    Scie;
    { Dessiner l'extrémité }
    phtg; av; av; p3htg;
   end; 
 end;
 
begin 
 Frise; st;
end.