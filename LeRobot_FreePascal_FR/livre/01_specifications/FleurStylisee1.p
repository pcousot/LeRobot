{$mode macpas} program FleurStylisee1;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Fleur stylisée, page 9.                             *}
 {*                                                     *}
 {*******************************************************}

 procedure Petale;
 begin 
  phtd; av; av; p3htd; av; av; pqtd; av; av;
 end;
    
 procedure Feuille;
 begin
  av; av; p3htg; av; av; pqtg; av; av; 
 end;  
   
 var P : integer; J : integer;
  
begin
 { Monter }
 lc; av; av; bc; 
 { Dessiner les pétales }
 for P := 1 to 4 do
  begin
   Petale;
  end;
 pdt;
 { Dessiner la tige }
 for J := 1 to 11 do
  begin
   av;
  end;
 { Dessiner la feuille }
 pdt; av; av; av; av; phtd; av; av; feuille;
 st;
end.