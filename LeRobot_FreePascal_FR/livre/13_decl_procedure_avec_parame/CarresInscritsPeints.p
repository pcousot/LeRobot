{$mode macpas} program CarresInscritsPeints;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motif de carrés inscrits de Horemis, page 148.      *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre(M : integer);
  var J : integer;
 begin
  phtd; avf(M div 2);
  for J := 1 to 4 do
   begin
    pqtd; avf(M);
   end;
 end;
 
 procedure CarrePeint(M : integer);
  var J : integer;
 begin
  Carre(M); lc; 
  for J := 1 to 4 do
   begin
    phtg; peindre; p3htd; avf(M); 
   end;
  bc; 
 end;
 
begin
 lg(5); Carre(1); CarrePeint(2); Carre(2); CarrePeint(4); Carre(4); 
 CarrePeint(8); Carre(8); CarrePeint(16); Carre(16); CarrePeint(32); 
 st;
end.