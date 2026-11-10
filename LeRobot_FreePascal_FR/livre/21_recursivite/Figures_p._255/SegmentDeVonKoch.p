{$mode macpas} program SegmentDeVonKoch;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe de Von Koch, pages 255 et 262.               *}
 {*                                                     *}
 {*******************************************************}

 procedure Segment(N : integer);
 begin
  if N = 0 then
   begin av; end
  else
   begin
    Segment(N - 1);
    phtg; 
    Segment(N - 1);
    pqtd; 
    Segment(N - 1);
    phtg; 
    Segment(N - 1);
   end;
 end;
 
begin
  lg(6); ag; pe; Segment(3); st;
end.