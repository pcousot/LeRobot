{$mode macpas} program CourbeDeMoritz;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe de Moritz, page 237.                         *}
 {*                                                     *}
 {*******************************************************}
  const
   a = 60;
  var
   Theta : integer;
begin
 lc; cacherRobot;
 for Theta := -1800 to 1800 do
  begin
   ce; pe; rt(Theta); tl(a * cos((9 * ((Theta / 180) * pi)) / 10)); dp;
  end;
 st;
end.