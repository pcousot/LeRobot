{$mode macpas} program EtoileA5Branches;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Etoile, page 229.                                   *}
 {*                                                     *}
 {*******************************************************}

 const TailleQuadrillage = 60;
 
 procedure Etoile;
  var I : integer;
 begin
  phtg; 
  for I := 1 to 5 do 
   begin
    av; rt(144);
   end;
 end;

begin 
 lg(TailleQuadrillage); Etoile; st;
end.