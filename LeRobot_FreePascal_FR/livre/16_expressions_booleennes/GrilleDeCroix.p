{$mode macpas} program GrilleDeCroix;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Grille de croix, page 177.                          *}
 {*                                                     *}
 {*******************************************************}

 procedure Croix;
 begin
  av; pqtg; av; 
  ec(3); dp; ec(1);
  pdt; avf(2); pdt; 
  ec(3); dp; ec(1);
  av; pqtd; av; 
 end;
 
 procedure ColonneDeCroix (N : integer);
  var L : integer;
 begin
  for L := 1 to N do
   begin
    Croix;
   end;
 end;
 
 procedure EnBasColonneSuivante;
 begin
  lc; eb; pqtd; avf(2); pqtg; bc; 
 end;
 
 procedure Grille(NbLignes : integer; NbColonnes : integer);
  var C : integer;
 begin
  for C := 1 to NbColonnes do
   begin
    EnBasColonneSuivante;
    if odd(C) then
     begin
      av; ColonneDeCroix(NbLignes); av;
     end
    else
     begin
      ColonneDeCroix(NbLignes + 1);
     end;
   end;
 end;
 
begin
 ag; Grille(6, 7); st;
end.