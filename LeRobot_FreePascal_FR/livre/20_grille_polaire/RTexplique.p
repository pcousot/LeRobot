{$mode macpas} program RTexplique;
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
  LongueurCote = 30;
  N = 24;
  Dx = 70;
  Dy = 40;
  NbH = 5;
  BordX = 40;
  PlusY = 10;

 procedure Pointille(N : integer);
  var I : integer;
 begin
  lc;
  for I := 1 to N do
   begin
    if odd(I) then
     begin
      dp; 
     end;
    av; 
   end;
  dp; bc;
 end;
 
 procedure Position(I : integer);
 begin
  lg(1); eh; ag; translater(BordX, 0);
  translater((Dx * (I mod NbH)), -(Dy * ((I div NbH) + 1)));
  if (I div NbH) = 2 then begin translater(0, PlusY); end;
  if (I div NbH) = 4 then begin translater(0, -PlusY); end;
 end;
 
 procedure Repere(I : integer);
  { Dessiner le carreau (0, 0) - (1, 1) }
  var 
   X : real;
   Y : real;
   Orientation : integer;
 begin
  X := ValLgX; Y := ValLgY;
  if tn then
   begin Orientation := 0; end
  else if tne then
   begin Orientation := 1; end
  else if te then
   begin Orientation := 2; end
  else if tse then
   begin Orientation := 3; end
  else if ts then
   begin Orientation := 4; end
  else if tsw then
   begin Orientation := 5; end
  else if tw then
   begin Orientation := 6; end
  else {tnw}
   begin Orientation := 7; end;
  Position(I); lg(1); pe;
  Pointille(round(X)); pqtg; Pointille(round(Y)); pqtg; 
  Pointille(round(X)); pqtg; Pointille(round(Y)); pqtg; 
  lgX(X); lgY(Y);
  case Orientation of
   0 : begin pn;  deplacer(0, 1);   end;
   1 : begin pne; deplacer(1, 1);   end;
   2 : begin pe;  deplacer(1, 0);   end;
   3 : begin pse; deplacer(1, -1);  end;
   4 : begin ps;  deplacer(0, -1);  end;
   5 : begin psw; deplacer(-1, -1); end;
   6 : begin pw;  deplacer(-1, 0);  end;
   7 : begin pnw; deplacer(-1, 1);  end;
  end;
 end;
 
 var
  I : integer;
  X : integer;
  Y : integer;
 
begin
 message(concat('lg(', EntierEnChaine(LongueurCote),'); pe; av;'));
 Position(0); lg(LongueurCote); pe; av; Repere(0);
 for  I := 1 to N do
  begin
   message(concat('lg(', EntierEnChaine(LongueurCote), '); pe; rt(', EntierEnChaine(I * (360 div N)), '); av;'));
   Position(I); lg(LongueurCote); pe; rt(I * (360 div N)); av; Repere(I);
  end;
 st; 
end.