{$mode macpas} program CodeTelegrapheDeChappe;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Alphabet du télégraphe optique de Chappe, page 211. *}
 {*                                                     *}
 {*******************************************************}

 const
  EpaisseurSignal = 2;
  TailleGrille = 5; 
  LongueurBras = 5; { Longueur d'un bras articulé }
  Diagonale  = 4; { taille de la grille pour un bras en diagonale }
  
  { Position des bras extrêmes }
  Nord = 1;
  NordEst = 2;
  Est = 3;
  SudEst = 4;
  Sud = 5;
  SudOuest = 6;
  Ouest = 7;
  NordOuest = 8;
  { Position du bras central }
  S_N = 1;
  SW_NE = 2;
  W_E = 3;
  NW_SE = 4;
  
 procedure Code(C : string);
 begin
  { Rectangle autour du signal }
  lg(TailleGrille); ec(1); 
  pe; avf(6); pn; avf(9); pw; avf(6); ps; avf(9); 
  translater(3, 1); ecrire(C); translater(0, 5); ec(EpaisseurSignal);
 end;
 
 procedure Effacer;
 begin
  lg(TailleGrille); translater(3, -6);
 end;
 
 procedure ChappeCote(D : integer);
 begin
  if (D = Nord) then
   begin pn; lg(LongueurBras); av; translater(0, -1); end
  else if (D = NordEst) then
   begin pne; lg(Diagonale); av; translater(-1, -1); end
  else if (D = Est) then
   begin pe; lg(LongueurBras); av; translater(-1, 0); end
  else if (D = SudEst) then
   begin pse; lg(Diagonale); av; translater(-1, 1); end
  else if (D = Sud) then
   begin ps; lg(LongueurBras); av; translater(0, 1); end
  else if (D = SudOuest) then
   begin psw; lg(Diagonale); av; translater(1, 1); end
  else if (D = Ouest) then
   begin pw; lg(LongueurBras); av; translater(1, 0); end
  else if (D = NordOuest) then
   begin pnw; lg(Diagonale); av; translater(1, -1); end;
 end;
 
 procedure Chappe(G : integer; M : integer; D : integer);
 begin
  if (M = S_N) then
   begin
    ps; lg(LongueurBras); av; ChappeCote(G); lg(LongueurBras); translater(0, 1); 
    pn; lg(LongueurBras); av; ChappeCote(D); lg(LongueurBras); translater(0, -1); 
   end
  else if (M = SW_NE) then
   begin
    psw; lg(Diagonale); av; ChappeCote(G); lg(Diagonale); translater(1, 1); 
    pne; lg(Diagonale); av; ChappeCote(D); lg(Diagonale); translater(-1, -1); 
   end
  else if (M = W_E) then
   begin
    pw; lg(LongueurBras); av; ChappeCote(G); lg(LongueurBras); translater(1, 0); 
    pe; lg(LongueurBras); av; ChappeCote(D); lg(LongueurBras); translater(-1, 0); 
   end
  else if (M = NW_SE) then
   begin
    
    pnw; lg(Diagonale); av; ChappeCote(G); lg(Diagonale); translater(1, -1);  
    pse; lg(Diagonale); av; ChappeCote(D); lg(Diagonale); translater(-1, 1); 
   end;
  pn;
  Effacer;
 end;
 
 { Lettres }
 procedure Am; begin Code('A'); Chappe(Nord, W_E, NordEst); end;
 procedure a;  begin Code('a'); Chappe(NordOuest, W_E, Nord); end;
 procedure Bm; begin Code('B'); Chappe(SudOuest, SW_NE, NordOuest); end;
 procedure b;  begin Code('b'); Chappe(NordEst, NW_SE, SudEst); end;
 procedure Cm; begin Code('C'); Chappe(Sud, W_E, Sud); end;
 procedure c;  begin Code('c'); Chappe(Nord, W_E, Nord); end;
 procedure Dm; begin Code('D'); Chappe(Nord, SW_NE, NordEst); end;
 procedure d;  begin Code('d'); Chappe(NordOuest, NW_SE, Nord); end;
 procedure Em; begin Code('E'); Chappe(Est, S_N, Est); end;
 procedure e;  begin Code('e'); Chappe(Ouest, S_N, Ouest); end;
 procedure Fm; begin Code('F'); Chappe(Nord, W_E, NordEst); end;
 procedure f;  begin Code('f'); Chappe(Nord, W_E, NordOuest); end;
 procedure Gm; begin Code('G'); Chappe(Nord, NW_SE, Nord); end;
 procedure g;  begin Code('g'); Chappe(Nord, SW_NE, Nord); end;
 procedure Hm; begin Code('H'); Chappe(Ouest, S_N, Est); end;
 procedure h;  begin Code('h'); Chappe(Est, S_N, Ouest); end;
 procedure Im; begin Code('I'); Chappe(Sud, S_N, SudEst); end;
 procedure i;  begin Code('i'); Chappe(Sud, S_N, SudOuest); end;
 procedure Jm; begin Code('J'); Chappe(SudOuest, W_E, SudEst); end;
 procedure j;  begin Code('j'); Chappe(NordOuest, W_E, NordEst); end;
 procedure Km; begin Code('K'); Chappe(Sud, S_N, Est); end;
 procedure k;  begin Code('k'); Chappe(Sud, S_N, Ouest); end;
 procedure Lm; begin Code('L'); Chappe(Est, S_N, Nord); end;
 procedure l;  begin Code('l'); Chappe(Ouest, S_N, Nord); end;
 procedure Mm; begin Code('M'); Chappe(Nord, SW_NE, SudEst); end;
 procedure m;  begin Code('m'); Chappe(SudOuest, NW_SE, Nord); end;
 procedure Nm; begin Code('N'); Chappe(Sud, NW_SE, NordEst); end;
 procedure n;  begin Code('n'); Chappe(NordOuest, SW_NE, Sud); end;
 procedure Om; begin Code('O'); Chappe(Nord, NW_SE, Est); end;
 procedure o;  begin Code('o'); Chappe(Ouest, SW_NE, Nord); end;
 procedure Pm; begin Code('P'); Chappe(NordOuest, NW_SE, SudOuest); end;
 procedure p;  begin Code('p'); Chappe(SudEst, SW_NE, NordEst); end;
 procedure Qm; begin Code('Q'); Chappe(Est, S_N, NordOuest); end;
 procedure q;  begin Code('q'); Chappe(Ouest, S_N, NordEst); end;
 procedure Rm; begin Code('R'); Chappe(Sud, S_N, Est); end;
 procedure r;  begin Code('r'); Chappe(Sud, S_N, Ouest); end;
 procedure Sm; begin Code('S'); Chappe(NordEst, NW_SE, SudOuest); end;
 procedure s;  begin Code('s'); Chappe(SudEst,  SW_NE, NordOuest); end;
 procedure Tm; begin Code('T'); Chappe(SudOuest, SW_NE, Sud); end;
 procedure t;  begin Code('t'); Chappe(Sud, NW_SE, SudEst); end;
 procedure Um; begin Code('U'); Chappe(Sud, NW_SE, Ouest); end;
 procedure u;  begin Code('u'); Chappe(Est, SW_NE, Sud); end;
 procedure Vm; begin Code('V'); Chappe(Sud, W_E, SudOuest); end;
 procedure v;  begin Code('v'); Chappe(SudEst, W_E, Sud); end;
 procedure Wm; begin Code('W'); Chappe(SudOuest, NW_SE, SudOuest); end;
 procedure w;  begin Code('w'); Chappe(SudEst, SW_NE, SudEst); end;
 procedure Xm; begin Code('X'); Chappe(NordOuest, SW_NE, Ouest); end;
 procedure x;  begin Code('x'); Chappe(Est, NW_SE, NordEst); end;
 procedure Ym; begin Code('Y'); Chappe(Sud, SW_NE, Sud); end;
 procedure y;  begin Code('y'); Chappe(Sud, NW_SE, Sud); end;
 procedure Zm; begin Code('Z'); Chappe(NordOuest, SW_NE, NordOuest); end;
 procedure z;  begin Code('z'); Chappe(NordEst, NW_SE, NordEst); end;
 { Chiffres }
 procedure c0;  begin Code('0'); Chappe(SudEst, W_E, Nord); end;
 procedure c1;  begin Code('1'); Chappe(Ouest, W_E, Est); end;
 procedure c2;  begin Code('2'); Chappe(Sud, S_N, Nord); end;
 procedure c3;  begin Code('3'); Chappe(Sud, S_N, NordEst); end;
 procedure c4;  begin Code('4'); Chappe(NordEst, W_E, NordOuest); end;
 procedure c5;  begin Code('5'); Chappe(NordEst, W_E, Sud); end;
 procedure c6;  begin Code('6'); Chappe(Sud, NW_SE, SudOuest); end;
 procedure c7;  begin Code('7'); Chappe(SudEst, SW_NE, Sud); end;
 procedure c8;  begin Code('8'); Chappe(SudEst, W_E, SudOuest); end;
 procedure c9;  begin Code('9'); Chappe(Nord, SW_NE, NordOuest); end;
 { Ponctuation }
 procedure Pt;  begin Code('.'); Chappe(Sud, S_N, Ouest); end;
 procedure Vg;  begin Code(','); Chappe(NordOuest, W_E, Est); end;
 procedure Pv;  begin Code(';'); Chappe(Ouest, W_E, NordEst); end;
 procedure Dp;  begin Code(':'); Chappe(Sud, S_N, Est); end;
 procedure Pi;  begin Code('?'); Chappe(SudOuest, W_E, NordEst); end;
 procedure Pe;  begin Code('!'); Chappe(NordOuest, W_E, SudEst); end;
 procedure Pg;  begin Code('('); Chappe(Ouest, S_N, Nord); end;
 procedure Pd;  begin Code(')'); Chappe(Est, S_N, Nord); end;
 procedure Bl;  begin Code(' '); Chappe(Nord, NW_SE, Nord); end;
 
 procedure AlaLigne;
 begin
  lg(TailleGrille); ag; translater(0, -9);
 end;

begin
 PoliceTexte(geneva); TailleTexte(9); lg(1); eh; AlaLigne; 
 Am; a; Bm; b; Cm; c; Dm; d; Em; e; Fm; f; AlaLigne; 
 Gm; g; Hm; h; Im; i; Jm; j; Km; k; Lm; l; AlaLigne; 
 Mm; m; Nm; n; Om; o; Pm; p; Qm; q; Rm; r; AlaLigne; 
 Sm; s; Tm; t; Um; u; Vm; v; Wm; w; Xm; x; AlaLigne; 
 Ym; y; Zm; z; c0; c1; c2; c3; c4; c5; c6; c7; AlaLigne; 
 c8; c9; Pt; Vg; Pv; Dp; Pi; Pe; Pg; Pd; st; 
end. 