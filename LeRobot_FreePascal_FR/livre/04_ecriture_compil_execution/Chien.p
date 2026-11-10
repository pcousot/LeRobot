{$mode macpas} program Chien;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 11, page 45.                               *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner un chien }
begin
 { Profil arrière de la patte avant } av; av; pqtd;
 { Ventre } av; av; av; vg;
 { Patte arrière } pqtd; pqtd; av; av; av; pqtg; av; pqtg; av; av; av; 
   av;
 { Queue } av; av; vd; pqtd; pqtd; vg; vd; 
 { Dos } av; av; av; vd;
 { Tête }
  { Oreille } av; av; pqtg; av; pqtg; av;
  { Oeil } lc; av; dc; pqtd; pqtd; av; bc; pqtg; av; pqtg; av;
  { Museau } pqtd; av; av; pqtg; av; av; pqtg; 
  { Gueule } vg; pqtd; pqtd; vd; pqtd; pqtd; av; av; vd; 
 { Profil avant de la patte avant } av; av; av; pqtg; av; 
 st;
end.