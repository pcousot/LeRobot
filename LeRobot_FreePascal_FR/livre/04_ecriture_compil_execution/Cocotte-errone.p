{$mode macpas} programCocotte-erroné;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Cocotte-erroné, page 35.                            *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner une cocotte en papier tournée vers l'ouest
begin
 { Arrière } phtd; av; av; av; av; pgtg; av; av; av; av; 
 { Dessus }  pqtd; av; av; av; av; pqtd; phtd; 
 { Avant }   av; av; pqtg; av; av; phtd; av; av; av; av; 
 { Dessous } pqtd; phtd; av; av; pqtg; av; av; phtd; av; av; av; av
 { Arrêt du robot } st;
end