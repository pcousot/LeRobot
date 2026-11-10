{$mode macpas}  program FriseLosangesDansBande;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 var l : integer;
begin 
 { Déplacement à gauche du cadre }
 ag; lc; pqtd; av; bc;
 { Dessin de la frise de losanges entre deux traits horizontaux } 
 for l := 1 to 13 do
  begin
   { Dessin des deux côtés ouest du losange }
   p3htd; av; pqtg; av; phtg;
   { Dessin du trait sud jusqu'au losange est }
   av; av; av; 
   { Retour à la pointe sud du losange }
   pdt; av; av; av;
   { Dessin des deux côtés est du losange }
   p3htd; av; pqtg; av; p3htd; 
   { Dessin du trait nord jusqu'au losange est }
   av; av; av; 
  end;
 { Dessin du dernier losange }
 p3htd; av; pqtg; av; pqtg; av; pqtg; av;
 st; 
end.