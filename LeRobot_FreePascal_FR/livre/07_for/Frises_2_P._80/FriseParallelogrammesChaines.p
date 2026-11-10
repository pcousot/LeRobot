{$mode macpas} program FriseParallelogrammesChaines;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure FriseParallelogrammes;
  var I : integer;
 begin
  for I := 1 to 14 do
   begin
    { Parallélogramme }
    phtd; av; phtd; av; p3htd; av; phtd; av;
    { Rejoindre le coin NE }
    p3htd; av; phtd; av; 
    { Lien avec le coin SW du parallélogramme suivant }
    phtd; av; p3htg; 
   end;
 end;
 
begin 
 ag;
 FriseParallelogrammes;
 pdt; 
 FriseParallelogrammes;
 st; 
end.