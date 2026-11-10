{$mode macpas} program TapisEgyptien;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Tapis égyptien, page 179.                           *}
 {*                                                     *}
 {*******************************************************}

 const
  G = 4;   { Taille de grille }
  
  H = 19;  { H est impair. C'est la longueur du côté horizontal }
           { du tapis en nombre de "barres" }
           
  L = 3;   { L est impair,  L ≥ 3   et  (H - 2 * L) div 2 >= 4) } 
           { C'est  la longueur  du côté horizontal de la bande }
           { extremité du tapis en nombre de "barres" }
                              

 { Motif aux quatre coins }

 procedure OctogoneCentral;
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    lgY(G * 1); lgX(G * 2); av; phtd; lg(G); av; phtd;
   end;
   lc; phtd; avf(3); bc;
  for I := 1 to 4 do
   begin
    pqtd; av;   
   end;
  { peindre }
  avf(-1); cc(rouge); peindre; cc(noir); av;
  pqtg;                          
 end;

 procedure TriangleOuvertGauche;
 begin
  lg(G); avf(3); p3htg; av; lgX(G*2); av; pqtg; av; p3htg; avf(2);
  { peindre }
  avf(-1); pqtd; cc(rouge); peindre; cc(noir); pqtd; av; phtg;
  lg(G); av; phtd;
 end;

 procedure TriangleOuvertGaucheMiroir;
 begin
  lg(G); avf(3); p3htd; av; lgX(G*2); av; pqtd; av; p3htd; avf(2);
  { peindre } 
  avf(-1); pqtg; cc(rouge); peindre; cc(noir); pqtg; av; phtd;
  lg(G); av; phtg; 
 end;

 procedure QuartGauche;
 begin
  TriangleOuvertGauche; av; phtd; lgY(G*1); lgX(G*3); av; p3htd; 
  TriangleOuvertGauche;
 end;
 
 procedure QuartGaucheMiroir;
 begin
  TriangleOuvertGaucheMiroir; av; phtg; lgY(G*1); lgX(G*3); av;
  p3htg; TriangleOuvertGaucheMiroir;
 end;

 procedure MotifExtremite;
  var I : integer;
 begin
  for I := 1 to 2 do 
  begin
   QuartGauche; lc; pdt; avf(4); pqtd; avf(3);  bc; av; pqtg; 
   QuartGaucheMiroir; av; lc; avf(4); pqtd; avf(3); pqtg; bc;
  end;
  lc; avf(-4); pqtg; avf(2); p3htd; bc; OctogoneCentral;
 end;

 { Motif du centre }
 
 procedure Carreau;
  var I : integer;
 begin
  phtd; lc; av; phtg; bc; 
  for I := 1 to 4 do
   begin 
    av; pqtd;
   end;
  lc; p3htg;  av; phtd; bc;
 end;

 procedure Extremite;
  var I : integer;
 begin
  for I := 1 to 3 do 
   begin 
    av; pqtg; av; pqtd; av; pqtd; av; pqtg; av; pqtd;
   end;
  Carreau;
 end;

 procedure MotifEnC;
 begin
  av; pqtg; av; pqtd; av; pqtd; av; pqtg; av; pqtd; avf(2); pqtd; av;
  pqtd; av; pqtg; av; pqtg; avf(2); pqtg; av; pqtd; av; pqtg; avf(2);
  pqtg; av; pqtd;
 end;

 procedure MotifEnCInverse;
 begin
  pqtd; av; pqtg; avf(2); pqtg; av; pqtd; av; pqtg; avf(2); pqtg; 
  av; pqtg; av; pqtd; av; pqtd; avf(2); pqtd; av; pqtg; av; pqtd; 
  av; pqtd; av; pqtg; av;
 end;

 procedure Losange (N : integer); { N = côté en nombre de motifEnC }
  var
   J : integer;
   I : integer;
 begin
  for J := 1 to 2 do
   begin
    av; 
    for I := 1 to N do
     begin
      MotifEnC;
     end;
    Extremite;
    for I := 1 to N do
     begin
      MotifEnCInverse;
     end;
   end;
 end;

 procedure Centre; 
  var I : integer;
 begin
  lgX(G + 1);
  for I := 0 to (((H - 2 * L) div 2 - 1) div 2) do
   begin 
    Losange(((H - 2 * L) div 2 -1) - 2 * I);      
    if ((I mod 3) = 0)  
     then 
      begin cc(rouge); end 
     else 
      begin
       if ((I mod 3) = 2) then begin cc(blanc); end;
      end;
    pqtd; peindre; cc(noir); pqtg; 
    lc; pqtd; avf(6); pqtg; bc;
  end;
  if (((((H - 2 * L) div 2 -1) div 2 + 1) mod 3) = 0)  
     then 
      begin cc(rouge); end 
     else 
      begin
       if (((((H - 2 * L) div 2 -1) div 2 + 1) mod 3) = 2) 
        then begin cc(blanc); end;
      end;
  lc; pqtg; avf(6); peindre; cc(noir); pqtd; bc; 
  lgX(G);
 end;

{ Bord du tapis }

 procedure Cran;
 begin
  pqtg; av; pqtd; av; pqtd; av; pqtg;
 end;

 procedure GrandeBarre;
 begin
  avf(3); Cran; avf(3); 
 end;
 
 procedure PetiteBarre;
 begin
  avf(2); Cran; avf(2);
 end;
 
 procedure Descente;
 begin
  pqtd; avf(2); pqtg;
 end;

 procedure  Montee;
 begin
  pqtg; avf(2); pqtd;
 end;
  
 procedure CoteExterieur;
  var I : integer;
 begin
  for I := 1 to (H div 2) do
   begin
    GrandeBarre; Descente; PetiteBarre; Montee;
   end;
  GrandeBarre;
 end;
 
 procedure CoteInterieur (N : integer); { N = nombre de barres }
  var I : integer;
 begin
  for I := 1 to (N div 2) do
   begin
    PetiteBarre; Montee; GrandeBarre;  Descente;
   end;
  PetiteBarre;
 end;

 procedure RectangleExterieur;
  var I : integer;
 begin
  for I := 1 to 2 do              
   begin
    avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3) + 10); 
    pqtd; avf(((H div 2) * 12 + 7) + 10); pqtd;
   end;
 end;

 procedure RectangleCranteExterieur;
 begin
  pn;
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3)); 
  pqtd; CoteExterieur; pqtd; 
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3)); 
  pqtd; CoteExterieur; pqtd;
 end;

 procedure RectangleCranteInterieurExtremite;
 begin
  pe;
  CoteInterieur(L); pqtg; 
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3) - 2); 
  pqtg; CoteInterieur(L); pqtg; 
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3) - 2); 
  pqtg;
 end;
 
 procedure RectangleCranteInterieurCentral;
 begin
  pe;
  lc; Montee;av; bc;
  avf(2); Cran; avf(3); Descente; CoteInterieur(H - (2 * L) - 2); 
  Montee; avf(3); Cran; avf(2); pqtg; 
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3) - 6); 
  pqtg; avf(2); Cran; avf(3); Descente; 
  CoteInterieur(H - (2 * L) - 2); Montee; avf(3); Cran; avf(2); pqtg; 
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + (7 * 2 + 2) + (2 * 3) - 6); 
  pqtg;
 end;

 procedure Bord;
 begin
  RectangleExterieur;
  lc; avf(5); pqtd; avf(5);pqtg; bc; 
  RectangleCranteExterieur;
  cc(rouge); peindre; cc(noir); lc; av; pqtd; av; bc;
 end;

