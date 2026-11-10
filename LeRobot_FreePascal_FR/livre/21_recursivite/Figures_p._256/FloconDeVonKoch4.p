{$mode macpas} program FloconDeVonKoch4;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Flocons de Von Koch, page 256.                      *}
 {*                                                     *}
 {*******************************************************}

 procedure Segment (N : integer);
 begin
  if N = 0 then
   begin
    av;
   end
  else
   begin
    Segment(N - 1);
    pqtg; 
    Segment(N - 1);
    phtd; 
    Segment(N - 1);
    phtd; 
    Segment(N - 1);
    phtd; 
    Segment(N - 1);
    phtd; 
    Segment(N - 1);
    pqtg; 
    Segment(N - 1);
   end;
 end;
 
 procedure Carre (N : integer);
 begin
  Segment(N); 
  pqtd; 
  Segment(N); 
  pqtd; 
  Segment(N); 
  pqtd; 
  Segment(N); 
 end;
 
 procedure RejoindreDepart;
 begin
  lc; avf(4); pqtd; bc;
 end;

begin
  RejoindreDepart;
  lg(1);
  Carre (3);
  st;
end.