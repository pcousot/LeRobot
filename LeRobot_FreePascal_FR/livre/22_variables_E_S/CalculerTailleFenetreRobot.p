{$mode macpas} program CalculerTailleFenetreRobot;
 uses Robot1, Robot2, Robot3;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* CalculerTailleFenetreRobot, page 272.               *}
 {*                                                     *}
 {*******************************************************}
 { Calcul de la taille de la fenêtre de déplacement du robot. }

 var Largeur : integer; Hauteur : integer; 
  
 procedure LargeurFenetreRobot;
 begin
  lg(1); lc; ce; ag; pe; Largeur := 0;
  while not tb do
   begin Largeur := Largeur + 1; av; end;
 end;
  
 procedure HauteurFenetreRobot;
 begin
  lg(1); lc; ce; eb; pn; Hauteur := 0;
  while not tb do
   begin Hauteur := Hauteur + 1; av; end;
 end;
  
begin
 LargeurFenetreRobot; HauteurFenetreRobot; 
 message(concat('(', EntierEnChaine(Largeur), ' x ', 
   EntierEnChaine(Hauteur), ')'));
 MarquerUnePause; 
end.

