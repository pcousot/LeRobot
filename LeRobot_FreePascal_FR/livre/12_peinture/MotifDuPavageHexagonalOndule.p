{$mode macpas} program MotifDuPavageHexagonalOndule;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motif du pavage de la figure 12.7, page 140.        *}
 {*                                                     *}
 {*******************************************************}
 
 const L = 50;
 
 procedure RangeeDeTrianblesEquilateraux(N : integer);
 var I : integer;
 begin
 lgrt(L, 60); 
  for I := 1 to N do 
   begin
    phtg; av; pqtd; av; phtg;  
   end;
  pdt;avf(2 * N);pdt;
 end;
 
 procedure HexagoneDeTrianglesEquilateraux;
  var I : integer;
 begin
  for I := 1 to 2 do
   begin
    RangeeDeTrianblesEquilateraux(4);
    phtg; av; phtd;
    RangeeDeTrianblesEquilateraux(3);
    phtg; av; phtd;
    lg(L); avf(2); phtd; lgrt(L, 60); avf(2); p3htd;
  end;
  phtd;avf(2);phtg;
 end;

 procedure TourDuMotif;
 begin
  lg(L); phtg; vd; vg; 
  lgrt(L, 60); phtg; vd; vg; 
  pqtg; vd; vg; 
  lg(L); phtg; vd; vg; 
  lgrt(L, 60); phtg; vd; vg; 
  pqtg; vd; vg;
 end;

 procedure InterieurDuMotif;
 begin
  lg(L); phtg; vd;
  lgrt(L, 60); phtg; vg; vd; 
  lg(L); phtd; vg; 
  lgrt(L, 60); p3htg; vd; 
  lg(L); phtg; vg; vd; 
  lgrt(L, 60); phtd; vg; 
  pqtg; vd; 
  pqtg; vg; vd; 
  pqtd; vg; 
 end;
 
begin
 pqtd; 
 HexagoneDeTrianglesEquilateraux;
 ec(2); 
 TourDuMotif;
 ec(4);
 InterieurDuMotif;
 st;
end.