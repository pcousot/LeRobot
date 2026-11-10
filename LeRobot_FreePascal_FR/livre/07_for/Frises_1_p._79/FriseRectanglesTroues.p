{$mode macpas} program FriseRectanglesTroues;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
  var U : integer;
begin 
{ Rejoindre le bord ouest }
 ag; lc; pqtd; av; pdt; bc;
 for U := 1 to 6 do
  begin
    { Dessiner un rectangle troué au nord }
    av; pqtg; av; av; pqtg; av; av; av; pqtg; av; av; pqtg; av; 
    { Traverser au sud-est }
    lc; p3htg; av; av; p3htd; bc;
    { Dessiner un rectangle troué au sud }
    av; pqtd; av; av; pqtd; av; av; av; pqtd; av; av; pqtd; av; 
    { Traverser au nord-est }
    lc; p3htd; av; av; p3htg; bc;
  end;
 { Dessiner un rectangle troué au nord }
 av; pqtg; av; av; pqtg; av; av; av; pqtg; av; av; pqtg; av; 
 { Traverser au sud-est }
 lc; p3htg; av; av; p3htd; bc;
 { Dessiner un rectangle troué au sud }
 av; pqtd; av; av; pqtd; av; av; av; pqtd; av; av; pqtd; av; 
 st;
end.