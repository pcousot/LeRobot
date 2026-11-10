{$mode macpas} program PiquetsEnDentsDeScie;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* PiquetsEnDentsDeScie, page 91.                      *}
 {*                                                     *}
 {*******************************************************}
 var I : integer; J : integer; K : integer;
begin
 ag;
 for I := 1 to 40 do
  begin
   for J := 1 to 2 do
    begin
     for K := 1 to (1 + ((I - 1) mod 5)) do
                 { .....................  à compléter }
      begin
       av;
      end;
     pdt;
    end;
   pqtd; av; pqtg; 
  end;
 st;
end.