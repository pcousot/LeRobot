{$mode macpas} program LimaconDePascal;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Limaçon de Pascal, page 237.                        *}
 {*                                                     *}
 {*******************************************************}
  const
   a = 40;
   b = 80;
  var
   Theta : integer;
begin
 lc;
 for Theta := 0 to 360 do
  begin
   ce; pe; rt(Theta); tl(a + (b * cos((Theta / 180) * pi))); dp;
  end;
 st;
end.