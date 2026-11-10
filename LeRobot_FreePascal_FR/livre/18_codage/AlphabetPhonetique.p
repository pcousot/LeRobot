{$mode macpas} program AlphabetPhonetique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Alphabet phonétique international, page 211.        *}
 {* Exercice 34, page 210.                              *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleGrille = 3;
  Interligne = 3;
  EspaceEntreMots = 2;
 
 procedure ALaLigne (N : integer);
  { Passer à la ligne s'il n'y a plus la place pour écrire un mot }
  { de N lettres de l'alphabet dans un rectangle (2 x 4) espacées }
  { de 1 sur la ligne courante.                                   }
  var I : integer;
 begin
  pe;
  { Essayer de sauter 3 espaces par lettre plus un à la fin du mot }
  { de N lettres.                                                  }
  for I := 1 to ((3 * N) + 1) do 
   begin                           
    if (not tb) then
     begin
      translater(1, 0);
     end;
   end; 
   if tb then
    begin { Passer à la ligne,  pas de place sur la ligne courante. }
     ag; translater(0, -(4 + Interligne));
    end
   else
    begin { Revenir en arrière pour écrire sur la ligne courante }
     translater(-((3 * N) + 1), 0);
    end;
 end;

{ Ecrire les lettres de l'alphabet dans un rectangle (2 x 4) }

 procedure EcrireA;
  begin
  pn; avf(2); pqtd; avf(2);avf(-2); pqtg; av; vd; vd; avf(3); 
  translater(1, 0);
 end;

 procedure EcrireB;
 begin
  pn; avf(4); pqtd; av; vd; vd; av; pdt; av; vd; vd; av; 
  translater(3, 0);
 end;

 procedure EcrireC;
 begin
  translater(2, 1); ps; vd; vd; avf(2); vd; vd; translater(1, -3);
 end;

 procedure EcrireD;
 begin
  pn; avf(4); pqtd; av; vd; avf(2); vd; av; translater(3, 0);
 end;

 procedure EcrireE;
 begin
  pe; avf(2); avf(-2); pqtg; avf(2); pqtd; av; pdt; av; 
  pqtd; avf(2); pqtd; av; av; translater(1, -4);
 end;

 procedure EcrireF;
 begin
  pn; avf(2); pqtd; av; pdt; av; pqtd; avf(2); pqtd; avf(2);
  translater(1, -4);
 end;

 procedure EcrireG;
 begin
  translater(1, 2); pe; av; pqtd; av; vd; vd; avf(2); vd; vd; 
  translater(1, -3);
 end;

 procedure EcrireH;
 begin
  pn; avf(2); pqtd; avf(2); avf(-2); pqtg; avf(2); translater(2, -4);
  avf(4); translater(1, -4); 
 end;

 procedure EcrireI;
 begin
  pe; avf(2); pdt; av; pqtd; avf(4); pqtg; av; pdt; avf(2); 
  translater(1, -4);
 end;

 procedure EcrireJ;
 begin
  translater(0, 4); pe; avf(2); pqtd; avf(3); vd; vd;
  translater(3, -1);
 end;

 procedure EcrireK;
 begin
  pn; avf(4); translater(0, -2); pe; vg; vd; translater(-2, -2); 
  vd; vg; translater(1, 0); 
 end;

 procedure EcrireL;
 begin
  pn; avf(4); translater(0, -4); pe; avf(2); translater(1, 0);
 end;

 procedure EcrireM;
 begin
  pn; avf(4); pdt; vg; vg; pdt; avf(4); translater(1, 0);
 end;

 procedure EcrireN;
 begin
  pn; avf(4); pqtd; vd; vg; pqtg; avf(2); pdt; avf(4);
  translater(1, 0);
 end;

 procedure EcrireO;
 begin
  translater(1, 0); pw; vd; avf(2); vd; vd; avf(2); vd;
  translater(2, 0); 
 end;

 procedure EcrireP;
 begin
  pn; avf(4); pqtd; av; vd; vd; av; translater(3, -2); pdt; 
 end;

 procedure EcrireQ;
 begin
  translater(1, 1); ps; vg; translater(-1, 0); pw; vd; avf(2); 
  vd; vd; avf(2); vd; translater(2, 0);
 end;

 procedure EcrireR;
 begin
  pn; avf(4); pqtd; av; vd; vd; av; pdt; av; vd; av;
  translater(1, 0);
 end;

 procedure EcrireS;
 begin
  translater(0, 1); ps; vg; vg; vg; vd; vd; vd; translater(1, -3);
 end;

 procedure EcrireT;
 begin
  translater(1, 0); pn; avf(4); translater(-1, 0); pe; avf(2);
  translater(1, -4);
 end;

 procedure EcrireU;
 begin
  translater(0, 4); ps; avf(3); vg; vg; avf(3); translater(1, -4);
 end;

 procedure EcrireV;
 begin
  translater(0, 4); ps; avf(3); pqtg; vd; pdt; vd; pqtg; avf(3); 
  translater(1, -4); 
 end;

 procedure EcrireW;
 begin
  translater(0, 4); ps; avf(4); pqtg; vg; avf(2); pdt; avf(2); vg; 
  pqtg; avf(4); translater(1, -4);
 end;

 procedure EcrireX;
 begin
  pn; av; vd; vg; av; translater(-2, 0); ps; av; vg; vd; av; 
  translater(1, 0); 
 end;

 procedure EcrireY;
 begin
  translater(0, 4); ps; av; vg; vg; av; pdt; avf(3); vd; vd; 
  translater(3, -1);
 end;

 procedure EcrireZ;
 begin
  translater(0, 4); pe; avf(2); pqtd; av; vd; vg; av; pqtg; avf(2);
  translater(1, 0);
 end;
 
 procedure Espace;
  { Un espace supplémentaire entre chaque mot }
 begin
  translater(EspaceEntreMots, 0); 
 end;
 
 { Code international de l'alphabet par lecture phonétique }
 
 procedure A; { ALFA }
 begin
  ALaLigne(4); EcrireA; EcrireL; EcrireF; EcrireA; Espace;
 end;
 
 procedure B; { BRAVO }
 begin
  ALaLigne(5); EcrireB; EcrireR; EcrireA; EcrireV; EcrireO;  Espace;
 end;
 
 procedure C; { CHARLIE }
 begin
  ALaLigne(7); EcrireC; EcrireH; EcrireA; EcrireR; EcrireL; EcrireI;
  EcrireE; Espace;
 end;
 
 procedure D; { DELTA }
 begin
  ALaLigne(5); EcrireD; EcrireE; EcrireL; EcrireT; EcrireA; Espace;
 end;
 
 procedure E; { ECHO }
 begin
  ALaLigne(4); EcrireE; EcrireC; EcrireH; EcrireO; Espace;
 end;
 
 procedure F; { FOXTROT }
 begin
  ALaLigne(7); EcrireF; EcrireO; EcrireX; EcrireT; EcrireR; EcrireO;
  EcrireT; Espace;
 end;
 
 procedure G; { GOLF }
 begin
  ALaLigne(4); EcrireG; EcrireO; EcrireL; EcrireF; Espace;
 end;
 
 procedure H; { HOTEL }
 begin
  ALaLigne(5); EcrireH; EcrireO; EcrireT; EcrireE; EcrireL; Espace;
 end;
 
 procedure I; { INDIA }
 begin
  ALaLigne(5); EcrireI; EcrireN; EcrireD; EcrireI; EcrireA; Espace;
 end;
 
 procedure J; { JULIET }
 begin
  ALaLigne(6); EcrireJ; EcrireU; EcrireL; EcrireI; EcrireE; EcrireT;
  Espace;
 end;
 
 procedure K; { KILO }
 begin
  ALaLigne(4); EcrireK; EcrireI; EcrireL; EcrireO; Espace;
 end;
 
 procedure L; { LIMA }
 begin
  ALaLigne(4); EcrireL; EcrireI; EcrireM; EcrireA; Espace;
 end;
 
 procedure M; { MIKE }
 begin
  ALaLigne(4); EcrireM; EcrireI; EcrireK; EcrireE; Espace;
 end;
 
 procedure N; { NOVEMBER }
 begin
  ALaLigne(8); EcrireN; EcrireO; EcrireV; EcrireE; EcrireM; 
  EcrireB; EcrireE; EcrireR; Espace;
 end;
 
 procedure O; { OSCAR }
 begin
  ALaLigne(5); EcrireO; EcrireS; EcrireC; EcrireA; EcrireR; Espace;
 end;
 
 procedure P; { PAPA }
 begin
  ALaLigne(4); EcrireP; EcrireA; EcrireP; EcrireA; Espace;
 end;
 
 procedure Q; { QUEBEC }
 begin
  ALaLigne(6); EcrireQ; EcrireU; EcrireE; EcrireB; EcrireE; EcrireC;
  Espace;
 end;
 
 procedure R; { ROMEO }
 begin
  ALaLigne(5); EcrireR; EcrireO; EcrireM; EcrireE; EcrireO; Espace;
 end;
 
 procedure S; { SIERRA }
 begin
  ALaLigne(6); EcrireS; EcrireI; EcrireE; EcrireR; EcrireR; EcrireA;
  Espace;
 end;
 
 procedure T; { TANGO }
 begin
  ALaLigne(5); EcrireT; EcrireA; EcrireN; EcrireG; EcrireO; Espace;
 end;
 
 procedure U; { UNIFORM }
 begin
  ALaLigne(7); EcrireU; EcrireN; EcrireI; EcrireF; EcrireO; EcrireR;
  EcrireM; Espace;
 end;
 
 procedure V; { VICTOR }
 begin
  ALaLigne(6); EcrireV; EcrireI; EcrireC; EcrireT; EcrireO; EcrireR;
  Espace;
 end;
 
 procedure W; { WHISKEY }
 begin
  ALaLigne(7); EcrireW; EcrireH; EcrireI; EcrireS; EcrireK; EcrireE;
  EcrireY; Espace;
 end;
 
 procedure X; { XRAY }
 begin
  ALaLigne(4); EcrireX; EcrireR; EcrireA; EcrireY; Espace;
 end;
 
 procedure Y; { YANKEE }
 begin
  ALaLigne(6); EcrireY; EcrireA; EcrireN; EcrireK; EcrireE; EcrireE;
  Espace;
 end;
 
 procedure Z; { ZULU }
 begin
  ALaLigne(4); EcrireZ; EcrireU; EcrireL; EcrireU; Espace;
 end;
 
begin
 lg(TailleGrille); eh; ag; translater(0, -(4 + Interligne));
 A; B; C; D; E; F; G; H; I; J; K; L; M; N; O; P; Q; R; S; T; U; V;
 W; X; Y; Z; st;
end.