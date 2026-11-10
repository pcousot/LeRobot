{$mode macpas} program LigneDeCarres2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* LigneDeCarres2, page 154.                           *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre;
  { Dessin d'un carré de côté 1 }
 begin
  av; pqtd; av; pqtd;
  av; pqtd; av; pqtd; 
 end;
 
 var I : integer;
  
begin
 for I := 1 to 10 do
  begin
   translater(1, 1);
   Carre;
  end;
 st;
end.