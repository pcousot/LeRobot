{$mode macpas} program LettreEavecBogues; 
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Lettre E majuscule (avec bogues), page 30.          *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une lettre E majuscule épaisse }

begin
 av; av; av; av; av; pqtd;
 av; av; av; pqtd; av; pqtd; av; av; pqtd;
 av; pqtg;
 av; pqtd; av; pqtd; av; pqtg;
 av; pqtg;
 av; av; pqtd; av; pqtd; av; av;
 st;
end.
  
