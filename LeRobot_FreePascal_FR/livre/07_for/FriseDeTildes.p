{$mode macpas} program FriseDeTildes;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDeTildes, page 75.                             *}
 {*                                                     *}
 {*******************************************************}

 procedure Tilde;
  { Dessiner un motif en forme de tilde ~ }
 begin
  phtd; av; phtd; av; pqtd; av; av; pqtg; av; phtg; av;
 end;

 var I : integer;
 
begin
 ag;
 for I := 1 to 10 do
  begin
   Tilde;
   { Reculer au début du tilde suivant }
   lc; p3htg; av; bc;
   { Orienter le robot au nord }
   pqtd; 
  end;
 st;
end.