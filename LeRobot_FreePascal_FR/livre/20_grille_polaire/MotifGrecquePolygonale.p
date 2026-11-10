{$mode macpas} program MotifGrecque;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* GrecquePolygonale, page 227.                        *}
 {*                                                     *}
 {*******************************************************}
 const
  Fg = 6; { Facteur de grossissement }
 
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
 
begin
 pe; Motif; st;
end.