{ Interieur du tapis }
 
 procedure RectangleExtremite;
 begin
  RectangleCranteInterieurExtremite;
  lc; avf(((((L - 1) div 2) * 12) div 2) + 2); pqtg; avf(12 + 6); bc; 
  MotifExtremite;lc; 
  avf(7 + ((((H - 2 * L) div 2 -1) * 6 
        + 5 + (7 * 2 + 2) + (2 * 3) - 2) - (2 * 21)) + 3); 
  pdt; bc; MotifExtremite;lc; 
  avf(7 + ((((H - 2 * L) div 2 - 1) * 6 
        + 5 + (7 * 2 + 2) + (2 * 3) - 2) - 21)); pqtg; 
  avf((((L-1) div 2) * 12) div 2 + 3); phtd; peindre; phtg; bc; 
 end;

 procedure RectangleCentral;
 begin
  RectangleCranteInterieurCentral;
  lc; avf(((H - 2 * L) div 2 ) * 6 + 2); pqtg;
  avf(((H - 2 * L) div 2 -1) * 6 + 5 + 7); pqtd; bc;
  Centre;
  lc; avf(((H - 2 * L) div 2) * 6 + 2 + 2); pqtd; 
  avf((((H - 2 * L) div 2 - 1) * 6 + 5 + 7) -
      (((H - 2 * L) div 2 - 1) div 2) * 6 + 2); bc;
 end;

begin
 lg(G); ag; eb;
 Bord;
 RectangleExtremite;
 RectangleCentral;
 RectangleExtremite;
 st;
end.