{$mode macpas} program FriseDeTildesErronee1;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDeTildesErronee1, page 76.                     *}
 {*                                                     *}
 {*******************************************************}
 
 procedure Tilde;
  { Dessiner un motif en forme de tilde ~ }
 begin
  phtd; av; phtd; av; pqtd; 
  av; av; pqtg; av; phtg; av;
 end;

 var I : integer;
 
begin
 for I := 1 to 10 do
  begin
   Tilde;
  end;
 st;
end.