{$mode macpas} program Sinus;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe cartésienne y = sin x, x dans [-2 pi, 2 pi], *}
 {* page 236.                                           *}
 {*                                                     *}
 {*******************************************************}

  procedure Axe;
   { Tracer un trait tout droit jusqu'au bord. }
  begin
   while not tb do
    begin
     av;
    end;
  end;
  
  procedure Axes;
   { Tracer 4 axes dans les directions N, E, S et W. }
   var I : integer;
  begin
   for I := 1 to 4 do
    begin
     ce; pqtd; Axe;
    end;
  end;
  
  procedure GraduationX(X : real);
   { Graduer l'axe des X aux points coupés par la courbe y = sin(x). }
  begin
   if (abs(sin(X)) <= 0.00001) then
    begin
     ecrire(ReelEnChaine(X));
    end;
  end;
  
  procedure GraduationY;
   { Graduer l'axe des Y. }
  begin
   Deplacer(0, 1);  dc; ecrire(' 1');
   Deplacer(0, -1); dc; ecrire(' -1');
  end;
  
  var
   X : integer;
begin
 Axes; lgX(40); lgY(80); GraduationY;
 Deplacer(-(2 * pi), sin(-(2 * pi))); GraduationX(-(2 * pi));
 for X := -359 to 360 do
  begin
   Tracer(((X * pi) / 180), sin((X * pi) / 180)); GraduationX((X * pi) / 180);
  end;
 st;
end.