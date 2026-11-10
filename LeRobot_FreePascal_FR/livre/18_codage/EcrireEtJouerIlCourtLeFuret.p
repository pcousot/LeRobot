{$mode macpas} program EcrireEtJouerIlCourtLeFuret;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 36, pages 210 et 212.                      *}
 {*                                                     *}
 {*******************************************************}

 const
  { Taille de la grille }
  X = 4;
  Y = 3;
  { Une note n de l'octave o avec l'altération a est codée par }
  { ((o * octave) + n + a). }
  { Codes des notes : }
  ut = 0;
  d0 = 0;
  re = 2;
  mi = 4;
  fa = 5;
  sol = 7;
  la = 9;
  si = 11;
  octave = 12;
  
  { Codes des figures de notes : }
  ronde = 4;
  blanche = 2;
  blanche_pointee = 3;
  noire = 1;

 procedure  DessinerRonde;
 begin
  pn; vd; vd; vd; vd; 
 end;

 procedure  DessinerBlanche;
 begin
  pn; vd; vd; vd; vd;
 end;

 procedure  DessinerNoire;
 begin
  pn; vd; vd; vd; vd; vd; pqtg; peindre; pqtd; vd; vd; pqtg; peindre; pqtd; vd; 
 end;
 
 procedure QueueVersLeHaut;
 begin
  translater(2, 0); avf(6); translater(-2, -6); 
 end;
  
 procedure QueueVersLeBas;
 begin
  avf(-6); translater(0, 6); 
 end;
  
 procedure Cle;
 begin
  ec(2); lgX(X); lgY(Y); translater(2, 4); pn; lg(2 * Y); 
  vd; vd; lgX(3 * Y); vd; lgY(4 * Y); vd; phtd; lg(4 * Y); 
  av; phtd; lgX(2 * Y); lgY(3 * Y); vg;  lgX(Y); vg; vg; 
  lgY(Y); avf(14); lg(2 * Y); vd; lgX(X / 3); lgY(Y / 3); 
  vd; vd; vd; vd; pqtd; lgX(X); lgY(Y); translater(2, 3); 
  ec(1);
 end;
 
 procedure  Portee;
  var  Ligne : integer;
 begin  
  cf(blanc); lgX(4 * X); lgY(Y); CacherRobot;
  ag; pe;
  for Ligne := 1 to 5 do
   begin
    while not tb do
     begin
      av;
     end;
    pdt; translater(0, -2);
   end;
  { Placer le robot sur la ligne du do du milieu du clavier du piano}
  ag; lgX(X); Cle;
 end;
 
 procedure Barre;
  { Tracer un barre verticale }
 begin
  translater(4, 2); pn; avf(8); translater(-3, -10);
 end;
 
 procedure Remonter(N : integer);
  { Remonter de la position courante de la note à la position du do }
  { du milieu du piano en traçant des lignes supplémentaires.       }
  var I : integer;
 begin
  pe; 
  if odd(N) then
   begin { Ne pas couper la note re, fa, ... par une ligne }
    translater(0, 1);
   end; 
  for I := 1 to ((N div 2) + 1) do
   begin
    translater(-1, 0); avf(4); translater(-3, 2); 
   end;
  translater(0, -2);
  end;
 
 procedure Redescendre(N : integer);
  { Redescendre de la position courante de la note à la position du }
  { do du milieu du piano en traçant des lignes supplémentaires.    }
  var I : integer;
 begin
  pe; 
  if (N = 0) then
   begin { do du milieu du clavier du piano }
    translater(-1, 0); avf(4); translater(-3, 0); 
   end
  else if (N <= 11) then
   begin { note sur la portee }
    translater(0, -N);
   end
  else
   begin
    if odd(N) then
     begin { Ne pas couper la note re, fa, ... par une ligne }
      translater(0, -1);
     end; 
    for I := 1 to ((N div 2) - 1) do
     begin
      translater(-1, 0); avf(4); translater(-3, -2); 
     end;
    translater(0, -2);
   end;
 end;
 
 procedure Jouer(N : integer; Oc : integer; F : integer);
 begin
  { Passer à la note suivante }
    translater(5, 0);
  { Placer le robot sur la bonne ligne }
  if (N = d0) then
   begin
    translater(0, (Oc * 7));
   end
  else if (N = re) then
   begin
    translater(0, (Oc * 7) + 1);
   end
  else if (N = mi) then
   begin
    translater(0, (Oc * 7) + 2);
   end
  else if (N = fa) then
   begin
    translater(0, (Oc * 7) + 3);
   end 
  else if (N = sol) then
   begin
    translater(0, (Oc * 7) + 4);
   end
  else if (N = la) then
   begin
    translater(0, (Oc * 7) + 5);
   end
  else if (N = si) then
   begin
    translater(0, (Oc * 7) + 6);
   end;
  { Dessiner la note }
  if (F = ronde) then 
   begin
    DessinerRonde;
   end
  else if (F = blanche) then 
   begin
    DessinerBlanche;
   end
  else 
   begin
    DessinerNoire;
   end;
  { Dessiner la queue de la note }
  if (F = blanche) or (F = noire) then
   begin
    if ((Oc * Octave) + N) < si then
     begin
      QueueVersLeHaut;
     end
    else 
     begin
      QueueVersLeBas;
     end;
   end;
  { Revenir sur la ligne du do du milieu du clavier du piano. }
  if (N = d0) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre(Oc * 7);
     end
    else
     begin
      Remonter(-(Oc * 7));
     end;
   end
  else if (N = re) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre((Oc * 7) + 1);
     end
    else
     begin
      Remonter(-((Oc * 7) + 1));
     end;
   end
  else if (N = mi) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre((Oc * 7) + 2);
     end
    else
     begin
      Remonter(-((Oc * 7) + 2));
     end;
   end
  else if (N = fa) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre((Oc * 7) + 3);
     end
    else
     begin
      Remonter(-((Oc * 7) + 3));
     end;
   end 
  else if (N = sol) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre((Oc * 7) + 4);
     end
    else
     begin
      Remonter(-((Oc * 7) + 4));
     end;
   end
  else if (N = la) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre((Oc * 7) + 5);
     end
    else
     begin
      Remonter(-((Oc * 7) + 5));
     end;
   end
  else if (N = si) then
   begin
    if (Oc >= 0) then
     begin
      Redescendre((Oc * 7) + 6);
     end
    else
     begin
      Remonter(-((Oc * 7) + 6));
     end;
   end;
  { Jouer la note }
  if (F = ronde) then 
   begin
    note(((Oc * Octave) + N), ronde);
   end
  else if (F = blanche) then 
   begin
    note(((Oc * Octave) + N), blanche);
   end
  else 
   begin
    note(((Oc * Octave) + N), noire);
   end;
 end;
 
 procedure Refrain;
 begin
 Portee;
  message('Il'); Jouer(d0, 0, noire);
  message('court,'); Jouer(fa, 0, noire);
  message('il'); Jouer(sol,0, noire);
  Barre;
  message('court,'); Jouer(la, 0, blanche);
  message('le'); Jouer(sol, 0, noire);
  message('fu-'); Jouer(sol, 0, noire);
  Barre;
  message('-ret,'); Jouer(re, 0, blanche);
  message('le'); Jouer(fa, 0, noire);
  message('fu-'); Jouer(mi, 0, noire);
  Barre;
  message('-ret'); Jouer(re, 0, noire);
  message('du'); Jouer(d0, 0, noire);
  message('bois'); Jouer(re, 0, noire);
  message('Mes-'); Jouer(mi, 0, noire);
  Barre;
  message('-dames,'); Jouer(fa, 0, noire);
  message(''); marquerUnePause;
  Portee;
  message('Il'); Jouer(d0, 0, noire);
  message('court,'); Jouer(fa, 0, noire);
  message('il'); Jouer(sol,0, noire);
  Barre;
  message('court,'); Jouer(la, 0, blanche);
  message('le'); Jouer(sol, 0, noire);
  message('fu-'); Jouer(sol, 0, noire);
  Barre;
  message('-ret,'); Jouer(re, 0, blanche);
  message('le'); Jouer(fa, 0, noire);
  message('fu-'); Jouer(mi, 0, noire);
  Barre;
  message('-ret'); Jouer(re, 0, noire);
  message('du'); Jouer(d0, 0, noire);
  message('bois'); Jouer(re, 0, noire);
  message('jo-'); Jouer(mi, 0, noire);
  Barre;
  message('-li.'); Jouer(fa, 0, noire);
  message(''); marquerUnePause
 end;
 
begin
 metronome(200); nuance(forte);
 Refrain;
 Portee;    
 message('il'); Jouer(fa, 0, noire);
 message('est'); Jouer(mi, 0, noire);
 Barre;
 message('pas-'); Jouer(re, 0, noire);
 message('-sé'); Jouer(d0, 0, noire);
 message('par'); Jouer(re, 0, noire);
 message('i-'); Jouer(mi, 0, noire);
 Barre;
 message('-ci,'); Jouer(fa, 0, blanche); 
 message('il'); Jouer(fa, 0, noire);
 message('re-'); Jouer(mi, 0, noire);
 Barre;
 message('-pas-'); Jouer(re, 0, noire);
 message('-se-'); Jouer(d0, 0, noire);
 message('-ra'); Jouer(re, 0, noire);
 message('par'); Jouer(mi, 0, noire);
 Barre;
 message('là.'); Jouer(fa, 0, noire); 
 message(''); marquerUnePause;
 Refrain; 
 message('- Fin -'); marquerUnePause;
end.