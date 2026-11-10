{$mode macpas} program CodeMorse2;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Code Morse, page 209, 212-214.                      *}
 {*                                                     *}
 {*******************************************************}

 procedure ALaLigne;
  { Passer au debut de la ligne suivante. }
 begin lc; ag; ps; av; pe; av; bc; end;
 
 procedure TesTAvancer(N : integer);
  { Tester s'il est  possible d'avancer N fois sans toucher le bord. }
  var I : integer;
 begin
  { Essayer d'avancer (N - 1) fois sans toucher le bord }
  lc; 
  for I := 1 to (N - 1) do
   begin
    if (not tb) then
     begin
      av;
     end;
   end;
  if tb then { Le bord est-il touché ? } 
   begin { Oui, le Nème 'av' sort du cadre, passer au debut de la }
    { ligne suivante. }
    ALaLigne;
   end
  else
   begin { Non, revenir au point de départ dans la ligne courante. }
    avf(-(N - 1));
   end;
  bc; 
 end;
 
 procedure Pt; { Point }
 begin TestAvancer(1); dp; bip; lc; av; bc; delai(0.2); end;
 
 procedure Bl; { Blanc }
 begin TestAvancer(1); lc; av; bc; delai(0.2); end;
 
 procedure Tr; { Trait }
 begin TesTAvancer(2); av; biiip; lc; av; bc; delai(0.2); end;
 
 procedure TestFinDeLigne(P : integer; T : integer; B : integer);
  { Tester qu'un symbole de P points, T traits et B blancs }
  { tient sur la ligne courante, sinon passer à la ligne.  }
 begin
  TestAvancer(P + (2 * T) + B);
 end;
 
 { Alphabet }
 
 procedure A; begin TestFinDeLigne(1, 1, 1); Pt; Tr; Bl; end;
 procedure B; begin TestFinDeLigne(3, 1, 1); Tr; Pt; Pt; Pt; Bl; end;
 procedure C; begin TestFinDeLigne(2, 2, 1); Tr; Pt; Tr; Pt; Bl; end;
 procedure D; begin TestFinDeLigne(2, 1, 1); Tr; Pt; Pt; Bl; end;
 procedure E; begin TestFinDeLigne(1, 0, 1); Pt; Bl; end;
 procedure F; begin TestFinDeLigne(3, 1, 1); Pt; Pt; Tr; Pt; Bl; end;
 procedure G; begin TestFinDeLigne(1, 2, 1); Tr; Tr; Pt; Bl; end;
 procedure H; begin TestFinDeLigne(4, 0, 1); Pt; Pt; Pt; Pt; Bl; end;
 procedure I; begin TestFinDeLigne(2, 0, 1); Pt; Pt; Bl; end;
 procedure J; begin TestFinDeLigne(1, 3, 1); Pt; Tr; Tr; Tr; Bl; end;
 procedure K; begin TestFinDeLigne(1, 2, 1); Tr; Pt; Tr; Bl; end;
 procedure L; begin TestFinDeLigne(3, 1, 1); Pt; Tr; Pt; Pt; Bl; end;
 procedure M; begin TestFinDeLigne(0, 2, 1); Tr; Tr; Bl; end;
 procedure N; begin TestFinDeLigne(1, 1, 1); Tr; Pt; Bl; end;
 procedure O; begin TestFinDeLigne(0, 3, 1); Tr; Tr; Tr; Bl; end;
 procedure P; begin TestFinDeLigne(2, 2, 1); Pt; Tr; Tr; Pt; Bl; end;
 procedure Q; begin TestFinDeLigne(3, 1, 1); Tr; Tr; Pt; Tr; Bl; end;
 procedure R; begin TestFinDeLigne(2, 1, 1); Pt; Tr; Pt; Bl; end;
 procedure S; begin TestFinDeLigne(3, 0, 1); Pt; Pt; Pt; Bl; end;
 procedure T; begin TestFinDeLigne(0, 1, 1); Tr; Bl; end;
 procedure U; begin TestFinDeLigne(2, 1, 1); Pt; Pt; Tr; Bl; end;
 procedure V; begin TestFinDeLigne(3, 1, 1); Pt; Pt; Pt; Tr; Bl; end;
 procedure W; begin TestFinDeLigne(1, 2, 1); Pt; Tr; Tr; Bl; end;
 procedure X; begin TestFinDeLigne(2, 2, 1); Tr; Pt; Pt; Tr; Bl; end;
 procedure Y; begin TestFinDeLigne(1, 2, 1); Tr; Pt; Tr; Tr; Bl; end;
 procedure Z; begin TestFinDeLigne(2, 2, 1); Tr; Tr; Pt; Pt; Bl; end;
 
 { chiffres }
 
 procedure C1; begin TestFinDeLigne(1, 4, 1); Pt; Tr; Tr; Tr; Tr; Bl; end; 
 procedure C2; begin TestFinDeLigne(2, 3, 1); Pt; Pt; Tr; Tr; Tr; Bl; end; 
 procedure C3; begin TestFinDeLigne(2, 3, 1); Pt; Pt; Pt; Tr; Tr; Bl; end; 
 procedure C4; begin TestFinDeLigne(4, 1, 1); Pt; Pt; Pt; Pt; Tr; Bl; end;
 procedure C5; begin TestFinDeLigne(5, 0, 1); Pt; Pt; Pt; Pt; Pt; Bl; end;
 procedure C6; begin TestFinDeLigne(4, 1, 1); Tr; Pt; Pt; Pt; Pt; Bl; end; 
 procedure C7; begin TestFinDeLigne(3, 2, 1); Tr; Tr; Pt; Pt; Pt; Bl; end; 
 procedure C8; begin TestFinDeLigne(2, 3, 1); Tr; Tr; Tr; Pt; Pt; Bl; end;
 procedure C9; begin TestFinDeLigne(1, 4, 1); Tr; Tr; Tr; Tr; Pt; Bl; end; 
 procedure C0; begin TestFinDeLigne(5, 0, 1); Tr; Tr; Tr; Tr; Tr; Bl; end;
 
 procedure Po; { Point } 
  begin TestFinDeLigne(6, 0, 1); Pt; Pt; Pt; Pt; Pt; Pt; Bl; end;
 procedure Vg; { Virgule } 
  begin TestFinDeLigne(3, 3, 1); Pt; Tr; Pt; Tr; Pt; Tr; Bl; end;
 procedure Pv; { Point-virgule } 
  begin TestFinDeLigne(3, 3, 1); Tr; Tr; Tr; Pt; Pt; Pt; Bl; end;
 procedure Dp; { Deux-points }
  begin TestFinDeLigne(3, 3, 1); Tr; Pt; Tr; Pt; Tr; Pt; Bl; end;
 procedure Pi; { Point d'interrogation } 
  begin TestFinDeLigne(4, 2, 1); Pt; Pt; Tr; Tr; Pt; Pt; Bl; end;
 procedure Pe; { Point d'exclamation } 
  begin TestFinDeLigne(2, 4, 1); Tr; Tr; Pt; Pt; Tr; Tr; Bl; end;
 procedure Tu; { Trait d'union } 
  begin TestFinDeLigne(4, 5, 1); Tr; Pt; Pt; Pt; Pt; Tr; Bl; end;
 procedure Ap; { Apostrosphe }
  begin TestFinDeLigne(0, 4, 1); Tr; Tr; Tr; Tr; Bl; end;
 procedure Di; { Barre de division } 
  begin TestFinDeLigne(0, 6, 1); Tr; Tr; Tr; Tr; Tr; Tr; Bl; end;
 procedure Fm; { Fin de mot } 
  begin TestFinDeLigne(0, 0, 1); lc; av; bc; delai(0.6); end; 
 procedure Erreur;
  begin TestFinDeLigne(11, 0, 1); Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Pt; Bl; end; 
 procedure DebutTransmission;
  begin TestFinDeLigne(4, 3, 1); Tr; Pt; Tr; Pt; Tr; Pt; Tr; Bl; end; 
 procedure FinTransmission;
  begin TestFinDeLigne(4, 3, 1); Pt; Tr; Pt; Tr; Pt; Tr; Pt; Bl; end;

begin
 ec(2); eh; ALaLigne;
 DebutTransmission;
 A; B; C; D; E; F; G; H; I; J; K; L; M; N; O; P; Q; R; S; T; U; V; W; X; Y; Z;
 C1; C2; C3; C4; C5; C6; C7; C8; C9; C0;
 Po; Vg; Pv; Dp; Pi; Pe; Tu; Ap; Di; Erreur;
 FinTransmission;
 st;
end.