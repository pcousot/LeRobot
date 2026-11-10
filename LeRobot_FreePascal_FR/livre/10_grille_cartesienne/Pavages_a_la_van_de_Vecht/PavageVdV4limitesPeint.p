{$mode macpas} program PavageVdV4limitesPeint;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage rectangulaire à quatre limites, page 121.    *}
 {*                                                     *}
 {*******************************************************}
 
 procedure Motif;
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

 procedure MotifPeint;
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  phtd; peindre; phtg; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pdt; avf(3); phtd; peindre; phtd; avf(3); lc; pdt; 
  avf(6); pdt; bc; 
 end;
 
 procedure ColonnePeinte;
  var I : integer;
 begin
  lgY(1); eh;
  for I := 1 to 4 do
   begin
    lgY(2 * I); MotifPeint; 
   end;
  for I := 1 to 3 do
   begin
    lgY(8 - (2 * I)); MotifPeint; 
   end;
  pqtd; avf(4); pqtg;
 end;
 
 var I : integer;

begin
 lgX(1); ag;
 { Dessiner un pavage irrégulier constitué de colonnes de largeurs }
 { 0, 2, 4, 6, ..., 10, 12, 10, ..., 2, 0.                         }
 lgX(0); Colonne;
 for I := 1 to 6 do
  begin
   lgX(2 * I); ColonnePeinte; 
  end;
 for I := 1 to 5 do
  begin
   lgX(12 - (2 * I)); ColonnePeinte; 
  end;
 lgX(0); Colonne;
 st;
end.