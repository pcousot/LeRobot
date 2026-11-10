{$mode macpas} program Cocotte;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Cocotte, page 33.                                   *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une cocotte en papier tournée vers l'ouest }
begin
 { Arrière } phtd; av; av; av; av; phtg; av; av; av; av; 
 { Dessus }  pqtd; av; av; av; av; pqtd; phtd; 
 { Avant }   av; av; pqtg; av; av; phtd; av; av; av; av; 
 { Dessous } pqtd; phtd; av; av; pqtg; av; av; phtd; av; av; av; av; 
 { Arrêt du robot } st;
end.