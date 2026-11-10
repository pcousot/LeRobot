{$mode macpas} program Cube;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développements des solides de Platon, page 235.     *}
 {*                                                     *}
 {*******************************************************}

 const Cote = 18;

 procedure Carre;
 begin
  av; pqtd; av; pqtd; av; pqtd; av; pqtd; av;
 end;

 var I :integer;
 
begin
 eb; lg(Cote);
 Carre; Carre; Carre;
 pqtg; av; pqtd; Carre;
 pqtd; av; pqtg; Carre;
 pqtd; av; pqtd; av; pqtg; Carre;
 st;
end.