{$mode macpas} program FriseDeLosangesEtZ;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 
 var M : integer;
 
begin
 ag;
 for M := 1 to 14 do
  begin
   { Losange }
   av; phtd; av; p3htd; av; phtd; av; p3htd; av; phtd; av; phtd; 
   { Z droit }
   av; pqtd; av; av; pqtg; av; pqtg; 
  end;
 st;
end.