{$mode macpas} program StegosaureEtBebe;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Stégosaure et son bébé, page 116.                   *}
 {*                                                     *}
 {*******************************************************}

 procedure Stegosaure;
 begin
 { Rejoindre l'extrémité de la queue }
  { En bas }
  lc; pqtd; pqtd; avf(7); 
  { A droite }
  pqtg; avf(13); pqtg; bc;
 { Dessus de la queue }
  av;
  pqtd; vg; pqtg; vg; pqtd; pqtd; { 1ère épine caudale }
  vg;
  pqtd; pqtd; vg; pqtg; vg; pqtd; { 2ème épine caudale }
  vd; vg; av;
 { Dessiner les 11 plaques osseuses dorsales d'arrière en avant }
  { 1 }  vd; avf(3); pqtd; av; pqtd; avf(4); pqtd; vd; av;
  { 2 }  pqtg; vd; avf(3); pqtd; av; pqtd; avf(2); pqtd; lc; av; bc;
  { 3 }  vd; avf(2); pqtd; av; pqtd; av; pqtd; lc; av; bc;
  { 4 }  vd; pqtg; av; pqtd; av; pqtd; avf(2); pqtd; avf(2); pqtd; vd;
         pqtg; av; 
  { 5 }  av; vd; av; pqtd; avf(2); pqtd; avf(2); pqtd; av; vd; pqtg;
  { 6 }  avf(2); pqtd; avf(2); pqtd; avf(2); pqtd; avf(2); pqtd;
         avf(2); pqtg; 
  { 7 }  vd; av; pqtd; avf(2); pqtd; avf(2); pqtd; av; vd; av;
  { 8 }  av; pqtg; vd; pqtd; avf(2); pqtd; avf(2); pqtd; av; pqtd; av; 
         pqtg; vd;
  { 9 }  vg; pqtd; pqtd; avf(2); pqtd; av; pqtd; av; pqtd; vg; 
  { 10 } vd; vg; pqtd; pqtd; avf(3); pqtd; av; av; pqtd; av; vd; vg; 
  { 11 } av; vd; pqtd; avf(3); pqtd; av; pqtd; avf(2); vd;
 { Dessiner la tête }
  { Crane }  avf(2);
  { Oeil }   lc; pqtg; av; dc; pqtd; pqtd; av; pqtg; bc;
  { Front }  vg; vd; 
  { Dessus du museau } av; vg;
  { Gueule } pqtg; avf(2); pqtd; pqtd; avf(2); pqtg;
  { Dessous de la tête } vg; avf(7); vg; pqtd; av;
 { Dessiner les pattes antérieures }
  { Patte gauche } pqtg; avf(3); pqtd; pqtd; avf(5); pqtg; avf(2); 
  pqtg; avf(6); pqtd; pqtd; avf(3);
  { Patte droite } avf(2); pqtg; av; pqtg; avf(2); pqtg; av; pqtd; 
  pqtd; av; 
 { Dessiner le ventre }
  vg; pqtd; av; av; av; 
 { Dessiner les pattes postérieures }
  { Patte gauche } pqtg; avf(3); pqtd; pqtd; avf(7); pqtg; avf(2); 
  pqtg; avf(8); pqtd; pqtd; avf(6); 
  { Patte droite } av; pqtg; av; pqtg; avf(3); pqtg; av; pqtd; pqtd; 
  av; 
 { Compléter le dessous de la queue }
 av; pqtd; vg; av; vd; vg; av; pqtd; vg; pqtd;
 end;
 
begin
 { Décentrer le stégosaure à gauche }
 lc; pqtg; avf(5); pqtd; bc; 
 stegosaure;
 { Décentrer le bébé stégosaure à droite }
 lc; pqtg; avf(5); pqtg; bc;
 lg(4); stegosaure;
 st;
end. {Robot}
