{$mode macpas} program Arabesque;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Arabesque, page 147.                                *}
 {*                                                     *}
 {*******************************************************}

 { Dessin d'une arabesque. }
 
 const
  TailleGrille = 10;
  EpaisseurGrosTraits = 3;
  
 procedure Sauter(N : integer);
  { Sauter en avant de N positions sur la grille }
 begin
  lc; avf(N); bc;
 end;
 
 procedure Cercle(R : integer; ECcercle : integer);
  { Tracer un cercle de rayon R centré sur le robot avec l'épaisseur }
  { de crayon ECcercle }
 begin
  lg(R * TailleGrille); ec(ECcercle);
  lc; av; pqtg; bc;
  vg; vg; vg; vg;
  lc; pqtg; av; pdt; bc;
  lg(TailleGrille); ec(EpaisseurGrosTraits);
 end;
 
 procedure QuardDetoile;
   { Quard d'une étoile à huit branches circonscrite aux huit petits }
   { cercles }
 begin
   av; phtd; av; pqtg; av; phtd; av;
 end;

 procedure DemiEtoile;
   { Moitié d'une étoile à huit branches circonscrite aux huit }
   { petits cercles }
 begin
   QuardDetoile; pqtg; QuardDetoile;
 end;

 procedure PetitCerclePair;
  { Cercle inscrit dans un huitième de motif en direction S, W, N, E }
 begin
  phtg; Sauter(3); Cercle(2, 1); pdt; Sauter(3); p3htg;
 end;
 
 procedure EtoilePaire;
  { Huitième de motif en direction S, W, N, E }
 begin
  phtd; av; PetitCerclePair; DemiEtoile; av; phtg; av; pdt; lc; av; 
  avf(3); pdt; bc; av;
  phtg; av; DemiEtoile; av; p3htd; avf(2);
 end;
 
 procedure PetitCercleImpair;
  { Cercle inscrit dans un huitième de motif en direction SO, NW, }
  { NE, SE }
 begin
  phtg; Sauter(2); phtg; Cercle(2, 1); phtd; pdt; Sauter(2); p3htg;
 end;
 
 procedure EtoileImpaire;
  { Huitième de motif en direction SO, NW, NE, SE }
 begin
  phtd; av; PetitCercleImpair; DemiEtoile; av; p3htd; lc; av; p3htd;
  bc; av; DemiEtoile; av; p3htd; av;
 end;
 
 procedure Motif;
  { Motif composé de 2 étoiles (S, SW) ou (W, NW) ou  (N, NE) ou }
  { (E, SE) }
 begin
  EtoilePaire;
  avf(3); phtd; avf(4); pqtd;
  EtoileImpaire;
  avf(3); phtd; avf(5); pqtd;
 end;
 
 var I : integer;

begin

 lg(TailleGrille);
 eb; pn; lc; avf(2); bc;
 ec(EpaisseurGrosTraits);
 { Petit octogone et son motif intérieur }
 for I := 1 to 4 do 
  begin 
   Motif; 
  end;
 { Rejoindre le centre des cercles concentriques }
 pqtd; av; pqtg; Sauter(11);
 { Cercles concentriques }
 Cercle(3, 1);

 st;
 
end.
