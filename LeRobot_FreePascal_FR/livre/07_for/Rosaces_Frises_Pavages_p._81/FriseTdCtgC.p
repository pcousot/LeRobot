{$mode macpas}  program FriseTdCtgC;
  uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}

  procedure Triangle_D;
  { Dessiner un  triangle,  pointe à droite. Le robot part du coin SW, }
  { orienté au nord et arrive au même niveau sous la pointe orienté N. }
  begin
   av; av; p3htd; av; pqtd; av; p3htg; 
   lc; av; pqtg; bc;
  end;
   
  procedure Carre;
   { Dessiner un carré en partant du coin SW (robot orienté N) et }
   { placer le robot au coin SE orienté N.                        }
   var I : integer;
  begin
   { Dessiner un carré en partant du coin SW (robot orienté N) }
   for I := 1 to 4 do
    begin
     av; av; pqtd;
    end;
   { Placer le robot au coin SE, orienté N }
   pqtd; av; av; pqtg;
  end;    
    
 procedure Triangle_G; 
  { Dessiner un triangle, pointe à gauche. Le robot part de la pointe }
  { orienté au nord et arrive au même niveau, au milieu du grand côté }
  { est, orienté N.                                                   }
 begin 
  phtd; av; p3htd; av; av; p3htd; av;
  lc; p3htd; av; pqtg; bc;
 end;  

 var I, J : integer; 
 
begin 
 ag;
 for J := 1 to 4 do
  begin
   { Dessiner 3 triangles, pointes à droite }
   for I := 1 to 3 do
    begin
     Triangle_D;
    end;
   { Dessiner un carré }
   Carre;
   { Dessiner 3 triangles, pointes à gauche }
   av;
   for I := 1 to 3 do
    begin
     Triangle_G;
    end;
   { Dessiner un carré, collé au dernier triangle }
     { Descendre au coin SW du carré }
       pdt; av;
     { Orienter le robot au nord }
       pdt;
     Carre;
 end;   
 st;
end.