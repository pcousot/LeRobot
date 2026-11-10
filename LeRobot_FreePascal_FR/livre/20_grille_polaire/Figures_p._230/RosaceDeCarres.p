{$mode macpas} program RosaceDeCarres;
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
 
 procedure Carre;
 begin
  tl(L); rt(90); av; rt(90); av; rt(90); av; rt(90); av; 
 end;
 
 procedure Rosace;
  var I : integer;
 begin
  for I := 1 to 6 do
   begin
    rt(30); tl(L); rt(30); Carre;  
   end;
 end;
 
begin
 Rosace; st;
end.