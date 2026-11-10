{$mode macpas} program OctaedreRegulier;
 uses Robot1, Robot2;
 { Dessiner le développement d'un octaèdre régulier }
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développements des solides de Platon, page 235.     *}
 {*                                                     *}
 {*******************************************************}

 const Cote = 25;

 procedure Triangle;
 begin
  lgRT(Cote, 60); phtd; av; pqtd; av; p3htd; av; av; pdt; av; av; pqtg; 
 end;
   
 var I : integer;

begin
 { Triangle en bas à gauche }
 pdt; Triangle; pdt; 
 { Rangée de trois triangles pointes en haut }
 for I := 1 to 3 do 
  begin
   Triangle;
  end;
 { Compléter les trois triangles pointes en bas }
 phtd; av; p3htg; avf(6);
 { Triangle en haut à droite }
 pdt; avf(4); pqtg; Triangle;  
 st;
end.