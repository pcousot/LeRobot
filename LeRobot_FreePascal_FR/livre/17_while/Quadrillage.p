{$mode macpas} program Quadrillage;
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
  { Descendre en tracant la verticale }
  bc; AuBord;
  { Remonter du sud au nord }
  lc; pn; AuBord;
 end;

 procedure Tracer_Verticales;
  { Partant d'un robot au bord nord, tracer les verticales }
  { d'est  en  ouest  et  terminer  avec  le robot au coin }
  { nord-ouest.                                            }
 begin
  { Tracer la premiere verticale a l'est }
  Verticale;
  { Tracer les verticales suivantes, d'est en ouest }
  pw;
  while (not tb) do
   begin
    { Avancer à l'ouest }
    av;
    { Tracer la verticale }
    Verticale;
    pw;
   end;
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
  { Tracer la premiere horizontale au nord }
  Horizontale;
  { Tracer les horizontales suivantes, du nord au sud }
  ps;
  while (not tb) do
   begin
    { avancer au sud }
    av;
    { tracer l'horizontale}
    Horizontale;
    ps;
   end;
 end;

begin
 Rejoindre_Coin_Nord_Est;
 Tracer_Verticales;
 Tracer_Horizontales;
 st;
end.