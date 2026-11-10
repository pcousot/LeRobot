{$mode macpas} program FriseDeTildesErronee2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDeTildesErronee2, page 77.                     *}
 {*                                                     *}
 {*******************************************************}
 
 procedure Tilde;
  { Dessiner un motif en forme de tilde ~ }
 begin
  phtd; av; phtd; av; pqtd; av; av; pqtg; av; phtg; av;
 end;

 var I : integer;
 
begin
 for I := 1 to 13 do
  begin
   Tilde; { Reculer au début du tilde suivant } lc; p3htg; av; bc;
  end;
 st;
end.