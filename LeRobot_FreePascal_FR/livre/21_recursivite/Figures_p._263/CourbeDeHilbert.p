{$mode macpas} program CourbeDeHilbert;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe de Hilbert d'ordre 6, page 263.              *}
 {*                                                     *}
 {*******************************************************}

 procedure SegmentD(N : integer);
  forward;
  
 procedure SegmentG (N : integer);
 begin
  if N > 0 then
   begin
    pqtg; 
    SegmentD(N -1);
    av; 
    pqtd; 
    SegmentG(N -1);
    av; 
    SegmentG(N -1);
    pqtd; 
    av; 
    SegmentD(N -1);
    pqtg; 
   end;
 end;
 
 procedure SegmentD{(N : integer)};
 begin
  if N > 0 then
   begin
    pqtd; 
    SegmentG(N -1);
    av; 
    pqtg; 
    SegmentD(N -1);
    av; 
    SegmentD(N -1);
    pqtg; 
    av; 
    SegmentG(N -1);
    pqtd; 
   end;
 end;
 
 procedure RejoindreDepart;
 begin
  lc; phtd; avf(8); p3htd; bc;
 end;

begin
  RejoindreDepart;
  lg(3);
  SegmentD(6);
  st;
end.