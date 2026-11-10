{$mode macpas} program TelegrapheDeChappe;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Télégraphe de Chappe, exercice 34, pages 209-210.   *}
 {*                                                     *}
 {*******************************************************}

 const
  DureeSignal = 2; { secondes pour voir un signal }
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
 procedure Am; begin Chappe(Nord, W_E, NordEst); end;
 procedure a;  begin Chappe(NordOuest, W_E, Nord); end;
 procedure Bm; begin Chappe(SudOuest, SW_NE, NordOuest); end;
 procedure b;  begin Chappe(NordEst, NW_SE, SudEst); end;
 procedure Cm; begin Chappe(Sud, W_E, Sud); end;
 procedure c;  begin Chappe(Nord, W_E, Nord); end;
 procedure Dm; begin Chappe(Nord, SW_NE, NordEst); end;
 procedure d;  begin Chappe(NordOuest, NW_SE, Nord); end;
 procedure Em; begin Chappe(Est, S_N, Est); end;
 procedure e;  begin Chappe(Ouest, S_N, Ouest); end;
 procedure Fm; begin Chappe(Nord, W_E, NordEst); end;
 procedure f;  begin Chappe(Nord, W_E, NordOuest); end;
 procedure Gm; begin Chappe(Nord, NW_SE, Nord); end;
 procedure g;  begin Chappe(Nord, SW_NE, Nord); end;
 procedure Hm; begin Chappe(Ouest, S_N, Est); end;
 procedure h;  begin Chappe(Est, S_N, Ouest); end;
 procedure Im; begin Chappe(Sud, S_N, SudEst); end;
 procedure i;  begin Chappe(Sud, S_N, SudOuest); end;
 procedure Jm; begin Chappe(SudOuest, W_E, SudEst); end;
 procedure j;  begin Chappe(NordOuest, W_E, NordEst); end;
 procedure Km; begin Chappe(Sud, S_N, Est); end;
 procedure k;  begin Chappe(Sud, S_N, Ouest); end;
 procedure Lm; begin Chappe(Est, S_N, Nord); end;
 procedure l;  begin Chappe(Ouest, S_N, Nord); end;
 procedure Mm; begin Chappe(Nord, SW_NE, SudEst); end;
 procedure m;  begin Chappe(SudOuest, NW_SE, Nord); end;
 procedure Nm; begin Chappe(Sud, NW_SE, NordEst); end;
 procedure n;  begin Chappe(NordOuest, SW_NE, Sud); end;
 procedure Om; begin Chappe(Nord, NW_SE, Est); end;
 procedure o;  begin Chappe(Ouest, SW_NE, Nord); end;
 procedure Pm; begin Chappe(NordOuest, NW_SE, SudOuest); end;
 procedure p;  begin Chappe(SudEst, SW_NE, NordEst); end;
 procedure Qm; begin Chappe(Est, S_N, NordOuest); end;
 procedure q;  begin Chappe(Ouest, S_N, NordEst); end;
 procedure Rm; begin Chappe(Sud, S_N, Est); end;
 procedure r;  begin Chappe(Sud, S_N, Ouest); end;
 procedure Sm; begin Chappe(NordEst, NW_SE, SudOuest); end;
 procedure s;  begin Chappe(SudEst,  SW_NE, NordOuest); end;
 procedure Tm; begin Chappe(SudOuest, SW_NE, Sud); end;
 procedure t;  begin Chappe(Sud, NW_SE, SudEst); end;
 procedure Um; begin Chappe(Sud, NW_SE, Ouest); end;
 procedure u;  begin Chappe(Est, SW_NE, Sud); end;
 procedure Vm; begin Chappe(Sud, W_E, SudOuest); end;
 procedure v;  begin Chappe(SudEst, W_E, Sud); end;
 procedure Wm; begin Chappe(SudOuest, NW_SE, SudOuest); end;
 procedure w;  begin Chappe(SudEst, SW_NE, SudEst); end;
 procedure Xm; begin Chappe(NordOuest, SW_NE, Ouest); end;
 procedure x;  begin Chappe(Est, NW_SE, NordEst); end;
 procedure Ym; begin Chappe(Sud, SW_NE, Sud); end;
 procedure y;  begin Chappe(Sud, NW_SE, Sud); end;
 procedure Zm; begin Chappe(NordOuest, SW_NE, NordOuest); end;
 procedure z;  begin  Chappe(NordEst, NW_SE, NordEst); end;
 { Chiffres }
 procedure c0;  begin Chappe(SudEst, W_E, Nord); end;
 procedure c1;  begin Chappe(Ouest, W_E, Est); end;
 procedure c2;  begin Chappe(Sud, S_N, Nord); end;
 procedure c3;  begin Chappe(Sud, S_N, NordEst); end;
 procedure c4;  begin Chappe(NordEst, W_E, NordOuest); end;
 procedure c5;  begin Chappe(NordEst, W_E, Sud); end;
 procedure c6;  begin Chappe(Sud, NW_SE, SudOuest); end;
 procedure c7;  begin Chappe(SudEst, SW_NE, Sud); end;
 procedure c8;  begin Chappe(SudEst, W_E, SudOuest); end;
 procedure c9;  begin Chappe(Nord, SW_NE, NordOuest); end;
 { Ponctuation }
 procedure Po; {.} begin Chappe(Sud, S_N, Ouest); end;
 procedure Vg; {,} begin Chappe(NordOuest, W_E, Est); end;
 procedure Pv; {;} begin Chappe(Ouest, W_E, NordEst); end;
 procedure Dp; {:} begin Chappe(Sud, S_N, Est); end;
 procedure Pi; {?} begin Chappe(SudOuest, W_E, NordEst); end;
 procedure Pe; {!} begin Chappe(NordOuest, W_E, SudEst); end;
 procedure Pg; {(} begin Chappe(Ouest, S_N, Nord); end;
 procedure Pd; {)} begin Chappe(Est, S_N, Nord); end;
 procedure Bl; { } begin Chappe(Nord, NW_SE, Nord); end;

begin
 Effacer; 
 Pm;a;r;i;s;  e;s;t; t;r;a;n;q;u;i;l;l;e; e;t; l;e;s; b;o;n;s; 
 c;i;t;o;y;e;n;s; s;o;n;t; c;o;n;t;e;n;t;s;Po;
end. 