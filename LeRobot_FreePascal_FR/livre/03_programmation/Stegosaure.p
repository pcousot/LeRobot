{$mode macpas} program Stegosaure; 
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Stégosaure, page 30.                                *}
 {*                                                     *}
 {*******************************************************}

begin
 { Rejoindre l'extrémité de la queue }
  { En bas }
  lc; pqtd; pqtd; av; av; av; av; av; av; av; 
  { A droite }
  pqtg; av; av; av; av; av; av; av; av; av; av; av; av; av; pqtg; bc;
 { Dessus de la queue }
  av;
  pqtd; vg; pqtg; vg; pqtd; pqtd; { 1ère épine caudale }
  vg;
  pqtd; pqtd; vg; pqtg; vg; pqtd; { 2ème épine caudale }
  vd; vg; av;
 { Dessiner les 11 plaques osseuses dorsales d'arrière en avant }
  { 1 }  vd; av; av; av; pqtd; av; pqtd; av; av; av; av; pqtd; vd; av;
  { 2 }  pqtg; vd; av; av; av; pqtd; av; pqtd; av; av; pqtd;
         lc; av; bc;
  { 3 }  vd; av; av; pqtd; av; pqtd; av; pqtd; lc; av; bc;
  { 4 }  vd; pqtg; av; pqtd; av; pqtd; av; av; pqtd; av; av; pqtd; vd;
         pqtg; av; 
  { 5 }  av; vd; av; pqtd; av; av; pqtd; av; av; pqtd; av; vd; pqtg;
  { 6 }  av; av; pqtd; av; av; pqtd; av; av; pqtd; av; av; pqtd; av;
         av; pqtg; 
  { 7 }  vd; av; pqtd; av; av; pqtd; av; av; pqtd; av; vd; av;
  { 8 }  av; pqtg; vd; pqtd; av; av; pqtd; av; av; pqtd; av; pqtd; av; 
         pqtg; vd;
  { 9 }  vg; pqtd; pqtd; av; av; pqtd; av; pqtd; av; pqtd; vg; 
  { 10 } vd; vg; pqtd; pqtd; av; av; av; pqtd; av; av; pqtd; av; vd;
         vg; 
  { 11 } av; vd; pqtd; av; av; av; pqtd; av; pqtd; av; av; vd;
 { Dessiner la tête }
  { Crane }  av; av;
  { Oeil }   lc; pqtg; av; dc; pqtd; pqtd; av; pqtg; bc;
  { Front }  vg; vd; 
  { Dessus du museau } av; vg;
  { Gueule } pqtg; av; av; pqtd; pqtd; av; av; pqtg;
  { Dessous de la tête } vg; av; av; av; av; av; av; av; vg; pqtd; av;
 { Dessiner les pattes antérieures }
  { Patte gauche } pqtg; av; av; av; pqtd; pqtd; av; av; av; av; av; 
  pqtg; av; av; pqtg; av; av; av; av; av; av; pqtd; pqtd; av; av; av;
  { Patte droite } av; av; pqtg; av; pqtg; av; av; pqtg; av; pqtd; 
  pqtd; av; 
 { Dessiner le ventre }
  vg; pqtd; av; av; av; 
 { Dessiner les pattes postérieures }
  { Patte gauche } pqtg; av; av; av; pqtd; pqtd; av; av; av; av; av; 
  av; av; pqtg; av; av; pqtg; av; av; av; av; av; av; av; av; pqtd; 
  pqtd; av; av; av; av; av; av; 
  { Patte droite } av; pqtg; av; pqtg; av; av; av; pqtg; av; pqtd; 
  pqtd; av; 
 { Compléter le dessous de la queue }
 av; pqtd; vg; av; vd; vg; av; pqtd; vg; pqtd;
 st;
end.
