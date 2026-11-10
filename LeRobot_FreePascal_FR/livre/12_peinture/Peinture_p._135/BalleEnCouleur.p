{$mode macpas} program BalleEnCouleur;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Balle en trois couleurs, page 135.                  *}
 {* BalleEnCouleur, page 139.                           *}
 {*                                                     *}
 {*******************************************************}
 
 const
  EpaisseurBord = 3;
  DemiRayon = 30;

 procedure Quart_De_Figure;
 begin
  lg(DemiRayon); vg; vg; lg(2 * DemiRayon); vg; ce; pdt;
 end;
 
 procedure Peindre_Quart_De_Figure;
   { Placer le robot dans la zone à peindre et peindre }
 begin
   lg(DemiRayon div 2); lc; ce; pqtd; av; bc; peindre;
 end;

 var I : integer;

begin
 ec(EpaisseurBord);
 for I := 1 to 4  do
  begin
   Quart_De_Figure;
  end;
 for I := 1 to 2  do
  begin
   cc(bleu);   Peindre_Quart_De_Figure;
   cc(violet); Peindre_Quart_De_Figure;
  end;
 st;
end.