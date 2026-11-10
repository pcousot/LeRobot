{$mode macpas} program Rhodoneae;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rhodoneae à trois pétales, page 237.                *}
 {*                                                     *}
 {*******************************************************}
  const a = 60;
  var Theta : integer;
begin
 lc; cacherRobot;
 for Theta := 0 to 180 do
  begin
   ce; pe; rt(Theta); tl(a * cos(3 * ((Theta / 180) * pi)));dp;
  end;
 st;
end.