{$mode macpas} program Marelle;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Marelle, page 8.                                    *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une marelle }

 procedure CCarre;
 { Dessine le cote d'un carré }
 begin
  av; av; av; av; pqtg;
 end;

 procedure Carre;
 { Dessine le carré }
 begin
  CCarre; CCarre; CCarre; CCarre; 
 end;

begin
{ Rejoindre la gauche du cadre }
  pqtg; av; av; av; av; av; av; av; av; av; av; av; 
{ Dessiner la terre }  
  av; vg; av; av; vg; av; 
{ Dessiner les carres 1, 2, 3 }
  Carre; av; av; av; av; Carre; av; av; av; av; Carre; av; av; av; av; 
{ Dessiner le carre 4 }
  pqtd ; av; av; pqtg; Carre;  
{ Dessiner le carre 5 }
  pqtg; av; av; av; av; av; av; av; av; pqtd; av; av; av; av; pqtd; av;
  av; av; av; av; av; 
{ Dessiner le carre 6 } 
  pqtg; Carre; av; av; av; av;  
{ Dessiner le carre 7 }  
  pqtd; av; av; pqtg; Carre; 
  pqtg; av; av; av; av; av; av; av; av; pqtd;  
{ Dessiner le carre 8 }  
  av; av; av; av; pqtd; av; av; av; av; av; av;    
{ Dessiner le ciel }
  pqtg; av; vg; av; av; vg; av; 
  st;
end.