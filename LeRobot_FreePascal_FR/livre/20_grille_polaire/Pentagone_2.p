{$mode macpas} program Pentagone_2;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pentagone_2, page 226.                              *}
 {*                                                     *}
 {*******************************************************}
 const LongueurCote = 50;
 var J : integer;
begin
 lg(LongueurCote); pe;
 for J := 1 to 5 do
  begin
   av;
   rt(72);
  end;
 st;
end.