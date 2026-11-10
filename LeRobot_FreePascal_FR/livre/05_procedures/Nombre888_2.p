{$mode macpas} program Nombre888_2;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quelques dessins géométriques simples, page 6.      *}
 {* Nombre888_2, page 55.                               *}
 {*                                                     *}
 {*******************************************************}

{ Dessiner le nombre 888 comme }
{ sur les montres digitales.   }

 procedure Huit;
  { Dessiner  le  chiffre  8, en partant en bas à gauche du 8 avec le }
  { robot orienté au nord et en arrivant en bas à gauche du 8 avec le }
  { robot orienté à l'ouest. }
 begin
  av; pqtd; av; pqtg; av; pqtg; av; pqtg; av; pqtg; av; pqtd; av; pqtd;
  av;
 end;
 
 procedure Espace;
  { Partant  avec  le  robot  orienté à l'ouest en bas à gauche du 8, }
  { reculer en bas à droite du 8 puis d'un espace  et  réorienter  le }
  { robot au nord. }
 begin
  lc; pqtd; pqtd; av; av; pqtg; bc; 
 end;

begin
 { Dessiner le 8 des centaines } Huit; Espace; 
 { Dessiner le 8 des dizaines  } Huit; Espace; 
 { Dessiner le 8 des unités    } Huit; st; 
end.