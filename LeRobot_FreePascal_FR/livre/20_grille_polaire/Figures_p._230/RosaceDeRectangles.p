{$mode macpas} program RosaceDeRectangles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces polygonales, page 230.                      *}
 {*                                                     *}
 {*******************************************************}

 const 
  LongueurGR = 108; { Longeur grand rectangle }
  LargeurGR = 61;   { Largeur grand rectangle, longueur petit rectangle }
  LargeurPR = 16;   { Largeur petit rectangle }
  N = 6;            { (2 * N) est le nombre de branches de l'étoile centrale }
 
 procedure Rectangles;
 begin
  lc; tl(LargeurGR div 2); rt(90); bc;
  tl(LongueurGR / 2); rt(90); 
  tl(LargeurGR); rt(90); 
  tl(LongueurGR); rt(90); 
  tl(LargeurGR); rt(90); 
  tl(LongueurGR / 2);
  lc; tl(LargeurPR / 2); rt(90); bc;
  tl(LargeurGR); rt(90); 
  lc; tl(LargeurPR); rt(90); bc; 
  tl(LargeurGR); pdt; 
 end;
 
 var
  I : integer;
begin
 for I := 1 to N do
  begin
   Rectangles; ce; rt(180 / N); 
  end;
 st;
end.