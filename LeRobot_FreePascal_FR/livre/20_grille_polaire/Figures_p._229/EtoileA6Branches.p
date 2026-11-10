{$mode macpas} program EtoileA6Branches;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Etoile, page 229.                                   *}
 {*                                                     *}
 {*******************************************************}

 const TailleQuadrillage = 20;
 
 procedure Etoile;
  var I : integer;
 begin
  phtd; 
  for I := 1 to 6 do 
   begin
    av; rt(60); av; rt(240);
   end;
 end;

begin 
 lg(TailleQuadrillage); Etoile; st;
end.