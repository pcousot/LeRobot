{$mode macpas} program PavageTrianglesCarres;
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
  NbLignes = 6;
  NbColonnes = 4;
  
 procedure TrianglesNS;
 begin
  lgRT(LongueurCote, 60); 
  pn; phtd; av; pqtd; av; p3htd; avf(2);
  p3htg; av; pqtg; av;
 end;
 
 procedure TrianglesWE;
 begin
  lgRT(LongueurCote, 30); 
  pne; av; pqtd; av; pqtd; av; pqtd; av; pqtd; av; p3htd; avf(2); p3htg; av;
 end;
 
 procedure Pavage;
  var 
   I : integer;
   J : integer;
 begin
  ce; lg(12); eh; 
  for I := 1 to NbLignes do
   begin
    lgRT(LongueurCote, 60); lc; ag;
    if odd(I) then
     begin
      lgRT(LongueurCote, 30); ps; av;
      lgRT(LongueurCote, 60); av;
     end
    else
     begin
      lgRT(LongueurCote, 30); pe; av; ps; av;
      lgRT(LongueurCote, 60); psw; av;
     end;
    bc;
    for J := 1 to NbColonnes do
     begin
      if odd(I) then
       begin
        TrianglesWE; TrianglesNS;
       end
      else
       begin
        TrianglesNS; TrianglesWE;
       end;
     end;
   end;
 end;

 procedure Coloriage;
  var 
   I : integer;
   J : integer;
 begin
  ce; lg(12); eh; lc; 
  for I := 1 to (NbLignes - 1) do
   begin
    lgRT(LongueurCote, 60); lc; ag;
    if odd(I) then
     begin
      lgRT(LongueurCote, 30); ps; av;
      lgRT(LongueurCote, 60); av;
     end
    else
     begin
      lgRT(LongueurCote, 30); pe; av; ps; av;
      lgRT(LongueurCote, 60); psw; av;
     end;
    for J := 1 to NbColonnes do
     begin
      if odd(I) then
       begin
        lgRT(LongueurCote, 30); pe; avf(2); pn; cc(jaune); peindre;
        if (J <> NbColonnes) then
         begin
          lgRT(LongueurCote, 60); pe; avf(2); pn; cc(noir); peindre;
         end;
       end
      else
       begin
        lgRT(LongueurCote, 60); pe; avf(2); pn; cc(noir); peindre;
        if (J <> NbColonnes) then
         begin
          lgRT(LongueurCote, 30); pe; avf(2); pn; cc(jaune); peindre;
         end;
       end;
     end;
   end;
 end;
 
begin
 Pavage; Coloriage; st; 
end.