{$mode macpas} program SegmentDeVonKoch;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe de Von Koch, page 255.                       *}
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
 
 function QuatrePuissance(N : integer) : integer;
 begin
  if N <= 0 then
   begin
    QuatrePuissance := 1;
   end
  else 
   begin
    QuatrePuissance := 4 * QuatrePuissance(N - 1);
   end;
 end;
 
 procedure Grille(I : integer);
 begin
  lg(500 / QuatrePuissance(I - 1));
 end;

 var I : integer;
    
begin
 for I := 1 to 6 do
  begin
   cf(blanc); eb; ag; pe; Grille(I); Segment(I - 1); MarquerUnePause;
  end;
end.

