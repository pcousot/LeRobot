{$mode macpas} program Pentagone_1;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pentagone, page 229.                                *}
 {*                                                     *}
 {*******************************************************}
 const LongueurCote = 50;
begin
 lg(LongueurCote); pqtd; av;
 lgRT(LongueurCote, 72); phtg; av;
 lgRT(LongueurCote, 144); pqtg; av;
 pqtg; av;
 lgRT(LongueurCote, 72); pqtg; av;   
 st;
end.