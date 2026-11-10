{$mode macpas} program Cristal8Branches;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Cristal à huit branches, page 107.                  *}
 {*                                                     *}
 {*******************************************************}
 
 procedure Branche;
 begin
  phtg; avf(5); pqtd; phtg; av; pqtd; av; phtd; avf(5); pqtg;
 end;

 procedure Cristal;
  var J : integer;
 begin
  for J := 1 to 8 do 
   begin
    Branche;
   end; 
 end;
 
begin
 lg(4); Cristal; st;
end.