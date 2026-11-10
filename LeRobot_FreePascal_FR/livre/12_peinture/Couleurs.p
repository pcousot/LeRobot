{$mode macpas} program Couleurs;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Représentation des couleurs par des grisés,         *} 
 {* page 133.                                           *}
 {*                                                     *}
 {*******************************************************}
 const
  N = 3; { Taille d'un carré }

 procedure Carre;
 begin
  cc(noir); translater(0, -(N + 1)); avf(N); pqtd; avf(N); pqtd; avf(N); pqtd; avf(N);
 end;
 
 procedure PeindreCarre;
 begin
  phtg; peindre; p3htd; translater((N + 1), (N + 1)); 
 end;
 
begin
 ag;
 cc(noir);   ecrire('blanc');  cc(noir); Carre; cc(blanc);  PeindreCarre;
 cc(jaune);  ecrire('jaune');  cc(noir); Carre; cc(jaune);  PeindreCarre;
 cc(bleu);   ecrire('bleu');   cc(noir); Carre; cc(bleu);   PeindreCarre;
 cc(violet); ecrire('violet'); cc(noir); Carre; cc(violet); PeindreCarre;
 cc(vert);   ecrire('vert');   cc(noir); Carre; cc(vert);   PeindreCarre;
 cc(rouge);  ecrire('rouge');  cc(noir); Carre; cc(rouge);  PeindreCarre;
 cc(indigo); ecrire('indigo'); cc(noir); Carre; cc(indigo); PeindreCarre;
 cc(noir);   ecrire('noir');   cc(noir); Carre; cc(noir);   PeindreCarre;
 st;
end.
