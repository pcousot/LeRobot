{$mode macpas} program Velo;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Vélo, page 117.                                     *}
 {*                                                     *}
 {*******************************************************}
begin
 ec(2);
 { Roue avant } lg(36); lc; pqtd; av; bc; vg; vg; vg; vg; lc; pqtg; 
 av; pqtd; bc; 
 { Fourche avant } lgX(6); lgY(10); phtg; avf(6); 
 { Guidon } phtd; av; pdt; av; lg(8); vd; vd; pdt; vg; vg; 
  lgX(6); lgY(10); p3htd; av; p3htg;
 { Barre supérieure du cadre } avf(14); 
  { Selle } phtg; av; phtd; av; pdt; avf(5); pdt; avf(4); p3htd; av; 
  avf(5);
  { Pédalier } lc; phtd; lg(12); av; bc; pqtd; vd; vd; vd; vd; lc; 
  pqtd; av;  lgX(6); lgY(10); bc; 
 { Barre inférieure du cadre } avf(10);
 { Roue arrière } lg(36); lc; av; bc; pqtg; vg; vg; vg; vg; pqtg; 
 lc; av; bc;
 { Barres transversales }  lgX(6); lgY(10); phtd; avf(5); pqtg; avf(5); 
 pqtd; lgX(9); lgY(8); avf(6);
 st;
end.