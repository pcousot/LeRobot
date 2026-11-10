{$mode macpas} program PavageRouesDentees;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de roues dentées, pages 178, 181-182.        *}
 {*                                                     *}
 {*******************************************************}

 const 
  TailleGrille = 10;
  NombreDeMotifsParLigne = 7;
  NombreDeLignes = 14;
  
 procedure EnHaut;
  { Avancer le robot tout droit, jusqu'à deux carreaux du bord nord }
  { du cadre.                                                       }
 begin
  eh; pdt; avf(2);
 end;

 procedure RoueDentee;
  { Dessiner le motif du pavage }
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    av; pqtd; vd; pqtg; vg; pqtg; 
   end;
 end;

 procedure Pavage;
  var 
   I : integer;
   J : integer;
   L : integer; 
 begin
  for L := 1 to NombreDeLignes do
   begin
    lc; EnHaut; ag; 
    avf(L); pqtg; av;
    { Décalage en début de ligne }
    if (L mod 5) = 2 then
     begin
      avf(2);
     end
    else if (L mod 5) = 3 then
     begin
      avf(4);
     end
    else if (L mod 5) = 4 then
     begin
      av;
     end
    else if (L mod 5) = 0 then
     begin
      avf(3);
     end;
    { Dessiner une ligne de motifs }
    pqtg; bc;
    for J := 1 to (NombreDeMotifsParLigne - 1) do 
     begin
      RoueDentee;
      translater(5, 0); 
     end;
    RoueDentee;
   end;
 end;

begin
 lg(TailleGrille); Pavage; st;
end.