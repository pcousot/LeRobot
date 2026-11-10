{$mode macpas} program TelegrapheDeChappeTraduit;
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
  DureeSignal = 1.5; { secondes pour voir un signal }
  LongueurBras = 60; { Longueur d'un bras articulé }
  Diagonale  = 42; { taille de la grille pour un bras en diagonale }
  
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
  
 procedure Effacer;
 begin
  delai(DureeSignal); cf(blanc); lg (60); ec(6);
 end;
 
 procedure ChappeCote(D : integer);
 begin
  if (D = Nord) then
   begin pn; lg(LongueurBras); end
  else if (D = NordEst) then
   begin pne; lg(Diagonale); end
  else if (D = Est) then
   begin pe; lg(LongueurBras); end
  else if (D = SudEst) then
   begin pse; lg(Diagonale); end
  else if (D = Sud) then
   begin ps; lg(LongueurBras); end
  else if (D = SudOuest) then
   begin psw; lg(Diagonale); end
  else if (D = Ouest) then
   begin pw; lg(LongueurBras); end
  else if (D = NordOuest) then
   begin pnw; lg(Diagonale); end;
  av; 
 end;
 
 procedure Chappe(G : integer; M : integer; D : integer);
 begin
  if (M = S_N) then
   begin
    ce; ps; lg(LongueurBras); av; ChappeCote(G); 
    ce; pn; lg(LongueurBras); av; ChappeCote(D);
   end
  else if (M = SW_NE) then
   begin
    ce; psw; lg(Diagonale); av; ChappeCote(G); 
    ce; pne; lg(Diagonale); av; ChappeCote(D);
   end
  else if (M = W_E) then
   begin
    ce; pw; lg(LongueurBras); av; ChappeCote(G); 
    ce; pe; lg(LongueurBras); av; ChappeCote(D);
   end
  else if (M = NW_SE) then
   begin
    ce; 
    pnw; lg(Diagonale); av; ChappeCote(G); 
    ce; pse; lg(Diagonale); av; ChappeCote(D);
   end;
  ce; pn;
  Effacer;
 end;
 
 { Lettres }
 procedure Am; begin message('A'); Chappe(Nord, W_E, NordEst); end;
 procedure a;  begin message('a'); Chappe(NordOuest, W_E, Nord); end;
 procedure Bm; begin message('B'); Chappe(SudOuest, SW_NE, NordOuest); end;
 procedure b;  begin message('b'); Chappe(NordEst, NW_SE, SudEst); end;
 procedure Cm; begin message('C'); Chappe(Sud, W_E, Sud); end;
 procedure c;  begin message('c'); Chappe(Nord, W_E, Nord); end;
 procedure Dm; begin message('D'); Chappe(Nord, SW_NE, NordEst); end;
 procedure d;  begin message('d'); Chappe(NordOuest, NW_SE, Nord); end;
 procedure Em; begin message('E'); Chappe(Est, S_N, Est); end;
 procedure e;  begin message('e'); Chappe(Ouest, S_N, Ouest); end;
 procedure Fm; begin message('F'); Chappe(Nord, W_E, NordEst); end;
 procedure f;  begin message('f'); Chappe(Nord, W_E, NordOuest); end;
 procedure Gm; begin message('G'); Chappe(Nord, NW_SE, Nord); end;
 procedure g;  begin message('g'); Chappe(Nord, SW_NE, Nord); end;
 procedure Hm; begin message('H'); Chappe(Ouest, S_N, Est); end;
 procedure h;  begin message('h'); Chappe(Est, S_N, Ouest); end;
 procedure Im; begin message('I'); Chappe(Sud, S_N, SudEst); end;
 procedure i;  begin message('i'); Chappe(Sud, S_N, SudOuest); end;
 procedure Jm; begin message('J'); Chappe(SudOuest, W_E, SudEst); end;
 procedure j;  begin message('j'); Chappe(NordOuest, W_E, NordEst); end;
 procedure Km; begin message('K'); Chappe(Sud, S_N, Est); end;
 procedure k;  begin message('k'); Chappe(Sud, S_N, Ouest); end;
 procedure Lm; begin message('L'); Chappe(Est, S_N, Nord); end;
 procedure l;  begin message('l'); Chappe(Ouest, S_N, Nord); end;
 procedure Mm; begin message('M'); Chappe(Nord, SW_NE, SudEst); end;
 procedure m;  begin message('m'); Chappe(SudOuest, NW_SE, Nord); end;
 procedure Nm; begin message('N'); Chappe(Sud, NW_SE, NordEst); end;
 procedure n;  begin message('n'); Chappe(NordOuest, SW_NE, Sud); end;
 procedure Om; begin message('O'); Chappe(Nord, NW_SE, Est); end;
 procedure o;  begin message('o'); Chappe(Ouest, SW_NE, Nord); end;
 procedure Pm; begin message('P'); Chappe(NordOuest, NW_SE, SudOuest); end;
 procedure p;  begin message('p'); Chappe(SudEst, SW_NE, NordEst); end;
 procedure Qm; begin message('Q'); Chappe(Est, S_N, NordOuest); end;
 procedure q;  begin message('q'); Chappe(Ouest, S_N, NordEst); end;
 procedure Rm; begin message('R'); Chappe(Sud, S_N, Est); end;
 procedure r;  begin message('r'); Chappe(Sud, S_N, Ouest); end;
 procedure Sm; begin message('S'); Chappe(NordEst, NW_SE, SudOuest); end;
 procedure s;  begin message('s'); Chappe(SudEst,  SW_NE, NordOuest); end;
 procedure Tm; begin message('T'); Chappe(SudOuest, SW_NE, Sud); end;
 procedure t;  begin message('t'); Chappe(Sud, NW_SE, SudEst); end;
 procedure Um; begin message('U'); Chappe(Sud, NW_SE, Ouest); end;
 procedure u;  begin message('u'); Chappe(Est, SW_NE, Sud); end;
 procedure Vm; begin message('V'); Chappe(Sud, W_E, SudOuest); end;
 procedure v;  begin message('v'); Chappe(SudEst, W_E, Sud); end;
 procedure Wm; begin message('W'); Chappe(SudOuest, NW_SE, SudOuest); end;
 procedure w;  begin message('w'); Chappe(SudEst, SW_NE, SudEst); end;
 procedure Xm; begin message('X'); Chappe(NordOuest, SW_NE, Ouest); end;
 procedure x;  begin message('x'); Chappe(Est, NW_SE, NordEst); end;
 procedure Ym; begin message('Y'); Chappe(Sud, SW_NE, Sud); end;
 procedure y;  begin message('y'); Chappe(Sud, NW_SE, Sud); end;
 procedure Zm; begin message('Z'); Chappe(NordOuest, SW_NE, NordOuest); end;
 procedure z;  begin message('z'); Chappe(NordEst, NW_SE, NordEst); end;
 { Chiffres }
 procedure c0;  begin message('0'); Chappe(SudEst, W_E, Nord); end;
 procedure c1;  begin message('1'); Chappe(Ouest, W_E, Est); end;
 procedure c2;  begin message('2'); Chappe(Sud, S_N, Nord); end;
 procedure c3;  begin message('3'); Chappe(Sud, S_N, NordEst); end;
 procedure c4;  begin message('4'); Chappe(NordEst, W_E, NordOuest); end;
 procedure c5;  begin message('5'); Chappe(NordEst, W_E, Sud); end;
 procedure c6;  begin message('6'); Chappe(Sud, NW_SE, SudOuest); end;
 procedure c7;  begin message('7'); Chappe(SudEst, SW_NE, Sud); end;
 procedure c8;  begin message('8'); Chappe(SudEst, W_E, SudOuest); end;
 procedure c9;  begin message('9'); Chappe(Nord, SW_NE, NordOuest); end;
 { Ponctuation }
 procedure Po;  begin message('.'); Chappe(Sud, S_N, Ouest); end;
 procedure Vg;  begin message(','); Chappe(NordOuest, W_E, Est); end;
 procedure Pv;  begin message(';'); Chappe(Ouest, W_E, NordEst); end;
 procedure Dp;  begin message(':'); Chappe(Sud, S_N, Est); end;
 procedure Pi;  begin message('?'); Chappe(SudOuest, W_E, NordEst); end;
 procedure Pe;  begin message('!'); Chappe(NordOuest, W_E, SudEst); end;
 procedure Pg;  begin message('('); Chappe(Ouest, S_N, Nord); end;
 procedure Pd;  begin message(')'); Chappe(Est, S_N, Nord); end;
 procedure Bl;  begin message(''' '''); Chappe(Nord, NW_SE, Nord); end;

begin
 Effacer; Am; a; Bm; b; Cm; c; Dm; d; Em; e; Fm; f; Gm; g; Hm; h; Im; i;
 Jm; j; Km; k; Lm; l; Mm; m; Nm; n; Om; o; Pm; p; Qm; q; Rm; r; Sm; s; Tm; t;
 Um; u; Vm; v; Wm; w; Xm; x; Ym; y; Zm; z; c0; c1; c2; c3; c4; c5;
 c6; c7; c8; c9; Po; Vg; Pv; Dp; Pi; Pe; Pg; Pd; 
end. 