{$mode macpas} program PolygonesInscrits1_2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Dessins récursifs, page 244.                        *}
 {*                                                     *}
 {*******************************************************}

 const N = 7;
 
 procedure Polygone(X : real);
  var I : integer;
 begin
  if (X >= 1) then
   begin
    tl(2 * X); 
    for I := 1 to (N - 1) do
     begin
      rt(360 / N); av;
     end;
    rt(360 / N); tl(X); 
    rt((180 / pi) * arctan(sin((2 * pi) / N) / (1 + cos((2 * pi) / N))));
    Polygone(sqrt(sqr(X * (1 + cos((2 * pi) / N))) + 
                  sqr(X * sin((2 * pi) / N))) / 2);
   end;
 end;
 
begin
 eb; pe; Polygone(40); st;
end.