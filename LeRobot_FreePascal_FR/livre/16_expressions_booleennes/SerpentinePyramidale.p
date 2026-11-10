{$mode macpas} program SerpentinePyramidale;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Serpentine pyramidale, pages 177, 179 et 181.       *}
 {*                                                     *}
 {*******************************************************}
 const
  TailleGrille = 6;
  Hauteur = 28;
 var I : integer;
begin
 lg(TailleGrille); eh; pqtd; 
 for I := 1 to Hauteur do
  begin
   avf(I);
   if odd(I) then
    begin
     pqtd; av; pqtd; 
    end
   else
    begin
     pqtg; av; pqtg; 
    end;
  end;
 st; 
end.