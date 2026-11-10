{$mode macpas} program EchelleDeJacob;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Échelle de Jacob, page 107.                         *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner une échelle de Jacob }
begin
 pqtg; ec(2); 
 avf(12); phtg; avf(3); vd; av; vd; avf(3); vg; vd; avf(2); vd; avf(3);
 vg; avf(3); vd; 
 avf(6); 
 vg; avf(3); vd; avf(3); vg; avf(2); vg; vd; avf(3); vg; av; vg; avf(3);
 phtd; avf(12); 
 ec(1);
 avf(12); phtd; avf(3); vg; av; vg; avf(3); vd; vg; avf(2); vg; avf(3); 
 vd; avf(3); vg; 
 avf(6); 
 vd; avf(3); vg; avf(3); vd; avf(2); vd; vg; avf(3); vd; av; vd; avf(3); 
 phtg; avf(12); 
 st; 
end.