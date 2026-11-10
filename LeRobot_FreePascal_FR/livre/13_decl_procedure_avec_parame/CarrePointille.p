{$mode macpas} program CarrePointille;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* CarrePointille, page 144.                           *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner un carré en pointillé }
 
 procedure TraitPointille (N : integer);
  { Tracer un trait pointillé de N }
  { points, en supposant N > 1.    }
  var L : integer;
 begin
  lg(2); lc; 
  for L := 1 to (N - 1) do
   begin
    dp; av;
   end;
  dp; bc;
 end;
 
 procedure Carre (P : integer);
  { Tracer un carré pointillé avec P points par côté (P > 1). }
  var C : integer;
 begin
  for C := 1 to 4 do 
   begin
    TraitPointille(P); pqtd;
   end;
 end;
 
begin
 Carre(30); st;
end.