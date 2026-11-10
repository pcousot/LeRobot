{$mode macpas} program RosaceDhexagones;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces polygonales, page 230.                      *}
 {*                                                     *}
 {*******************************************************}

 const L = 30; { Longueur d'un segment }
 
 procedure Hexagone;
  var I : integer;
 begin
  tl(L); 
  for I := 1 to 6 do
   begin
    rt(60); av; 
   end;
 end;
 
 procedure Rosace;
  var I : integer;
 begin
  for I := 1 to 12 do
   begin
    Hexagone; rt(30);
   end;
 end;
 
begin
 Rosace; st;
end.