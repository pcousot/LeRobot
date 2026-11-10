{$mode macpas} program Vegetal2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Végétaux fractales, page 260.                       *}
 {*                                                     *}
 {*******************************************************}

 const
  L = 1; { Longueur des rameaux }
  A = 45; { Angle des rameaux }
 
 procedure Retour (N : integer);
  { Parcours un arbre de taille N de haut en bas }
 begin
  if N = 0 then
   begin
    tl(L);
   end
  else
   begin
    Retour(N - 1);
    Retour(N - 1);
    Retour(N - 1);
   end;
 end;

 procedure Arbre (N : integer);
 begin
  if N = 0 then
   begin
    tl(L);
   end
  else
   begin
    Arbre(N - 1);
    Arbre(N - 1);
    rt(-A);
    Arbre(N - 1); lc; rt(180); Retour(N - 1); rt(180); bc; 
    rt(2 * A);
    Arbre(N - 1); lc; rt(180); Retour(N - 1); rt(180); bc; 
    rt(-A);
    Arbre(N - 1);
   end;
 end;
     
begin
 eb; Arbre(5); st;
end.

