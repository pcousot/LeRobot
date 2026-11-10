{$mode macpas} program OctogoneRectanglesCercles;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Octogone décoré, page 229.                          *}
 {*                                                     *}
 {*******************************************************}

 const
  R = 24;
  
 procedure Octogone;
  var I : integer;
 begin
  pqtd; lgrt(2 * R, 45);
  for I := 1 to 8 do 
   begin  
    av; rt(45);
   end;
 end;
 
 procedure Rectangle_Inscrit;
  var I : integer;
 begin
  for I := 1 to 2 do 
   begin
    lg(R); av; lgrt(2 * R, 45); av; lg(R); av; pqtd; lgrt(2 * R, 45);
    av; pqtd; 
   end;
 end;
 
 procedure Trois_quarts_de_cercle;
  var I : integer;
 begin
  phtg; lg(R); av; phtd;
  for I := 1 to  4 do
   begin
    ec(2); vd; vd; vd; ec(1); pdt; lgrt(2 * R, 45); av; pdt; lg(R);
   end;
 end;

begin
 Octogone;pqtg; Rectangle_Inscrit;
 lg(R); phtg; av; lgrt(2 * R, 45); phtd; av; pqtd;
 Rectangle_Inscrit;trois_quarts_de_cercle;
 st;
end.