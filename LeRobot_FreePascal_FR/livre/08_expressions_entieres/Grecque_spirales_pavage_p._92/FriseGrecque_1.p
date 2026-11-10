{$mode macpas} program FriseGrecque_1;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Grecque, spirales, pavage triangulaire et carré à   *}
 {* franges, page 92.                                   *}
 {*                                                     *}
 {*******************************************************}

 var I : integer;

begin
 ag;
 for I := 1 to 8 do
  begin
   av; av; av; av; pqtd; 
   av; av; av; av; pqtd; 
   av; av; av; pqtd; 
   av; av; pqtd; 
   av; pqtd; 
   av; pqtg; 
   av; pqtg; 
   av; av; pqtg; 
   av; av; av; pqtg; 
   av; av; av; av; pqtg; 
  end;
 st; 
end.
