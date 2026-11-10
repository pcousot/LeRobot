{$mode macpas} program RosaceDePentagones;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* RosaceDePentagones, page 226.                       *}
 {*                                                     *}
 {*******************************************************}
 const 
  LongueurCote = 40;
 var
  I : integer;
  J : integer;
begin
 pqtd; lg(LongueurCote); 
 for I := 1 to 10 do
  begin
   rt(36);
   for J := 1 to 5 do
    begin
     av; rt(72);
    end;
  end;
 st;
end.