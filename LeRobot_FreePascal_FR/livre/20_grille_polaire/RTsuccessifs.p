{$mode macpas} program RTsuccessifs;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rotations et déplacements successifs rt(15); av;    *}
 {* page 225.                                           *}
 {*                                                     *}
 {*******************************************************}

 const
  LongueurCote = 50;
  N = 24;
 
 var I : integer;
 
begin
 message(concat('lg(', EntierEnChaine(LongueurCote),'); pe; av;'));
 lg(LongueurCote); pe; av; MarquerUnePause;
 for  I := 1 to N do
  begin
   message(concat('ce; rt(', EntierEnChaine(360 div N), '); av;'));
   ce; rt(360 div N); av; MarquerUnePause;
  end;
 st; 
end.