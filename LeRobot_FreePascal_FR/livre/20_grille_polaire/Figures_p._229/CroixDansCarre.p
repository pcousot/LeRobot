{$mode macpas} program CroixDansCarre;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Croix, page 229.                                    *}
 {*                                                     *}
 {*******************************************************}
 const
  R = 60; { Rayon des arcs de la croix. }
  
 procedure Carre;
  var I :integer;
 begin
  for I := 1 to 4 do
   begin
    av; pqtd;
   end;
 end; 

 var
  I : integer;
begin
 lgRT(2 * R, 45); 
 Carre; 
 lg(valLgX - R); av; pqtd;
 for I :=1 to 2 do
  begin
   lg(R); vg; p3htd; 
   lgRT(2 * R, 45); lg(valLgX - R); av; p3htd; 
   lg(R); vg; p3htd;
   lgRT(2 * R, 45); lg(valLgX - R); av;
   lc; phtd; lg(R); av; pqtd; lgRT(2 * R, 45); lg(valLgX - R); av; pqtd; bc;
 end;
 st;
end.