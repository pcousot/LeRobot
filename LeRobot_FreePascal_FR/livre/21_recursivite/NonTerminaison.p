{$mode macpas} program NonTerminaison;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* NonTerminaison, page 250.                           *}
 {*                                                     *}
 {*******************************************************}

 procedure Boucler;
 begin
  Boucler;
 end;

begin
 Boucler; st;
end.