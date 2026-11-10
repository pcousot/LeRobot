{$mode macpas} program FriseCrantee;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79 et FriseCrantee, page 82.       *}
 {*                                                     *}
 {*******************************************************}
 
 procedure Cran;
  { Dessiner le motif 'n_' }
 begin
   av; pqtd; av; pqtd; av; pqtg; av; pqtg;
 end;
 
 var I : integer;
 
begin
 ag; 
 for I:= 1 to 20 do
  begin 
   Cran;
  end;
 st;
end.