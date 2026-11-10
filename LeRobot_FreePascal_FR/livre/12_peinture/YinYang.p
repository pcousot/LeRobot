{$mode macpas} program YinYang;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* YinYang, page 132.                                  *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleQuadrillage = 3;

 procedure Cercle;
 begin
  vd; vd; vd; vd;
 end;

begin
 { Demi cercle inférieur } lg(6 * TailleQuadrillage); pqtd; vg; vg;
 { Demi cercle supérieur } lg(6 * TailleQuadrillage); vd; vd; 
 { Cercle du pourtour } lg(12 * TailleQuadrillage); Cercle;
 { Petit cercle blanc } lg(2 * TailleQuadrillage); lc; pqtd; avf(2);
 pqtg; bc; Cercle;
 { Peindre la zone noire } lc; pqtd; avf(4); peindre;
 { Petit cercle noir } avf(2); pqtg; bc; Cercle; pqtg; peindre;
 st; 
end.