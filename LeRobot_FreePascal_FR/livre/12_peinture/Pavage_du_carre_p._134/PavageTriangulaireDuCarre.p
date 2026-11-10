{$mode macpas} program PavageTriangulaireDuCarre;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavages du carré, page 134.                         *}
 {*                                                     *}
 {*******************************************************}
 const
  TailleGrille = 24;
 var
  I : integer;
  J : integer;
begin
 lg(TailleGrille);
 for I:= 1 to 4 do
  begin
   { Petit triangle noir }
   av; pqtd; av; p3htd; av; p3htd;
   lc; av; phtg; peindre; p3htg; av; pdt; bc;
   { Grand triangle blanc }
   avf(2); pqtd; avf(2); p3htd; avf(2);
   { Petit triangle blanc }
   av; p3htd; av; pqtd; av; p3htd;
   { Grand triangle, extrémité noire }
   avf(2); p3htd; avf(2); pqtd; avf(2); p3htd;
   lc; av; pqtg; peindre; pqtg; av; pdt; bc;
   phtd;
 end;
 st;
end.