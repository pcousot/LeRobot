{$mode macpas} program PavageVdV4limites;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage rectangulaire à quatre limites, pages 121 et *}
 {* 123-124.                                            *}
 {*                                                     *}
 {*******************************************************}

 { Pavage irrégulier dans le style de  M. C. Escher,  inspiré d'un }
 { motif de N. J. van de Vecht.                                    }

 procedure Motif;
  { Motif de N. J. van de Vecht, le robot partant en haut à gauche }
  { et arrivant en bas à gauche orienté vers le nord.              }
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pdt; avf(3); pqtd; avf(3); lc; pdt; avf(6); pdt; bc; 
 end;
 
 procedure Colonne;
  var I : integer;
  { Dessiner  une  colonne  de  motifs  de  hauteurs   2, 4, 6, 8, }
  { 6, 4, 2,  le robot partant en haut à gauche et arrivant en bas }
  { à droite (c'est-à-dire en bas à gauche de la colonne suivante) }
  { orienté vers le nord.                                          }
 begin
  lgY(1); eh;
  for I := 1 to 4 do
   begin
    lgY(2 * I); Motif; 
   end;
  for I := 1 to 3 do
   begin
    lgY(8 - (2 * I)); Motif; 
   end;
  pqtd; avf(4); pqtg;
 end;
 
 procedure Pavage;
  { Dessiner un pavage irrégulier constitué de colonnes de largeurs }
  { 0, 2, 4, 6, ..., 10, 12, 10, ..., 2, 0.                         }
  var I : integer;
 begin
  lgX(1); ag; lgX(0);
  for I := 1 to 6 do
   begin
    Colonne; lgX(2 * I);
   end;
  for I := 1 to 6 do
   begin
    Colonne; lgX(12 - (2 * I));
   end;
  Colonne; 
 end;
 
begin
 Pavage; st;
end.