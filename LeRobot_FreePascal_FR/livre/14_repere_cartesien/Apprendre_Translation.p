{$mode macpas} program Apprendre_Translation;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {* Apprentissage de la translation des points du plan  *}
 {* repérés par des coordonnées cartésiennes, page 153. *}
 {*                                                     *}
 {*******************************************************}

 const
  NbrMaxEssais = 5;
  TailleQuadrillage = 10;
  XRect = 9; { Longueur du côté horizontal du rectangle }
  YRect = 3; { Longueur du côté vertical du rectangle }
 var
  Xmin, X, Xt, Xsouris, Xmax, Ymin, Y, Yt, Ysouris, Ymax, I, NbrEssais, NbrReussis :integer;
  CaractereFrappe : char;
 
 procedure CouleurCrayon(C : integer);
 begin
  if EcranNoirEtBlanc then
   begin
    if C = blanc then
     begin
      cc(blanc);
     end
    else
     begin
      cc(noir);
     end;
   end
  else
   begin
    cc(C);
   end;
 end;
 
 procedure Numeroter(N : integer);
 begin
  lc;
  if TE then
   begin
    pqtd; av; Ecrire(EntierEnChaine(N)); pdt; av; pqtd;
   end
  else if TN then
   begin
    pqtg; avf(2); Ecrire(EntierEnChaine(N)); pdt; avf(2); pqtg;
   end
  else if TW then
   begin
    pqtg; av; Ecrire(EntierEnChaine(N)); pdt; av; pqtg;
   end
  else if TS then
   begin
    pqtd; avf(2); Ecrire(EntierEnChaine(N)); pdt; avf(2); pqtd;
   end;
  bc;
 end;
 
 procedure TracerUnAxe(var N : integer; Increment : integer);
 begin
  N := 0;
  while not tb do
   begin
    if (N <> 0) and (N mod 5 = 0) then
     begin
      Numeroter(N);
      CouleurCrayon(Indigo); 
     end
    else
      CouleurCrayon(Rouge);     
    dc; CouleurCrayon(Noir); av; N := N + Increment;
   end;
 end;
 
 procedure TracerAxes;
 begin
   ce; pe; lg(3); av; lg(TailleQuadrillage); Numeroter(0);
  { Axe des x }
   ce; pe; TracerUnAxe(Xmax, 1); translater(-1, 1); Ecrire('X');
   ce; pw; TracerUnAxe(Xmin, -1);
  { Axe des y }
   ce; pn; TracerUnAxe(Ymax, 1); translater(1, -1); Ecrire('Y');
   ce; ps; TracerUnAxe(Ymin, -1);
   pn; CouleurCrayon(Rouge); dg; CouleurCrayon(Noir);
   AutoriserSorties; 
 end;
 
 procedure PetitCercle;
 begin
  lg(2); vg; vg; vg; vg; lg(TailleQuadrillage);
 end;

 procedure Croix;
 begin
  ec(3); dc; ec(1);
 end;
 
 procedure PositionRectangle(var X, Y : integer);
  { Tirer au sort les coordonnées (X, Y) du coin inférieur gauche d'un rectangle }
  { de longueur des côtés horizontaux (resp. verticaux) XRect (resp. YRect).     }
  var
   H, M, S : integer;
   longH, longM, longS, T, T1, T2 : longint;
 begin
  Heure(H, M, S);
  longH := H; longM := M; longS := S;
  T := longH + (60 * longM) + (3600 * longS);
  T1 := abs(Random + T);
  X := Xmin + (T1 mod (Xmax -Xmin + 1));
  T2 := abs(Random + T);
  Y := Ymin + (T2 mod (Ymax -Ymin + 1));
  { Ajuster pour que le rectangle tienne dans le cadre }
  if (X + XRect) > Xmax then
   X := Xmax - XRect;
  if (Y + YRect) > Ymax then
   Y := Ymax - YRect;
 end;
 
 procedure DessinerRectangle;
  { Dessiner un rectangle dans les côtés horizontaux ont la longueur  XRect, }
  { dont les côtés verticaux ont la longueur YRect et dont le coin inférieur }
  { gauche est situé au point où se trouve le robot. }
  var I : integer;
 begin
  pn;
  for I := 1 to 2 do
   begin
    avf(YRect); { Dessiner un côté vertical }
    pqtd; 
    avf(XRect); { Dessiner un côté horizontal }
    pqtd; 
   end;
 end;

 procedure Rectangle(N : integer);
  { Dessiner un rectangle de taille Xrect x Yrect et écrire N à l'intérieur }
 begin
  DessinerRectangle;
  { Ecrire N dans le rectangle }
  lc; av; pqtd; av;
  ecrire(EntierEnChaine(N)); 
  pdt; av; pqtg; av; pdt; bc; 
  { Repérer le coin inférieur gauche du rectangle par une croix }
  Croix;
 end;

 procedure RectangleEtTranslation(N, X, Y : integer);
  { Dessiner un rectangle de taille Xrect x Yrect et écrire N:(X, Y) à l'intérieur }
 begin
  DessinerRectangle;
  { Ecrire N:(X,Y) dans le rectangle }
  lc; av; pqtd; av;
  ecrire(concat(EntierEnChaine(N),':(',EntierEnChaine(X),',',EntierEnChaine(Y),')')); 
  pdt; av; pqtg; av; pdt; bc; 
  { Repérer le coin inférieur gauche du rectangle par une croix }
  Croix;
 end; 
 
begin
 lg(TailleQuadrillage);
 TracerAxes;
 StyleTexte(Gras);
 NbrEssais := 0; NbrReussis := 0;
 repeat
  { Tirer au sort les coordonnées (X, Y) du coin inférieur gauche du rectangle }
  { à translater puis le dessiner }
  PositionRectangle(X, Y);
  { Tirer au sort les coordonnées (Xt, Yt) du coin inférieur gauche du rectangle }
  { translaté }
  PositionRectangle(Xt, Yt); 
  { Demander à l'utilisateur de translater le rectangle de (X, Y) en (Xt, Yt) }
  ce; translater(X, Y); CouleurCrayon(Violet); RectangleEtTranslation(NbrEssais + 1, (Xt - X), (Yt - Y));
  Message(concat('Translater le coin inférieur gauche du rectangle ', EntierEnChaine(NbrEssais + 1),
                  ' de (', EntierEnChaine(Xt - X), ', ',
                     EntierEnChaine(Yt - Y), ');'));
  Interaction(Xsouris, Ysouris, CaractereFrappe, true, false, false, true, false);
  { Comptabiliser les essais et les succès }
  NbrEssais := NbrEssais + 1;
  if (((Xt - X) = Xsouris) and ((Yt - Y) = Ysouris)) then
   begin { L'utilisateur a bien designé le point demandé, dessiner le rectangle translaté }
    CouleurCrayon(vert);
    Rectangle(NbrEssais);
    NbrReussis := NbrReussis + 1;
   end
  else
   begin { L'utilisateur n'a pas designé le point demandé }
    bip; bip; bip; { Signaler l'erreur }
    CouleurCrayon(Rouge);
    PetitCercle; { Marquer le point erroné d'un petit cercle }
    lc; 
    if (XSouris + 3) > Xmax then
     begin { Ecrire à gauche du petit cercle }
      pw; av; av; 
     end
    else
     begin { Ecrire à droite du petit cercle }
      pe; av;
     end;
    bc;
    Ecrire(EntierEnChaine(NbrEssais)); 
    ce; translater(Xt, Yt); CouleurCrayon(Bleu); Rectangle(NbrEssais);
   end;
 until (NbrEssais >= NbrMaxEssais);
 { Indiquer les résultats en bas à gauche de l'écran }
 ce; translater(2, Ymin); CouleurCrayon(Noir);
 if NbrReussis = 0 then
  Ecrire(concat('Aucune réussite sur ', EntierEnChaine(NbrEssais),' essais !'))
 else if NbrReussis = 1 then
  Ecrire(concat('Une seule réussite sur ', EntierEnChaine(NbrEssais),' essais !'))
 else
  Ecrire(concat(EntierEnChaine(NbrReussis), ' réussites sur ', EntierEnChaine(NbrEssais), ' essais'));
 ce; st;
end.