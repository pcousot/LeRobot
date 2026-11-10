{$mode macpas} program PavageTrianglesEquilateraux;
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
  LongueurCote = 13;
  Angle = 60; 
  NbLignes = 12;
  NbColonnes = 12;
  
 procedure TrianglePointeEnHaut;
 begin
  pn; phtd; av; pqtd; av; p3htd; avf(2);
 end;
 
 procedure TrianglePointeEnHautNoir;
 begin
  TrianglePointeEnHaut; phtg; peindre;
 end;

 procedure TrianglePointeEnBas;
 begin
  ps; phtg; av; pqtg; av; p3htg; avf(2);
 end;
 
 procedure TrianglePointeEnBasNoir;
 begin
  TrianglePointeEnBas; avf(-1); pqtd; peindre;
 end;
 
 procedure Pavage;
  var 
   I : integer;
   J : integer;
 begin
  lgRT(LongueurCote, Angle); 
  for J := 1 to NbColonnes do
   begin
    for I := 1 to (NbLignes div 2) do
     begin
      if odd(I + J) then
       begin
        eh; ag; translater((2 * J), -(2 * I));
        TrianglePointeEnHautNoir;
        eh; ag; translater((2 * J), -(2 * I));
        TrianglePointeEnBas;
       end
      else
       begin
        eh; ag; translater((2 * J), -(2 * I));
        TrianglePointeEnHaut;
        eh; ag; translater((2 * J), -(2 * I));
        TrianglePointeEnBasNoir;
       end;
     end;
   end;
 end;
 
begin
 Pavage; st;
end.