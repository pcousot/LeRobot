{$mode macpas} program ExpliquerGrilleRectangulaire;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Virage à droite, avancer et virage à gauche avec    *}
 {* une grille 30 x 60, page 113.                       *}
 {*                                                     *}
 {*******************************************************}

  var I : integer;
begin
 lgx(30); lgy(60); dg;
 message('Grille rectangulaire 30 x 60'); MarquerUnePause;
 message ('AV dans la direction N');  MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction NE'); MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction E');  MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction SE'); MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction S');  MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction SW'); MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction W');  MarquerUnePause; av; ce; phtd;
 message ('AV dans la direction NW'); MarquerUnePause; av;
 ce; translater(-3, 0); 
 message ('VD dans la direction N');  pn;  MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction NE'); pne; MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction E');  pe;  MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction SE'); pse; MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction S');  ps;  MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction SW'); psw; MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction W');  pw;  MarquerUnePause; vd; ce; translater(-3, 0);
 message ('VD dans la direction NW'); pnw; MarquerUnePause; vd;
 ce; translater(3, 0);
 message('Grille rectangulaire 30 x 60'); MarquerUnePause;
 message ('VG dans la direction N');  pn;  MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction NE'); pne; MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction E');  pe;  MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction SE'); pse; MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction S');  ps;  MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction SW'); psw; MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction W');  pw;  MarquerUnePause; vg; ce; translater(3, 0);
 message ('VG dans la direction NW'); pnw; MarquerUnePause; vg;
 st;
end.