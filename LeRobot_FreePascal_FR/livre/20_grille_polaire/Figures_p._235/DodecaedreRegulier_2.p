{$mode macpas} program DodecaedreRegulier_2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développements des solides de Platon, page 235.     *}
 {*                                                     *}
 {*******************************************************}

 const Cote = 18;

 procedure Pentagone;
 begin
  lgx(Cote); pqtd; av; lgRT(Cote, 72); phtg; av; lgRT(Cote, 36); pqtg; av; 
  pqtg; av; lgRT(Cote, 72); pqtg; av;  
 end;

 var I :integer;
 
begin
 eb;
 for I :=1 to 2 do 
  begin
   Pentagone;
   lc; lg(Cote); phtg; av; lgRT(Cote, 72); avf(2); pqtg; bc; Pentagone;
   lc; pdt; av; lgRT(Cote, 36); pqtd; av; phtg; bc; Pentagone;
   lc; pdt; av; phtg; lgx(Cote); av; pqtd; bc; Pentagone;
   lc; pqtd; av; lgx(Cote); phtd; av; pqtd; bc; Pentagone;
   lc; pdt; av; lgx(Cote); phtg; av; lgRT(Cote, 36); p3htd; av; 
   lgRT(Cote, 72); pqtg;
   av; p3htg; bc;
  end;
 st;
end.