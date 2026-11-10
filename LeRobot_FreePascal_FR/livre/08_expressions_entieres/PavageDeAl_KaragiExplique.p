{$mode macpas} program PavageDeAl_KaragiExplique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de Al-Karagi, page 99.                       *}
 {*                                                     *}
 {*******************************************************}

 const Nmax = 10;
  
 procedure MarquerLeBord(N : integer);
  var L : real; I, J, M : integer;
 begin
  L := VallgX;
  if odd(N) then
    M := ((N + 1) div 2) * N
  else
    M := (N + 1) * (N div 2);
  for I := 1 to 4 do begin
    for J := 1 to M do begin
     lg(2); pqtd; av; pdt; av; pqtd; lg(L); av; 
    end;
    lg(2); pqtd; av; pdt; av; pqtd; lg(L);
    pqtg; 
  end;
 end;
 
 procedure Numeroter(N : integer);
  var
   K : integer;
   L : integer;
 begin
  PoliceTexte(courier); TailleTexte(9);
  for K := 1 to N do 
   begin
    for L := 1 to (K div 2) do
     begin
      av;
     end;
    translater(0, -4); ecrire(entierEnChaine(K)); translater(0, 4); 
    for L := 1 to (K - (K div 2)) do
     begin
      av;
     end;
   end;
 end;

 var
  I : integer;
  J : integer; 
  K : integer;
  L : integer;

begin
 eb; ag; lc; av; pqtd; av; pqtg; bc; lg(3); 
 for I := 1 to Nmax do
  begin
   { Dessiner un carré de taille de côté 1 + 2 + ... + I }
   for J := 1 to 4 do
    begin
     for K := 1 to I do 
      begin
       for L := 1 to K do
        begin
         av;
        end;
      end;
     pqtd; 
    end;
  end;
  { Peindre }
 translater(1, 1);
 for I := 2 to Nmax do
  begin
   avf(I); pqtd; avf(I); pqtd; avf(I); pqtd; avf(I); pqtd; 
   if not odd(I) then
    begin
     phtg; cc(Jaune); peindre; pdt; peindre; 
     cc(violet); pqtd; peindre; p3htd; cc(noir);
    end;
   translater(I, I);
  end;
 { Retour en bas à gauche }
 for I := 1 to Nmax do
  begin
   translater(-I, -I);
  end;
 pqtd; MarquerLeBord(Nmax); 
 Numeroter(Nmax);
 st;
end.