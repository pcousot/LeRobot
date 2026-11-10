{$mode macpas} program SpiraleDor;
 uses Robot1, Robot2, Robot3;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* SpiraleDor, page 219.                               *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 lg(100);
 for I := 1 to 12 do
  begin
   vd; 
   lg(valLgX / (1 + sqrt(5)) * 2);
  end;
 st; 
end.