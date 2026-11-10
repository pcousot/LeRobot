{$mode macpas} program PavageCroixSurCarres;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavages de motifs (6 x 6), page 156.                *}
 {*                                                     *}
 {*******************************************************}

 { Pavage de croix superposées à des carrés. }
 
 const
  TailleGrilleX = 6;
  TailleGrilleY = 6;

 procedure Motif6x6;
  { Dessiner un motif dans un carré (6 x 6), le robot partant et }
  { arrivant au centre du motif orienté vers le nord.            }
  var I : integer;
 begin
  translater(-1, 1);
  for I := 1 to 4 do
   begin
    av; vd; vd; av; p3htg; avf(2); avf(-2); phtd; 
   end; 
  translater(1, -1);
 end; 

 procedure Pavage(X : integer; Y : integer);
  var
   I : integer;
   J : integer;
 begin
  translater(-(6 * (X div 2)), (6 * (Y div 2)));
  { Dessiner (Y - 1) lignes de X motifs (6 x 6) (avec translation }
  { en bas à gauche de la ligne suivante).                        }
  for I := 1 to (Y - 1) do
   begin
    { Dessiner une ligne de X motifs (6 x 6)  (sans translation à }
    { droite après le dernier motif de la ligne).                 }
    for J := 1 to (X - 1) do
     begin
      Motif6x6;
      { Passer au motif suivant à droite dans la même ligne. }
      translater(6, 0);
     end;
    Motif6x6;
    { Passer au début de la ligne suivante. }
    translater(-(6 * (X - 1)), -6);
   end;
   { Dessiner la dernière ligne de X motifs(6 x 6) (sans }
   { translation en bas à gauche de la ligne suivante.   }
   for J := 1 to (X - 1) do
    begin
     Motif6x6;
     translater(6, 0);
    end;
   Motif6x6;
 end;
 
begin
 lgX(TailleGrilleX); lgY(TailleGrilleY);
 Pavage(4, 4);
 st;
end.