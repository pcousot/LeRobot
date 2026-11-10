{$mode macpas} program PavageQuadrilateres;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de quadrilatères, page 155.                  *}
 {* PavageQuadrilateres, page 157                       *}
 {*                                                     *}
 {*******************************************************}

 { Pavage de quadrilatères produits par un motif inscrit dans un }
 { carré (6 x 6). }
 
 const
  TailleGrilleX = 6;
  TailleGrilleY = 6;
  MotifX        = 6; { Largeur du motif }
  MotifY        = 6; { Hauteur du motif }

 procedure Motif;
  { Dessiner un motif dans un  carré }
  { (MotifX x MotifY), le robot par- }
  { tant  et  arrivant  au centre du }
  { motif orienté vers le nord. }
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    lc; pqtg; av; bc; 
    p3htd; av; av; pqtg; av; pdt; av; 
    phtg; av; av; pdt; av; pqtd; av; pqtd; av; 
    lc; p3htd; av; av; av; bc;
    phtd;  
  end;
 end; 

 procedure Pavage(X : integer; Y : integer);
  var
   I : integer;
   J : integer;
 begin
  { Décentrer  le  dessin  à  gauche  de la moitié de la longueur }
  { d'une ligne.                                                  }
  translater(-(MotifX * (X div 2)), (MotifY * (Y div 2)));
  { Dessiner (Y - 1) lignes de X motifs  (MotifX x MotifY)  (avec }
  { translation en bas à gauche de la ligne suivante).            }
  for I := 1 to (Y - 1) do
   begin
    { Dessiner une ligne  de  X  motifs  (MotifX x MotifY)  (sans }
    { translation à droite après le dernier motif de la ligne).   }
    for J := 1 to (X - 1) do
     begin
      Motif;
      { Passer au motif suivant à droite dans la même ligne. }
      translater(MotifX, 0);
     end;
    Motif;
    { Passer au début de la ligne suivante. }
    translater(-(MotifX * (X - 1)), -MotifY);
   end;
   { Dessiner la dernière ligne de X motifs (MotifX x MotifY) } 
   { (sans translation en bas à gauche de la ligne suivante.  }
   for J := 1 to (X - 1) do
    begin
     Motif;
     translater(MotifX, 0);
    end;
   Motif;
 end;
 
begin
 lgX(TailleGrilleX); lgY(TailleGrilleY);
 Pavage(10, 6);
 st;
end.