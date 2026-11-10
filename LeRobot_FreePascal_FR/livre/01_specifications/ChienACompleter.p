{$mode macpas} program ChienACompleter;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Dessins à compléter, page 7.                        *}
 {*                                                     *}
 {*******************************************************}

 { Dessin d'un chien à compléter }
 
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

 { Mémorisation de la taille du crayon }
 var
  TailleCrayon : integer;
 
 procedure MemoriserTailleCrayon;
 begin
  TailleCrayon := ValEC;
 end;
 
 procedure ReprendreTailleCrayon;
 begin
  ec(TailleCrayon);
 end;
 
begin
 { Initialisation }
 lc; lg(30); ec(2); dg; eb;
 PoliceTexte(times); TailleTexte(9); Numero := 0; NumeroterE; 
 { Profil arrière de la patte avant }
 avf(2); NumeroterE; pqtd;
 { Ventre }
 avf(3); NumeroterE; vg; NumeroterE;  
 { Patte arrière }
 pdt; avf(3); NumeroterE; pqtg; av; NumeroterE; pqtg; avf(4); 
 { Queue }
 avf(2); NumeroterE; vd; NumeroterE; pdt; vg; vd; NumeroterE; 
 { Dos }
 avf(3); NumeroterE; vd; NumeroterE; 
 { Tête }
  { Oreille }
  av; av; NumeroterE; pqtg; av; NumeroterE; pqtg; av; NumeroterE; 
  { Oeil }
  {lc;} av; MemoriserTailleCrayon; ec(4); dp; ReprendreTailleCrayon; pdt; av; {bc;} 
  pqtg; av; NumeroterE; pqtg; av; NumeroterE; 
  { Museau }
  pqtd; avf(2); NumeroterE; pqtg; avf(2); NumeroterE; pqtg; 
  { Gueule }
  vg; NumeroterE; pdt; vd; NumeroterW; pdt; avf(2); NumeroterE; vd; NumeroterE; 
 { Profil avant de la patte avant }
 avf(3); NumeroterW; pqtg; av; NumeroterW; 
 st;
end.