{$mode macpas} program Alphabet;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Alphabet (en lettres majuscules), page 8.           *}
 {*                                                     *}
 {*******************************************************}

 procedure Av5fois;
  { Avancer tout droit 5 fois avec le crayon levé }
 begin
  lc; av; av; av; av; av; 
 end;

 procedure L1;
  { Se placer au début de la première ligne }
 begin
  eh; ag; ps; Av5fois; pn;
 end;

 procedure L2;
  { Se placer au début de la deuxième ligne }
 begin
  eh; ag; ps; Av5fois; Av5fois; pn;
 end;

 procedure L3;
  { Se placer au début de la troisième ligne }
 begin
  eh; ag; ps; Av5fois; Av5fois; Av5fois; pn;
 end;

 procedure L4;
  { Se placer au début de la quatrième ligne }
 begin
  eh; ag; ps; Av5fois; Av5fois; Av5fois; Av5fois; pn;
 end;

 procedure A;
  { Dessiner la lettre A }
 begin
  bc; av; av; pqtd; av; av; pdt; av; av; pqtd; av; vd; vd; av; av; av; lc; pqtg; av; pqtg;
 end;

 procedure B;
  { Dessiner la lettre B }
 begin
  bc; av; av; av; av; pqtd; av; vd; vd; av; pdt; av; vd; vd; av; pdt; lc; av; av; av; pqtg;
 end;

 procedure C;
  { Dessiner la lettre C }
 begin
  lc; pqtd; av; vg; pdt; bc; vd; vd; av; av; vd; vd; lc; av; av; av; pqtg; av; pqtg;
 end;

 procedure D;
  { Dessiner la lettre D }
 begin
  bc; av; av; av; av; pqtd; av; vd; av; av; vd; av; lc; pdt; av; av; av; pqtg;
 end;

 procedure E;
  { Dessiner la lettre E }
 begin
  bc; pqtd; av; av; pdt; av; av; pqtd; av; av; pqtd; av; pdt; av; pqtd; av; av; pqtd; av; 
  av; lc; pqtd; av; av; av; av; pqtg; av; pqtg;
 end;

 procedure F;
  { Dessiner la lettre F }
 begin
  bc; av; av; pqtd; av; pdt; av; pqtd; av; av; pqtd; av; av; lc; pqtd; av; av; av; vg; pqtg;
 end;

 procedure G;
  { Dessiner la lettre G }
 begin
  lc; av; av; pqtd; av; bc; av; pqtd; av; vd; vd; av; av; vd; vd; lc; av; av; vg; pqtg; 
 end;

 procedure H;
  { Dessiner la lettre H }
 begin
  bc; av; av; pqtd; av; av; pdt; av; av; pqtd; av; av; lc; pqtd; av; av; pqtd; bc; av; av; av; av; lc; pqtg; av; pqtg; 
 end;

 procedure I;
  { Dessiner la lettre I }
 begin
  bc; pqtd; av; av; pdt; av; pqtd; av; av; av; av; pqtg; av; pdt; av; av; lc; pqtd; av; av; av; vg; pqtg; 
 end;

 procedure J;
  { Dessiner la lettre J }
 begin
  lc; av; av; av; av; pqtd; bc; av; av; pqtd; av; av; av; vd; vd; lc; pdt; vg; av; av; pqtg;
 end;

 procedure K;
  { Dessiner la lettre K }
 begin
  bc; av; av; av; av; pdt; av; av; pqtg; vg; vd; pdt; vg; vd; pdt; vd; vg; lc; av; pqtg;
 end;

 procedure L;
  { Dessiner la lettre L }
 begin
  bc; av; av; av; av; pdt; av; av; av; av; pqtg; av; av; lc; av; pqtg; 
 end;

 procedure M;
  { Dessiner la lettre M }
 begin
  bc; av; av; av; av; pdt; vg; vg; pdt; av; av; av; av; lc; pqtg; av; pqtg;
 end;

 procedure N;
  { Dessiner la lettre N }
 begin
  bc; av; av; av; av; pqtd; vd; vg; pqtg; av; av; pdt; av; av; av; av; lc; pqtg; av; pqtg;
 end;

 procedure O;
  { Dessiner la lettre O }
 begin
  lc; pqtd; av; pdt; bc; vd; av; av; vd; vd; av; av; vd; lc; pdt; av; av; pqtg;
 end;

 procedure P;
  { Dessiner la lettre P }
 begin
  bc; av; av; av; av; pqtd; av; vd; vd; av; lc; pdt; av; av; av; pqtd; av; av; pdt; 
 end;

 procedure Q;
  { Dessiner la lettre Q }
 begin
  lc; pqtd; av; pqtg; av; pdt; bc; vg; pdt; lc; av; bc; vd; av; av; vd; vd; av; av; vd; lc; pdt; av; av; pqtg;
 end;

 procedure R;
  { Dessiner la lettre R }
 begin
  bc; av; av; av; av; pqtd; av; vd; vd; av; pdt; av; vd; av; lc; pqtg; av; pqtg;
 end;

 procedure S;
  { Dessiner la lettre S }
 begin
  lc; av; pdt; bc; vg; vg; vg; vd; vd; vd; lc; av; av; vg; pqtg; 
 end;

 procedure T;
  { Dessiner la lettre T }
 begin
  lc; pqtd; av; pqtg; bc; av; av; av; av; pqtg; av; pdt; av; av; lc; pqtd; av; av; av; vg; pqtg; 
 end;

 procedure U;
  { Dessiner la lettre U }
 begin
  lc; av; bc; av; av; av; pdt; av; av; av; vg; vg; av; av; av; lc; pdt; av; av; av; vg; pqtg;
 end;

 procedure V;
  { Dessiner la lettre V }
 begin
  lc; av; bc; av; av; av; pdt; av; av; av; pqtg; vd; pdt; vd; pqtg; av; av; av; pdt; av; av; av; lc; vg; pqtg;
 end;

 procedure W;
  { Dessiner la lettre W }
 begin
  bc; av; av; av; av; pdt; av; av; av; av; pqtg; vg; av; av; pdt; av; av; vg; pqtg; av; av; av; 
  av; pdt; av; av; av; av; lc; pqtg; av; pqtg;
 end;

 procedure X;
  { Dessiner la lettre X }
 begin
  bc; av; vd; vg; av; lc; pqtg; av; av; pqtg; bc; av; vg; vd; av; lc; pqtg; av; pqtg;
 end;

 procedure Y;
  { Dessiner la lettre Y }
 begin
  lc; av; pdt; bc; vg; vg; av; av; av; pdt; av; vd; vd; av; lc; pqtd; av; av; av; pqtd; av; av; av; av; pdt; 
 end;

 procedure Z;
  { Dessiner la lettre Z }
 begin
  bc; pqtd; av; av; pdt; av; av; pqtd; av; vd; vg; av; pqtg; av; av; lc; pdt; av; av; pqtd; av; av; av; vg; pqtg; 
 end;

 
begin {Alphabet}

 L1; A; B; C; D; E; F; G;
 L2; H; I; J; K; L; M; N;
 L3; O; P; Q; R; S; T; U;
 L4; V; W; X; Y; Z;
 st; 
end. {Alphabet}