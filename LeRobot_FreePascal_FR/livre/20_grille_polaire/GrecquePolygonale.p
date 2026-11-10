{$mode macpas} program GrecquePolygonale;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* GrecquePolygonale, pages 227-228.                   *}
 {*                                                     *}
 {*******************************************************}
 const
  Fg = 2; { Facteur de grossissement }
  N = 10;  { Nombre de côtés }
 
 procedure Motif;
 begin
  { Partie gauche }
  tl(13 * Fg); rt(90); tl(8 * Fg); rt(90); tl(6 * Fg); rt(90); 
  tl(4 * Fg); rt(90); tl(2 * Fg); rt(90); tl(2 * Fg); rt(-90); 
  tl(2 * Fg); rt(-90); tl(4 * Fg); rt(-90); tl(6 * Fg); rt(-90); 
  tl(8 * Fg); rt(-90); 
  tl(18 * Fg); rt(-90);  
  { Partie symétrique droite }
  tl(8 * Fg); rt(-90); tl(6 * Fg); rt(-90); tl(4 * Fg); rt(-90);
  tl(2 * Fg); rt(-90); tl(2 * Fg); rt(90); tl(2 * Fg); rt(90);
  tl(4 * Fg); rt(90); tl(6 * Fg); rt(90);  tl(8 * Fg); rt(90);
  tl(13 * Fg); 
 end;
 
 procedure Grecque;
  var I : integer;
 begin
  for I := 1 to N do
   begin
    Motif; rt(360 / N);
   end;
 end;
 
begin
 Grecque; st;
end.