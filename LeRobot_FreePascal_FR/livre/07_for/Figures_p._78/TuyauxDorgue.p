{$mode macpas} program TuyauxDorgue;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quadrillages, carrés, spirale et tuyaux d'orgue,    *}
 {* page 78.                                            *}
 {*                                                     *}
 {*******************************************************}

 var 
  I : integer;
  J : integer;
begin
 pqtd; 
 for I := 1 to 10 do
  begin
   av; pqtg; 
   for J := 1 to I do
    begin
     av;
    end;
   pqtd; av; pqtd; 
   for J := 1 to I do
    begin
     av;
    end;
   pqtg;
  end;
 st; 
end.