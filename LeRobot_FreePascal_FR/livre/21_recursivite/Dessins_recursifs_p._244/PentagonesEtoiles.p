{$mode macpas} program PentagonesEtoiles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Dessins récursifs, page 244.                        *}
 {*                                                     *}
 {*******************************************************}

 const
  alpha = 36; { 0 < alpha < ((5 - 2) * 180) / 5 }
 
 procedure Etoile (N : integer);
  { Etoile à 5 branches, N >= 5 }
  var I : integer;
 begin
  for I := 1 to N do
   begin
    av; pdt; rt(((2 * (5 - 1)) * 180) / 5 - alpha);
    av; pdt; rt(alpha);   
   end;
 end;

 procedure PentagoneEtoile (L : real);
  var I : integer;
 begin
  if (L > 2) then 
   begin
   { Initialisation }
   lc; pe; lgrt(L, alpha); avf(1); lgrt(2 * vallgx, alpha); avf(2); bc;
   
   { Pentagone étoilé } 
   lgrt(L, alpha); rt(180 - alpha); Etoile(5);
   for I := 0 to  3 do
    begin
     rt((I div 2) * alpha);
     lgrt(vallgx * 2, 36); rt((- 2 - (I div 2)) * alpha); Etoile(8);
     pe; lgrt(L, alpha); rt(180 - alpha + I * 72); Etoile(9);
    end;
   rt(- alpha); lgrt(vallgx * 2, 36); rt(- alpha); Etoile(7);
   
   { Prochain pentagone étoilé }
   pe; lgrt(L, alpha); lgrt(vallgx * 2, 36); avf(-1);
   PentagoneEtoile(L * (2 / (1 + 4 * cos(36 / 180 * pi))));
  end;
 end;
 
const 
 L=31;
begin
 eb; PentagoneEtoile(L);
 st;
end.