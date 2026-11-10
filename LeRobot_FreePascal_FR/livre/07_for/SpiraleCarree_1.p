{$mode macpas} program SpiraleCarree_1;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* SpiraleCarree_1, page 74.                           *}
 {*                                                     *}
 {*******************************************************}
 var 
  I : integer;
  J : integer;
begin
 for I := 1 to 22 do
  begin
   for J := 1 to I do
    begin
     av;
    end;
   pqtd;
  end;
 st; 
end.