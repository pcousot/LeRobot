{$mode macpas} program TriangleIsoceleExplique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* TriangleIsocele, page 224.                          *}
 {*                                                     *}
 {*******************************************************}

 const
  LongueurCote = 50;
  Angle = 70;

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
 
 var X, Y : integer;
 
begin
 { Dessiner le triangle }
 lgRT(LongueurCote, Angle); phtd; av; pqtd; av; p3htd; avf(2); 
 X := round(valLgX / 2);
 Y := round(valLgY / 2);
 { Marquer l'angle }
 lgRT(10, Angle); 
 pdt; avf(2); pqtg; vg; 
 lc; pdt; avf(2); ecrire(concat(EntierEnChaine(Angle), '°')); bc; 
 ce;
 { Dessiner le repère }
 lg(2);
 Pointille(X); pqtg; Pointille(Y); pqtg; 
 Pointille(X); pqtg; Pointille(Y); pqtg; 
 st; 
end.