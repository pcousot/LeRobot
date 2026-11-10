{$mode macpas} program FriseDoublePeigne;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDoublePeigne, pages 171-172.                   *}
 {*                                                     *}
 {*******************************************************}
 const NombreDeDents = 30;
 var I : integer;
begin
 ag; pe;
 for I := 1 to NombreDeDents do
  begin
   { Trait horizontal} av;
   if odd(I) then
    begin
     { Dent vers le bas } pqtd; av; pdt; av; pqtd; 
    end
   else
    begin
     { Dent vers le haut } pqtg; av; pdt; av; pqtg; 
    end;
  end;
 st; 
end.