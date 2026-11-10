{$mode macpas} program Decryptage;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Cryptage et décryptage d'un message, exercice 34,   *}
 {* page 210.                                           *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleGrille = 6;
 
 { Mise en page }
 
 procedure AlaLigne; 
 begin ag; translater(0, -4); end;
 
 procedure FinDeMot;
 begin translater(2, 0); end;
 
{ Dessin des lettres et des chiffres }

 procedure Lettre_a;
 begin 
  pn; translater(2, 0); avf(2); translater(0, -1); vg; vg; vg; vg; translater(1, -1); 
 end;
  
 procedure Lettre_b;
 begin
  pn; avf(3); translater(0, -2); vd; vd; vd; vd; translater(3, -1); 
 end;
  
 procedure Lettre_c;
 begin translater(2, 0); pw; av; vd; vd; vd; translater(1, -1); end;
  
 procedure Lettre_d;
 begin
  pn; translater(2, 0); avf(3); translater(0, -2); vg; vg; vg; vg; 
  translater(1, -1); 
 end;
  
 procedure Lettre_e;
 begin
  translater(2, 0); pw; av; vd; vd; vd; pqtd; av; av; 
  translater(3, -1);
 end;
  
 procedure Lettre_f;
 begin
  pn; avf(2); vd; vd; translater(-2, -1); pe; av; translater(2, -1); 
 end;

 procedure Lettre_g;
 begin
  pn; translater(2, 1); av; translater(0, -1); vg; vg; vg; vg; pdt; 
  av; vd; translater(2, 1); 
 end;
  
 procedure Lettre_h;
 begin
  pn; avf(3); translater(0, -2); vd; vd; av; translater(1, 0);
 end;
  
 procedure Lettre_i;
 begin pn; avf(2); translater(0, 1); dp; translater(1, -3); end;
  
 procedure Lettre_j;
 begin
  translater(1, 3); ps; dp; translater(0, -1); avf(2); vd; 
  translater(2, 1);
 end;
  
 procedure Lettre_k;
 begin
  pn; avf(3); translater(0, -2); pne; av; translater(-1, -1); pse; 
  av; translater(1, 0);
 end;
  
 procedure Lettre_l;
 begin pn; avf(3); translater(1, -3); end;

 procedure Lettre_m;
 begin
  pn; avf(2); translater(0, -1); vd; vd; av; translater(0, 1); pn; 
  vd; vd; av; translater(1, 0);
 end;

 procedure Lettre_n;
 begin 
  pn; avf(2); translater(0, -1); vd; vd; av; translater(1, 0);
 end;
  
 procedure Lettre_o;
 begin pn; translater(0, 1); vd; vd; vd; vd; translater(3, -1); end;
  
 procedure Lettre_p;
 begin
  translater(0, -1); pn; avf(3); translater(0, -1); vd; vd; vd; vd; 
  translater(3, -1); 
 end;

 procedure Lettre_q;
 begin
  translater(2, -1); pn; avf(3); translater(0, -1); vg; vg; vg; vg; 
  translater(1, -1); 
 end;
  
 procedure Lettre_r;
 begin pn; avf(2); translater(0, -1); vd; vd; translater(1, -1); end; 

 procedure Lettre_s;
 begin
  pe; av; phtg; vg; pw; av; pnw; vd; phtd; av; translater(1, -2); 
 end; 

 procedure Lettre_t;
 begin
  translater(0, 3); ps; av; pe; av; translater(-1, 0); ps; av; vg; 
  vg; translater(1, -1);
 end; 
 
 procedure Lettre_u;
 begin
  translater(0, 2); ps; av; vg; vg; translater(0, -1); avf(2); 
  translater(1, -2);
 end;
 
 procedure Lettre_v;
 begin
  translater(1, 0); pnw; av; pn; av; translater(1, -2); pne; av; pn; 
  av; translater(1, -2);
 end;

 procedure Lettre_w;
 begin
  translater(1, 0); pnw; av; pn; av; translater(1, -2); pne; av; pn;
  av; translater(0, -1); pse; av; pne; av; pn; av; translater(1, -2);
 end;
 
 procedure Lettre_x;
 begin
  pne; avf(2); translater(0, -2); pnw; avf(2); translater(3, -2); 
 end;

 procedure Lettre_y;
 begin
  translater(0, 2); ps; av; vg; vg; av; pdt; avf(2); vd; 
  translater(2, 1); 
 end;

 procedure Lettre_z;
 begin
  translater(0, 2); pe; avf(2); psw; avf(2); pe; avf(2); 
  translater(1, 0); 
 end;
 
 procedure Chiffre_0;
 begin
  translater(1, 0); pw; vd; av; vd; vd; av; vd; translater(2, 0);
 end;

 procedure Chiffre_1;
 begin
  translater(1, 0); pn; avf(3); psw; av; translater(2, -2);
 end;
 
 procedure Chiffre_2;
 begin
  translater(0, 2); pn; vd; vd; psw; avf(2); pe; avf(2); 
  translater(1, 0);
 end;
 
 procedure Chiffre_3;
 begin
  translater(0, 3); pne; vd; vd; pw; av; translater(1, 0); pe; vd; 
  vd; av; translater(3, 0);
 end;
 
 procedure Chiffre_4;
 begin
  translater(2, 0); pn; avf(3); psw; avf(2); pe; avf(2); 
  translater(1, -1); 
 end;
 
 procedure Chiffre_5;
 begin
  pe; av; vg; vg; av; pqtd; av; pqtd; av; av; translater(1, -3);
 end;

 procedure Chiffre_6;
 begin
  translater(0, 1); pn; vd; vd; vd; vd; av; vd; av; 
  translater(1, -1); 
 end;
 
 procedure Chiffre_7;
 begin
  translater(0, 3); pe; avf(2); ps; av; psw; av; ps; av; 
  translater(2, 0); 
 end;
 
 procedure Chiffre_8;
 begin
  translater(1, 0); pw; vd; vd; av; vd; vd; av; translater(0, 2); 
  pnw; vd; vd; vd; translater(2, -2);
 end;

 procedure Chiffre_9;
 begin
  translater(2, 2); ps; vd; vd; vd; vd; av; vd; av;
  translater(3, 0); 
 end;
 
 { décodage }
 
 procedure fm; begin Lettre_a; end;
 procedure a;  begin Lettre_n;  end;
 procedure b;  begin Lettre_v;  end;
 procedure c;  begin Chiffre_4; end;
 procedure d;  begin Chiffre_9; end;
 procedure e;  begin Lettre_d;  end;
 procedure f;  begin Lettre_u;  end;
 procedure g;  begin Chiffre_1; end;
 procedure h;  begin Lettre_c;  end;
 procedure i;  begin Lettre_x;  end;
 procedure j;  begin Chiffre_0; end;
 procedure k;  begin Lettre_p;  end;
 procedure l;  begin Lettre_f;  end;
 procedure m;  begin Lettre_y;  end;
 procedure n;  begin Lettre_g;  end;
 procedure o;  begin Lettre_h;  end;
 procedure p;  begin Lettre_q;  end;
 procedure q;  begin Lettre_i;  end;
 procedure r;  begin Chiffre_3; end;
 procedure s;  begin Chiffre_7; end;
 procedure t;  begin Chiffre_2; end;
 procedure u;  begin Lettre_t;  end;
 procedure v;  begin Lettre_j;  end;
 procedure w;  begin Lettre_o;  end;
 procedure x;  begin Chiffre_6; end;
 procedure y;  begin Lettre_l;  end;
 procedure z;  begin Lettre_r;  end;
 procedure c0;  begin Chiffre_5;end;
 procedure c1;  begin Lettre_e; end;
 procedure c2;  begin Chiffre_8;end;
 procedure c3;  begin Lettre_k; end;
 procedure c4;  begin Lettre_w; end;
 procedure c5;  begin Lettre_s; end;
 procedure c6;  begin Lettre_b; end;
 procedure c7;  begin Lettre_z; end;
 procedure c8;  begin FinDeMot; end;
 procedure c9;  begin Lettre_m; end;

 
begin
 eh; ALaLigne; lg(TailleGrille);
 c9;c1;c5;c5;fm;n;c1;c8;u;z;c1;c5;c8;c5;c1;h;z;c1;u;c8; st;
end.
