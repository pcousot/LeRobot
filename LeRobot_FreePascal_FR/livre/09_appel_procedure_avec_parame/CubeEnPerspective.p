{$mode macpas} program CubeEnPerspective;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Cube en perspective, page 107.                      *}
 {*                                                     *}
 {*******************************************************}
begin
 { Côté gauche, face avant }   ec(2); avf(6);
 { Côté gauche, face dessus }  phtg; avf(3); pdt; avf(3); 
 { Côté haut, face avant }     phtg; avf(6);
 { Côté droit, face dessus }   p3htg; avf(3); pdt; avf(3);
 { Côté droit, face avant }    phtd; avf(6);
 { Côté droit, face dessous }  ec(1); p3htd; avf(3); pdt;
                               avf(3);
 { Côté bas, face avant }      ec(2); p3htd; avf(6);
 { Côté bas, face gauche }     phtd; avf(3);
 { Côté arrière, face gauche } phtd; avf(6);
 { Côté arrière, face dessus } pqtd; avf(6);
 { Côté droit, face arrière }  ec(1); pqtd; avf(6);
 { Côté bas, face arrière }    pqtd; avf(6);
 st;
end.