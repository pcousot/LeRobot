{$mode macpas} program BateauAVoilesComplet;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 43, page 274.                              *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner un bateau à voiles à completer }
 
 { Mémorisation de la direction courante du robot }
 var
  OrientationCourante : integer;
 
 procedure MemoriserDirection;
  { Mémoriser la direction courante du robot dans 'OrientationCourante' }
 begin
  OrientationCourante := valOrientation;
 end;
 
 procedure ReprendreDirection;
  { Mettre le robot dans la direction mémorisée dans 'OrientationCourante' }
 begin
  Pivoter(OrientationCourante);
 end;
 
 { Mémorisation de la taille de la grille }
 var
  TailleHorizontale : real;
  TailleVerticale   : real;
 
 procedure MemoriserTailleGrille;
 begin
  TailleHorizontale := ValLGX;
  TailleVerticale   := ValLGY;
 end;
 
 procedure ReprendreTailleGrille;
 begin
  lgx(TailleHorizontale);
  lgy(TailleVerticale);
 end;
 
 { Mémorisation de la position du crayon }
 var
  CrayonBaisse : boolean;
 
 procedure MemoriserPositionCrayon;
 begin
  CrayonBaisse := ValBC;
 end;
 
 procedure ReprendrePositionCrayon;
 begin
  if CrayonBaisse then
   begin
    bc;
   end
  else
   begin
    lc;
   end;
 end;
 
 { Mémoriser le numéro de la position courante du robot }
 var
  Numero : integer;
  
 procedure NumeroterE;
  { Marquer d'une croix la position courante du robot, la numéroter }
  { à  l'est  avec  la  valeur de 'Numero' qui est incrementé, sans }
  { changer la position et l'orientation du robot. }
 begin
  dc;
  MemoriserDirection; MemoriserTailleGrille; MemoriserPositionCrayon;
  lg(ValEC + 3); pe; lc; av; Ecrire(EntierEnChaine(Numero)); pdt; av;
  ReprendreDirection; ReprendreTailleGrille; ReprendrePositionCrayon;
  Numero := Numero + 1;
 end;
 
 procedure NumeroterW;
  { Marquer d'une croix la position courante du robot, la numéroter }
  { à  l'ouest  avec la valeur de 'Numero' qui est incrementé, sans }
  { changer la position et l'orientation du robot. }
 begin
  dc;
  MemoriserDirection; MemoriserTailleGrille; MemoriserPositionCrayon;
  lg(ValEC + 10); pw; lc; av; Ecrire(EntierEnChaine(Numero)); pdt; av;
  ReprendreDirection; ReprendreTailleGrille; ReprendrePositionCrayon;
  Numero := Numero + 1;
 end;

begin
{ Initialisation }
 lg(12); ec(2); dg;
 PoliceTexte(times); TailleTexte(9); Numero := 0; 
{ Déplacer le robot en bas sans rien dessiner }
  lc; pdt; avf(10); NumeroterE; pqtg; 
{ Dessiner l'arriere de la coque }
  { Dessiner la ligne de flotaison arrière }
    bc; avf(9); NumeroterE; 
  { Dessiner l'arrière de la coque }
    phtg; avf(4); NumeroterE; 
  { Dessiner le pont arrière }
    pqtg; phtg; avf(13); NumeroterE; 
{ Dessiner le mât }
  pqtd; avf(16); NumeroterE; 
{ Dessiner le drapeau }
  pqtd; avf(4); NumeroterE; pqtd; avf(2); NumeroterE; pqtd; avf(4); 
  NumeroterE; pqtg; av; NumeroterE; 
{ Dessiner la grand voile }
  phtg; avf(12); NumeroterE; 
  pqtd; phtd; avf(12);
{ Dessiner le foc }
  avf(9); NumeroterE; pqtd; phtd; 
  avf(9); NumeroterE; pqtd; phtd; 
  avf(10); NumeroterW; pqtd; 
{ Dessiner l'avant du bateau} 
  { Dessiner le pont avant }
    avf(10); NumeroterE; 
  { Dessiner l'avant de la coque }
    pdt; phtd; avf(4); NumeroterE; 
  { Dessiner la ligne de flotaison avant }
    phtg; avf(6); NumeroterW; 
 st; 
end.