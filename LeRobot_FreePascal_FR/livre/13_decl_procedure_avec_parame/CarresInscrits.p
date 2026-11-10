{$mode macpas} program CarresInscrits;
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
 
begin
 lg(5); Carre(1); Carre(2); Carre(2); Carre(4); Carre(4); Carre(8); 
 Carre(8); Carre(16); Carre(16); Carre(32); st;
end.