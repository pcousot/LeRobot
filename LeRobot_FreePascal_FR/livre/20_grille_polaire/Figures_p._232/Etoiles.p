{$mode macpas} program Etoiles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Etoiles, page 232.                                  *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleQuadrillage = 15;
  Nmax = 10;      { Nombre maximum de branches des étoiles, N >= 2 }
  alpha = 30; { 0 < alpha < ((N - 2) * 180) / N }
 
 procedure Etoile(N : integer);
  var I : integer;
 begin
  for I := 1 to N do
   begin
    av; pdt; rt(((2 * (N - 1)) * 180) / N - alpha);
    av; pdt; rt(alpha);
   end;
 end;
 
 var I : integer;
 
begin
 lg(TailleQuadrillage); ag;
 for I := 2 to Nmax do
  begin
   Etoile(I);
   lg(TailleQuadrillage); translater(3, 0); 
  end;
 st;
end.