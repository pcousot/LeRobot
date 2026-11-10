{$mode macpas} program MotifDapresHoremis1;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motifs géométriques d'aorès Horemis, page 229.      *}
 {*                                                     *}
 {*******************************************************}
 var
  I : integer;
  J : integer;
begin
 lg(62);
 for I := 1 to 9 do
  begin 
   ce; lc; av; pqtd; bc; 
   for J := 1 to 4 do
    begin 
     av; pqtd; av; 
    end;
   vd; vd; vd; vd; 
   for J := 1 to 4 do
    begin 
     av; phtg; peindre; p3htd; av; 
    end;
   lgRT(valLgX, 45); phtd;
   ce; lc; av; pqtd; bc; 
   for J := 1 to 4 do
    begin 
     av; pqtd; av; 
    end;
   for J := 1 to 4 do
    begin 
     av; phtg; peindre; p3htd; av; 
    end;
   phtg;
  end;
 st;
end.