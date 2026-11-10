{$mode macpas} program PavageDuDisque;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage du disque à la Escher, page 233.             *}
 {*                                                     *}
 {*******************************************************}
 const
  Nc = 8; { Nombre de cercles concentriques }
  Nr = 18; { Nombre de rayons sur 180° (diviseur de 180) }
  Dc = 10; { Distance entre deux cercles, comptée en pixels }
 var
  I : integer;
  J : integer;
begin
 lg(Dc * Nc);
 { Tracer les rayons }
 for I := 1 to (2 * Nr) do
  begin
   ce; rt(180 div Nr); av;
  end;
 { Tracer les cercles concentriques }
 for I := 1 to Nc do
  begin
   ce; pn; lg(((Nc + 1) - I) * Dc); av; pqtg; vg; vg; vg; vg; 
  end;
 lc; 
 { Peintre }
 for I := 1 to Nc do
  begin
   ce; pn; lg((((Nc + 1) - I) * Dc) - 3);
   if odd(I) then
    begin
     rt(180 div Nr);
    end;
   for J := 1 to Nr do
    begin
    ce; rt(180 div Nr); av; pqtg; peindre; pqtd;
    ce; rt(180 div Nr); 
   end;
  end;
 st;
end.