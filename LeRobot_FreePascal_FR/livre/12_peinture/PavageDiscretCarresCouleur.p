{$mode macpas} program PavageDiscretCarresCouleur;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de carrés disjoints en couleur, page 136.    *}
 {*                                                     *}
 {*******************************************************}
 const
  TailleGrille = 19;
  TailleCrayon = 15;
  LongueurLigne = 23;
 
 procedure Colonne;
  var I : integer;
 begin
  ag;
  for I := 1 to LongueurLigne do
   begin
    av; dp; 
   end;
  pqtg; av; pqtd; 
 end;
 
begin
 lg(TailleGrille); ec(TailleCrayon); eb; pqtd; lc;
 cc(jaune); Colonne; cc(bleu); Colonne;   cc(violet); Colonne;
 cc(vert); Colonne;  cc(rouge); Colonne;  cc(indigo); Colonne;
 cc(noir); Colonne;  cc(indigo); Colonne; cc(rouge); Colonne;
 cc(vert); Colonne;  cc(violet); Colonne; cc(bleu); Colonne;
 cc(jaune); Colonne;
 st;
end.