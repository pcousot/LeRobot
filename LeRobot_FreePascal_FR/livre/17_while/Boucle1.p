{$mode macpas} program Boucle1;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Boucle1, page 190.                                  *}
 {*                                                     *}
 {*******************************************************}

 { La boucle comprend une commande du robot, on peut arrêter son }
 { exécution avec  esc,  §  ou  #  ou en sélectionnant l'une des }
 { options 'Stop' ou 'Quitter' du menu 'Fichier'.                }
 
begin
 lc;
 while true do
  begin
   vd; 
  end;
 st; 
end.