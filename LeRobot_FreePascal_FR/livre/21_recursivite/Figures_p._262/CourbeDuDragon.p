{$mode macpas} program CourbeDuDragon;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbe du dragon d'ordre 12, page 262.              *}
 {*                                                     *}
 {*******************************************************}

 procedure SegmentGauche (N : integer);
 forward;

 procedure SegmentDroit (N : integer);
 begin
  if N = 0 then
   begin
    av; 
   end
  else if N > 0 then
   begin
    SegmentDroit(N - 1);
    pqtg;
    SegmentGauche(N - 1);
   end;
 end;
    
 procedure SegmentGauche;
 begin
  if N = 0 then
   begin
    av; 
   end
  else if N > 0 then
   begin
    SegmentDroit(N - 1);
    pqtd;
    SegmentGauche(N - 1);
   end;
 end;
    
begin
 lg(2); pe; SegmentDroit(12); st; 
end.

