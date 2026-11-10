{$mode macpas} program PavageTrianglesEtoiles;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavages de triangles, losanges et carrés, page 230. *}
 {*                                                     *}
 {*******************************************************}

 const
  LongueurCote = 15;
  NbLignes = 5;
  NbColonnes = 6;
  
 procedure Croix;
 begin
  lgRT(LongueurCote, 60); 
  pne; av; p3htg; avf(2); p3htg; avf(2); p3htd; avf(2); p3htd; av;
  lgRT(LongueurCote, 30); 
  pne; av; p3htd; avf(2); p3htd; avf(2); p3htg; avf(2); p3htg; av;
 end;
 
 procedure Pavage;
  var 
   I : integer;
   J : integer;
 begin
  for J := 1 to NbColonnes do
   begin
    for I := 1 to NbLignes do
     begin
        lgRT(LongueurCote, 60); eh; translater(0, -(2 * I));
        lgRT(LongueurCote, 30); ag; translater((2 * J), 0);
        Croix;
     end;
   end;
 end;
 
 procedure Coloriage;
  var 
   I : integer;
   J : integer;
 begin
  cc(bleu);
  for J := 1 to (NbColonnes - 1) do
   begin
    for I := 1 to (NbLignes - 1) do
     begin
        lgRT(LongueurCote, 60); eh; translater(0, -((2 * I) + 1));
        lgRT(LongueurCote, 30); ag; translater(((2 * J) + 1), 0);
        peindre;
     end;
   end;
 end;
 
begin
 Pavage; Coloriage; st;
end.