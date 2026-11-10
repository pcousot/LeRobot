{$mode macpas} program PavageOctogonesJuxtaposes;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage d'octogones juxtaposés, page 178.            *}
 {*                                                     *}
 {*******************************************************}

 const TailleGrille = 6;
  
 procedure Ligne (N : integer);
  { Placer le robot à gauche de la Nème ligne de pavés }
  var K : integer;
 begin
  eh; ag; lc; 
  ps;
  for K := 1 to N - 1 do
   begin
    avf(2);
   end;
  av; 
  pdt; bc;
 end;

 procedure Pave;
  { Dessiner un pavé octogonal }
  var C : integer;
 begin
  for C := 1 to 8 do
   begin
    phtd; av;
   end;
 end;
  
 procedure PlacerADroite;
  { Laisser la place pour le cabochon carré }
 begin
  lc; pqtd; avf(4); pqtg; bc;
 end;
  
 procedure LigneDePaves (N : integer);
  { Dessiner une ligne de N paves }
  var P : integer;
 begin
  for P := 1 to N do
   begin
    Pave; PlacerADroite;
   end;
 end;
  
 procedure Decaler;
  { Decaler les debuts de lignes de rang impair }
 begin
   lc; pqtd; avf(2); pqtg; bc;
 end;
  
 procedure Pavage(NbLignes : integer; NbColonnes : integer);
  var L : integer;
 begin
  for L := 1 to NbLignes do
   begin
    Ligne(L);
    if odd(L) then
     begin
      Decaler;
     end;
    if odd(L) then
     begin
      LigneDePaves(NbColonnes - 1);
     end
    else
     begin
      LigneDePaves(NbColonnes);
     end;
   end;
 end;
 
begin
 lg(TailleGrille);
 Pavage(12, 8);
 st;
end.