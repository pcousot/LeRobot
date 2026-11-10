{$mode macpas} program CroixDeCoins;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Croix au bord et au centre du cadre, page 64.       *}
 {*                                                     *}
 {*******************************************************}
begin 
 ag; dc; { Croix au milieu du bord gauche du cadre }
 ad; dc; { Croix au milieu du bord droit du cadre }
 ce; eh; dc; { Croix au milieu du bord supérieur du cadre }
 eb; dc; { Croix au milieu du bord inférieur du cadre }
 eh; ag; dc; { Croix au coin supérieur gauche du cadre }
 ad; dc; { Croix au coin supérieur droit du cadre }
 eb; ag; dc; { Croix au coin inférieur gauche du cadre }
 ad; dc; { Croix au coin inférieur droit du cadre }
 ce; dc; { Croix au centre du cadre }
 st;
end.