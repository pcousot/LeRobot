{$mode macpas} program Dessiner;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 var X, Y : integer; Ch : char;

begin
 message(MementoCommandesClavier);
 interaction(X, Y, Ch, false, true, true, false, true);
 copier;
 if dessinDuRobotEngendre then
  begin
   message('Exécutez le programme ''Dessin_du_Robot.p'' pour reproduire votre dessin.');
   delai(1.5);
  end
 else
  st; 
end.