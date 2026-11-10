{$mode macpas} program LgRTExplique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Grille de déplacement du robot définie par lgX(X);  *}
 {* lgY(Y); ou lgRT(R, T); page 223.                    *}
 {*                                                     *}
 {*******************************************************}

 const
  R = 90;
  T = 30;

 procedure Pointille(N : integer);
  var I : integer;
 begin
  for I := 1 to N do
   begin
    if odd(I) then
     begin
      lc; 
     end;
    av; 
    if odd(I) then
     begin
      bc; 
     end;
   end;
 end;
 
 var X, Y : real;
 
begin
 { Dessiner la diagonale }
 lgRT(R, T); dg; pne; av;
 X := valLgX;
 Y := valLgY;
 { Marquer la diagonale avec R }
 lc; ce; lgRT(R / 2, T); pne; av; pw; lg(12); avf(4);
 ecrire(concat('R = ', EntierEnChaine(R)));
 { Marquer l'angle avec T }
 lgRT(10, T); 
 ce; pe; avf(2); pqtg; bc; vg; 
 lc; pdt; avf(2); ecrire(concat('T = ', EntierEnChaine(T), '°')); bc; 
 ce;
 { Dessiner le repère }
 ce; pe; lg(2);
 Pointille(round(X / 2)); pqtg; Pointille(round(Y / 2));
 { Marquer le repère }
 lc; lgX(round(X / 2)); lgY(round(Y / 2));
 ce; pe; avf(2); pn; av; ecrire(concat(' Y = ', EntierEnChaine(round(Y))));
 ce; pe; av; ps; lg(12); av; ecrire(concat('X = ', EntierEnChaine(round(X))));
 { Mettre le robot dans la position initiale }
 ce; pn; bc;
 { Explication }
 message('''lgRT(R, T)'' définit la même grille que ''lgX(X); lgY(Y);''');
 MarquerUnePause; 
end.