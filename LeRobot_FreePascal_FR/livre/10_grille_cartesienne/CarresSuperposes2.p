{$mode macpas} program CarresSuperposes2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* CarresSuperposes2, pages 111-112.                   *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre;
 begin
  av; pqtd; av; pqtd; av; pqtd; av; pqtd; 
 end;
 
 var I : integer;
 
begin
 eb; ag;
 for I := 1 to 14 do
  begin
   lg(6 * I); Carre;
  end;
 st;
end.