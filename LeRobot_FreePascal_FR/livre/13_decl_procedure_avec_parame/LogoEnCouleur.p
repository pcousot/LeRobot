{$mode macpas} program LogoEnCouleur;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Logo en couleur, page 147.                          *}
 {*                                                     *}
 {*******************************************************}

 procedure PetitMotifInterieur(C : integer);
 begin
  cc(C);  ec(1);
  av; phtd; avf(2); phtg; vg; vd; pdt; vd; vg; phtg; avf(2); phtd; av;
 end;
 
 procedure GrandMotifInterieur(C : integer);
 begin
  cc(C); ec(3);
  lc; av; bc; avf(3); vd; vg; phtg; avf(2); pqtg;
  avf(2); phtg; vg; vd; avf(3); lc; av; bc;
 end;
 
 procedure CadreInterieur;
  var I : integer;
 begin
  cc(Jaune); ec(3);
  lc; phtg; avf(6); p3htd; bc;
  for I := 1 to 4 do
   begin
    avf(3); lc; avf(6); bc; avf(3); pqtd;
   end;
 end;

 procedure CadreIntermediaire;
  var I : integer;
 begin
  cc(Indigo); ec(5);
  lc; p3htg; av; p3htd; bc;
  for I := 1 to 4 do
   begin
    avf(4); phtg; avf(3); pqtd; avf(3); phtg; avf(4); pqtd;
   end;
 end;

 procedure CadreExterieur;
  var I : integer;
 begin
  cc(Rouge); ec(7);
  lc; p3htg; avf(2); p3htd; bc;
  for I := 1 to 4 do
   begin
    avf(6); lc; avf(6); bc; avf(6); pqtd;
   end;
 end;


begin
 lg(8); ce;
 GrandMotifInterieur(Vert); phtd;
 PetitMotifInterieur(Noir); phtd;
 GrandMotifInterieur(Noir); phtd;
 PetitMotifInterieur(Violet); phtd;
 GrandMotifInterieur(Violet); phtd;
 PetitMotifInterieur(Bleu); phtd;
 GrandMotifInterieur(Bleu); phtd;
 PetitMotifInterieur(Vert); phtd;
 CadreInterieur;
 CadreIntermediaire;
 CadreExterieur;
 ce; pqtg;
 st;
end.