{$mode macpas} program CourbeDePeano;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe de Peano, page 265.                          *}
 {*                                                     *}
 {*******************************************************}

 procedure SegmentY (N : integer);
  forward;
  
 procedure SegmentX (N : integer);
 begin
  if N > 0 then
   begin
    SegmentX(N - 1);
    av;
    SegmentY(N - 1);
    av;
    SegmentX(N - 1);
    pqtd; 
    av; 
    pqtd; 
    SegmentY(N - 1);
    av;
    SegmentX(N - 1);
    av;
    SegmentY(N - 1);
    pqtg; 
    av; 
    pqtg; 
    SegmentX(N - 1);
    av;
    SegmentY(N - 1);
    av;
    SegmentX(N - 1);
   end;
 end;
  
 procedure SegmentY {(N : integer)};
 begin
  if N > 0 then
   begin
    SegmentY(N - 1);
    av;
    SegmentX(N - 1);
    av;
    SegmentY(N - 1);
    pqtg; 
    av; 
    pqtg; 
    SegmentX(N - 1);
    av;
    SegmentY(N - 1);
    av;
    SegmentX(N - 1);
    pqtd; 
    av; 
    pqtd; 
    SegmentY(N - 1);
    av;
    SegmentX(N - 1);
    av;
    SegmentY(N - 1);
   end;
 end;
  
begin
 ag; eb; lg(10);
 SegmentX(3);
 st; 
end.

