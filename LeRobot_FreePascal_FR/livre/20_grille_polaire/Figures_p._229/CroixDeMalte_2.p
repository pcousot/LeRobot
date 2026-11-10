{$mode macpas} program CroixDeMalte_2;
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
  LongueurBranche = 50;
 var
  I : integer;
begin
 lgRT(LongueurBranche, 30);
 phtd;
 for I := 1 to 2 do 
  begin
   av; p3htd; avf(2); p3htd; avf(2); p3htg; avf(2); p3htg; av; 
   lgRT(LongueurBranche, 60); pqtg; 
  end;
 st;
end.