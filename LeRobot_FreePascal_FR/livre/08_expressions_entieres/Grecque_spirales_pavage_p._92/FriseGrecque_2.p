{$mode macpas} program FriseGrecque_2;
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
 var
  I : integer;
  J : integer;
  K : integer;
begin
 ag;
 for I := 1 to 8 do
  begin
   for J := 1 to 4 do
    begin
     av; 
    end;
   pqtd; 
   for J := 1 to 4 do
    begin
     for K := 1 to (5 - J) do
      begin
       av; 
      end;
     pqtd; 
    end;
   av; pqtg; 
   for J := 1 to 4 do
    begin
     for K := 1 to J do
      begin
       av; 
      end;
     pqtg; 
    end;
  end;
 st; 
end.
