{$mode macpas} program FloconDeVonKoch2;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Flocons de Von Koch, page 256.                      *}
 {*                                                     *}
 {*******************************************************}

 const L = 3;

 procedure Segment (N : integer);
 begin
  if N = 0 then
   begin
    av;
   end
  else if tw or te then
   begin
    lg(L);
    Segment(N - 1);
    lgrt(L, 60);
    phtg; 
    Segment(N - 1);
    pqtd; 
    Segment(N - 1);
    lg(L);
    phtg; 
    Segment(N - 1);
   end
  else if tne or tsw then
   begin
    lgrt(L, 60);
    Segment(N - 1);
    pqtg;
    Segment(N - 1);
    lg(L);
    p3htd; 
    Segment(N - 1);
    lgrt(L, 60);
    phtg; 
    Segment(N - 1);
   end 
  else if tnw or tse then
   begin
    lgrt(L, 60);
    Segment(N - 1);
    lg(L);
    phtg;
    Segment(N - 1);
    lgrt(L, 60);
    p3htd; 
    Segment(N - 1);
    pqtg; 
    Segment(N - 1);
   end 
  else
   Biiip;
 end;
 
 procedure Triangle (N : integer);
 begin
  pqtd; 
  lg(L);
  Segment(N); 
  lgrt(L, 60);
  p3htg;
  Segment(N); 
  pqtg; 
  Segment(N); 
 end;
 
begin
  eb; ag; Triangle(4); st;
end.