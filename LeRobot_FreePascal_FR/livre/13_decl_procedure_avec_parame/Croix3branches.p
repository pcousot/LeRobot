{$mode macpas} 
program Croix3branches;
 uses Robot1, Robot2;
  
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Croix à trois branches, page 147.                   *}
 {*                                                     *}
 {*******************************************************}

 procedure Branche(I : integer);
  { Dessiner un branche de longueur I }
 begin
  av; pqtd; avf(I); pqtg; av; pqtg; avf(I); pqtd; 
 end;
 
 procedure MoitieDeCroixDroite;
  var I : integer;
 begin
  for I := 1 to 3 do
   begin
    Branche(4 - I);
   end;
 end;

 procedure MoitieDeCroixGauche;
  var I : integer;
 begin
  for I := 1 to 3 do
   begin
    Branche(I);
   end;
 end;

begin
 MoitieDeCroixDroite;
 { Haut } av; pqtg; av; pqtg; 
 MoitieDeCroixGauche;
 { Bas } avf(2); pqtg; av; pqtg; av; 
 st; 
end.
