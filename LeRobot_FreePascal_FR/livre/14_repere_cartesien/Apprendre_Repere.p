{$mode macpas} program Apprendre_Repere;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {* Apprentissage du repérage des points du plan avec   *}
 {* un repère cartésien, page 152.                      *}
 {*                                                     *}
 {*******************************************************}

 const
  NbrMaxEssais = 5;
  TailleQuadrillage = 10;
 var
  Xmin, X, Xsouris, Xmax, Ymin, Y, Ysouris, Ymax, I, NbrEssais, NbrReussis :integer;
  C : char;
  
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
 
 procedure PositionPoint(var X, Y : integer);
  { Tirer au sort les coordonnées (X, Y) du point à désigner. }
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
 end;

begin
 lg(TailleQuadrillage);
 TracerAxes;
 StyleTexte(Gras);
 NbrEssais := 0; NbrReussis := 0;
 repeat
  { Tirer au sort les coordonnées du point (X, Y) à désigner }
  PositionPoint(X, Y);
  { Demander à l'utilisateur de désigner le point (X, Y) }
  ce;
  Message(concat('Repérer le point (', EntierEnChaine(X), ', ',EntierEnChaine(Y), ');'));
  Interaction(Xsouris, Ysouris, C,true, false, false, true, false);
  { Comptabiliser les essais et les succès }
  NbrEssais := NbrEssais + 1;
  if ((X = Xsouris) and (Y = Ysouris)) then
   begin { L'utilisateur a bien designé le point demandé, le marquer d'une croix }
    CouleurCrayon(Vert); Croix;
    NbrReussis := NbrReussis + 1;
   end
  else
   begin { L'utilisateur n'a pas designé le point demandé }
    bip; bip; bip; { Signaler l'erreur }
    CouleurCrayon(Rouge); PetitCercle; { Marquer le point erroné d'un petit cercle }
    ce; translater(X, Y); CouleurCrayon(Bleu); Croix; { Marquer le point demandé d'une croix }
   end;
 until (NbrEssais >= NbrMaxEssais);
 CouleurCrayon(Noir);
 { Indiquer les résultats sous le cadre de déplacement du robot }
 ce; translater(2, Ymin);
 if NbrReussis = 0 then
  Message(concat('Aucune réussite sur ', EntierEnChaine(NbrEssais),' essais !'))
 else if NbrReussis = 1 then
  Message(concat('Une seule réussite sur ', EntierEnChaine(NbrEssais),' essais !'))
 else
  Message(concat(EntierEnChaine(NbrReussis), ' réussites sur ', EntierEnChaine(NbrEssais), ' essais'));
 ce; MarquerUnePause;
end.