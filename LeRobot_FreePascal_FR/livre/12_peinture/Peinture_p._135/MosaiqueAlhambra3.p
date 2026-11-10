{$mode macpas} program MosaiqueAlhambra3;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Mosaique de l'Alhambra, page 135.                   *}
 {* MosaiqueAlhambra3, page 136.                        *}
 {*                                                     *}
 {*******************************************************}
 
 const
  TailleGrille = 3; { pixels }
  LargeurMotif = 4; { fois la taille de la grille }
  HauteurMotif = 6; { fois la taille de la grille }
  TailleLigne = 7;  { motifs dans une ligne impaire }
  NombreDeLignes = 12; { pair }
 
 procedure Motif;
  { Dessiner un motif en forme de 8,  en  partant et en arrivant à }
  { l'extrémité  de  la  pointe  inférieure  gauche, avec le robot }
  { orienté vers le nord.                                          }
  var I : integer;
 begin
  for I := 1 to 2 do
   begin
    { Côté gauche/droit (au dessus/dessous de la pointe inférieure). }
    phtd; av; phtg; avf(HauteurMotif - 4); phtg; av; pqtd; av; 
    { Dessus/dessous }
    phtd; avf(LargeurMotif - 2); phtd; 
    { Haut/bas du côté droit/gauche (en dessus/dessous de la pointe }
    { supérieure/inférieure).                                       }
    av; phtd; 
   end;
  { Colorier et tourner le robot dans l'orientation initiale. }
  pqtg; peindre; pqtd;
 end;
 
 procedure MotifSuivant;
  { Passer de la pointe inférieure gauche d'un motif à celle du }
  { motif suivant sur la même ligne horizontale à droite.       }
 begin
  lc; pqtd; avf(2 * LargeurMotif); pqtg; bc; 
 end;
 
 procedure LigneImpaire;
  { Dessiner une ligne horizontale comportant 'TailleLigne' motifs. }
  var I : integer;
 begin
  for I := 1 to TailleLigne do
   begin
    Motif; MotifSuivant;
   end;
 end;
 
 procedure LignePaire;
  { Dessiner une ligne comportant '(TailleLigne - 1)' motifs. }
  var I : integer;
 begin
  for I := 1 to (TailleLigne - 1) do
   begin
    Motif; MotifSuivant;
   end;
 end;
 
 procedure RetourDebutDeLigne;
  { Revenir sur la pointe inférieure gauche du premier motif }
  { d'une ligne.                                             }
 begin
  lc; pqtg; avf(((2 * LargeurMotif) * TailleLigne) - LargeurMotif); 
  pqtd; bc; 
 end;
 
 procedure LigneSuivante;
  { Passer de la pointe inférieure gauche d'un motif à celle du }
  { motif à la verticale sur la ligne suivante.                 }
 begin
  lc; avf(-(HauteurMotif - 2)); bc; 
 end;
 
 procedure Pavage;
  { Paver avec un nombre de lignes égal à 'NombreDeLignes'. }
  var I : integer;
 begin
  for I := 1 to (NombreDeLignes div 2) do
   begin
    LigneImpaire; RetourDebutDeLigne; LigneSuivante; 
    LignePaire;   RetourDebutDeLigne; LigneSuivante;  
   end;
 end;
 
begin
 { Placer le robot à la pointe inférieure gauche du motif gauche }
 { de la première ligne.                                         }
 lc; lg(TailleGrille); ag; eh; pdt; avf(HauteurMotif); pqtg; av; 
 pqtg; bc; 
 Pavage; st;
end.