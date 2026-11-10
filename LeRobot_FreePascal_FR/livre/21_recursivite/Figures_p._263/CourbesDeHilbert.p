{$mode macpas} program CourbesDeHilbert;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* CourbSe de Hilbert d'ordreS 1 à 6, page 263.        *}
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
 
 function DeuxPuissance(N : integer) : integer;
 begin
  if N <= 0 then
   begin
    DeuxPuissance := 1;
   end
  else 
   begin
    DeuxPuissance := 2 * DeuxPuissance(N - 1);
   end;
 end;

 var I : integer;
    
begin
 for I := 1 to 6 do
  begin
   message(concat('Courbe de Hilbert d''ordre ', EntierEnChaine(I)));
   cf(blanc); eb; ag; lg(256 div DeuxPuissance(I)); SegmentD(I); MarquerUnePause;
  end;
 st;
end.
