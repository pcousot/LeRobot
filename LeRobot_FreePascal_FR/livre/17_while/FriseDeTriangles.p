{$mode macpas} program FriseDeTriangles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDeTriangles, pages 192 et 194.                 *}
 {*                                                     *}
 {*******************************************************}

 procedure AuBord;
  { Rejoindre le bord en avançant tout droit. }
 begin
  lc; 
  while (not tb) do
   begin
    av;
   end;
  bc; 
 end;
 
 procedure Motif;
 begin
  if (not tb) then
   begin
    av; p3htg; av; p3htg; av; 
    if (not tb) then
     begin
      av; p3htd; av; p3htd; av; 
     end;
   end;
 end;
 
 procedure Frise;
 begin 
  pne; 
  while (not tb) do
   begin
    Motif;
   end;
 end;
 
begin
 pw; AuBord; Frise; st;
end.