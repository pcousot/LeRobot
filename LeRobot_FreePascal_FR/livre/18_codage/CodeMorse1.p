{$mode macpas} program CodeMorse1;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Code Morse, page 209, 212-214.                      *}
 {*                                                     *}
 {*******************************************************}

 procedure ALaLigne; { Passer au debut de la ligne suivante. }
 begin lc; ag; ps; av; pe; av; bc; end;
  
 procedure Pt; { Point } begin dp; bip; lc; av; bc; delai(0.1); end;
 
 procedure Bl; { Blanc } begin lc; av; bc; delai(0.1); end;
 
 procedure Tr; { Trait } begin av; biiip; lc; av; bc; delai(0.1); end;
 
 { Alphabet }
 procedure A; begin Pt; Tr; Bl; end;
 procedure B; begin Tr; Pt; Pt; Pt; Bl; end;
 procedure C; begin Tr; Pt; Tr; Pt; Bl; end;
 procedure D; begin Tr; Pt; Pt; Bl; end;
 procedure E; begin Pt; Bl; end;
 procedure F; begin Pt; Pt; Tr; Pt; Bl; end;
 procedure G; begin Tr; Tr; Pt; Bl; end;
 procedure H; begin Pt; Pt; Pt; Pt; Bl; end;
 procedure I; begin Pt; Pt; Bl; end;
 procedure J; begin Pt; Tr; Tr; Tr; Bl; end;
 procedure K; begin Tr; Pt; Tr; Bl; end;
 procedure L; begin Pt; Tr; Pt; Pt; Bl; end;
 procedure M; begin Tr; Tr; Bl; end;
 procedure N; begin Tr; Pt; Bl; end;
 procedure O; begin Tr; Tr; Tr; Bl; end;
 procedure P; begin Pt; Tr; Tr; Pt; Bl; end;
 procedure Q; begin Tr; Tr; Pt; Tr; Bl; end;
 procedure R; begin Pt; Tr; Pt; Bl; end;
 procedure S; begin Pt; Pt; Pt; Bl; end;
 procedure T; begin Tr; Bl; end;
 procedure U; begin Pt; Pt; Tr; Bl; end;
 procedure V; begin Pt; Pt; Pt; Tr; Bl; end;
 procedure W; begin Pt; Tr; Tr; Bl; end;
 procedure X; begin Tr; Pt; Pt; Tr; Bl; end;
 procedure Y; begin Tr; Pt; Tr; Tr; Bl; end;
 procedure Z; begin Tr; Tr; Pt; Pt; Bl; end;
 
 { Chiffres }
 procedure C1; begin Pt; Tr; Tr; Tr; Tr; Bl; end; 
 procedure C2; begin Pt; Pt; Tr; Tr; Tr; Bl; end; 
 procedure C3; begin Pt; Pt; Pt; Tr; Tr; Bl; end; 
 procedure C4; begin Pt; Pt; Pt; Pt; Tr; Bl; end;
 procedure C5; begin Pt; Pt; Pt; Pt; Pt; Bl; end;
 procedure C6; begin Tr; Pt; Pt; Pt; Pt; Bl; end; 
 procedure C7; begin Tr; Tr; Pt; Pt; Pt; Bl; end; 
 procedure C8; begin Tr; Tr; Tr; Pt; Pt; Bl; end;
 procedure C9; begin Tr; Tr; Tr; Tr; Pt; Bl; end; 
 procedure C0; begin Tr; Tr; Tr; Tr; Tr; Bl; end;
 
 procedure Po; { Point } begin Pt; Pt; Pt; Pt; Pt; Pt; Bl; end;
 procedure Vg; { Virgule } begin Pt; Tr; Pt; Tr; Pt; Tr; Bl; end;
 procedure Pv; { Point-virgule } 
  begin Tr; Tr; Tr; Pt; Pt; Pt; Bl; end;
 procedure Dp; { Deux-points } begin Tr; Pt; Tr; Pt; Tr; Pt; Bl; end;
 procedure Pi; { Point d'interrogation } 
  begin Pt; Pt; Tr; Tr; Pt; Pt; Bl; end;
 procedure Pe; { Point d'exclamation } 
  begin Tr; Tr; Pt; Pt; Tr; Tr; Bl; end;
 procedure Tu; { Trait d'union } 
  begin Tr; Pt; Pt; Pt; Pt; Tr; Bl; end;
 procedure Ap; { Apostrosphe } begin Tr; Tr; Tr; Tr; Bl; end;
 procedure Di; { Barre de division } 
  begin Tr; Tr; Tr; Tr; Tr; Tr; Bl; end;
 procedure Fm; { Fin de mot } begin lc; av; bc; delai(0.6); end;
 
 procedure Erreur; 
 begin Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Bl; end;
 
 procedure DebutTransmission;
 begin ec(2); eh; ALaLigne; Tr; Pt; Tr; Pt; Tr; Pt; Tr; Bl; end;
 
 procedure FinTransmission; begin Pt; Tr; Pt; Tr; Pt; Tr; Pt; Bl; end;

begin
 DebutTransmission;
 A; B; C; D; E; ALaLigne; F; G; H; I; J; K; L; ALaLigne;
 M; N; O; P; Q; R; S; ALaLigne; T; U; V; W; X; Y; ALaLigne;
 Z; C1; C2; C3; ALaLigne; C4; C5; C6; C7; C8; ALaLigne;
 C9; C0; Po; Vg; ALaLigne; Pv; Dp; Pi; Pe; ALaLigne;
 Tu; Ap; Di; ALaLigne; Erreur; FinTransmission; st;
end.

