{$mode macpas} program Grillage;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Points  d'arrêt,  quadrillage  et  grillage  sur un *}
 {* écran réduit, page 193.                             *}
 {*                                                     *}
 {*******************************************************}

 procedure AuBord;
  { Rejoindre le bord, tout droit }
 begin
  while (not tb) do
   begin
    av;
   end;
 end;

 procedure Rejoindre_Coin_Nord_Est;
 begin
  { Rejoindre le bord nord }
  lc; pn; AuBord;
  { Rejoindre le coin nord-est }
  pe; AuBord;
 end;

 procedure Verticale;
  { Le robot étant au bord nord, descendre en traçant }
  { la verticale puis remonter.                       }
 begin
  { Orienter le robot vers le sud }
  ps;
  { Descendre en traçant la verticale }
  bc; AuBord;
  { Remonter du sud au nord }
  lc; pn; AuBord; 
 end;

 procedure Tracer_Verticales;
  { Partant d'un robot au bord nord, tracer les verticales }
  { d'est  en  ouest  et  terminer  avec  le robot au coin }
  { nord-ouest.                                            }
 begin
  Rejoindre_Coin_Nord_Est;
  { Tracer la premiere verticale à l'est }
  Verticale;
  { Tracer les verticales suivantes, d'est en ouest }
  pw;
  while (not tb) do begin
   { Avancer à l'ouest }
   av; 
   { Tracer la verticale }
   Verticale;
   pw;
  end;
 end;

 procedure Rejoindre_Coin_Nord_Ouest;
 begin
  { Rejoindre le bord nord }
  lc; pn; AuBord;
  { Rejoindre le coin nord-ouest }
  pw; AuBord;
 end;

 procedure Horizontale;
  { Le robot étant au bord ouest, traverser en traçant }
  { l'horizontale  puis  retraverser pour rejoindre le }
  { bord ouest.                                        }
 begin
  { Orienter le robot vers l'est }
  pe;
  { Traverser en traçant l'horizontale }
  bc; AuBord; lc; 
  { Retraverser d'est en ouest }
  pw; AuBord;
 end;

 procedure Tracer_Horizontales;
  { Partant  d'un  robot  au bord ouest tracer les horizontales }
  { d'est en ouest et terminer avec le robot au coin sud-ouest. }
 begin
  Rejoindre_Coin_Nord_Ouest;
  { Tracer la première horizontale au nord }
  Horizontale;
  { Tracer les horizontales suivantes, du nord au sud }
  ps;
  while (not tb) do 
   begin
    { Avancer au sud }
    av;
    { Tracer l'horizontale}
    Horizontale;
    ps;
   end;
 end;

 procedure Rejoindre_Coin_Sud_Ouest;
 begin
  { Rejoindre le bord sud }
  lc; ps; AuBord;
  { Rejoindre le coin sud-ouest }
  pw; AuBord;
 end;

 procedure Oblique_NO_SE;
  { Partant du bord ouest ou nord, tracer les obliques }
  { du  nord-ouest  vers le sud-est et revenir au bord }
  { d'origine.                                         }
 begin
  { Tracer l'oblique }
  pse; bc; AuBord;
  { Revenir }
  pnw; lc; AuBord;
 end;

 procedure Tracer_Obliques_NO_SE;
 begin
  Rejoindre_Coin_Sud_Ouest;
  { Tracer les obliques NO-SE partant du bord ouest }
  pn;
  while (not tb) do
   begin
    av;
    Oblique_NO_SE;
    pn; 
   end;
  { Tracer les obliques NO-SE partant du bord nord }
  pe;
  while (not tb) do
   begin
    av; 
    Oblique_NO_SE; 
    pe;
   end;
 end;

 procedure Rejoindre_Coin_Sud_Est;
 begin
  { Rejoindre le bord sud }
  lc; ps; AuBord;
  { Rejoindre le coin sud-est }
  pe; AuBord;
 end;

 procedure Oblique_SO_NE;
  { Partant du bord sud ou ouest, tracer les obliques }
  { du  sud-ouest vers le nord-est et revenir au bord }
  { d'origine.                                        }
 begin
  { Tracer l'oblique }
  pne; bc; AuBord;
  { Revenir }
  psw; lc; AuBord;
 end;

 procedure Tracer_Obliques_SO_NE;
 begin
  Rejoindre_Coin_Sud_Est;
  { Tracer les obliques SO-NE partant du bord sud }
  pw;
  while (not tb) do
   begin
    av;
    Oblique_SO_NE;
    pw;
   end;
   { Tracer les obliques SO-NE partant du bord ouest }
   pn;
   while (not tb) do
    begin
     av; 
     Oblique_SO_NE; 
     pn; 
    end;
 end;

begin {Grillage}
 Tracer_Verticales;
 Tracer_Horizontales;
 Tracer_Obliques_NO_SE;
 Tracer_Obliques_SO_NE;
 st; 
end. {Grillage}