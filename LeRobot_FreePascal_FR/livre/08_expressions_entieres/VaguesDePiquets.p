{$mode macpas} program VaguesDePiquets;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* VaguesDePiquets, page 91.                           *}
 {*                                                     *}
 {*******************************************************}
 var I : integer; J : integer; K : integer; L : integer;
begin
 ag;
 for I := 1 to 8 do
  begin
   for J := 1 to 5 do
    begin
     for K := 1 to 2 do
      begin
       for L := 1 to ( ((6 - J) * ((I + 1) mod 2)) 
                     + (     J  * ( I      mod 2)) )  do
        begin
         av;
        end;
       pdt; 
      end;
     pqtd; av; pqtg; 
    end;
  end;
 st;
end.