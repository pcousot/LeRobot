{$mode macpas} program CarreZebre;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Carré zébré, page 180.                              *}
 {*                                                     *}
 {*******************************************************}

 var 
  I : integer;
  J : integer;
  K : integer;
  L : integer;
  
begin
 lg(3);
 for I:= 1 to 4 do
  begin
   for J := 1 to 9 do
    begin
     avf(3 * J); pqtd; avf(3 * J); p3htd; avf(3 * J); p3htd;
     if odd(J) then
      begin
       lc; avf(3 * J - 1); pqtd; av; peindre; pdt; av; pqtg;
       avf(3 * J -1); pdt; bc;
      end;
     phtd; avf(3 * J); p3htd; avf(3 * J); pqtd; avf(3 * J);
     if not odd(J) then
      begin
       lc; p3htd; avf(3 * J - 1); p3htd; av; peindre; pdt; 
       av; p3htg; avf(3 * J -1); phtd; bc;
      end;
     pqtd;
    end;
   pqtd;
  end;
 st;
end.