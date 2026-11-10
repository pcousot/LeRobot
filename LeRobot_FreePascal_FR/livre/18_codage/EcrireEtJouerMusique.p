{$mode macpas} program EcrireEtJouerMusique;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Codage de la hauteur des notes de musique par des   *}
 {* entiers, page 205.                                  *}
 {*                                                     *}
 {*******************************************************}

 const
  { Taille de la grille }
  X = 4;
  Y = 3;  

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
  pn; vd; vd; vd; vd; vd; pqtg; peindre; pqtd; vd; vd; pqtg; 
  peindre; pqtd; vd; 
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
  { Placer le robot sur la ligne du do du milieu du clavier du piano }
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
 
 procedure Jouer(NomNote : string; N : integer; Oc : integer; F : real);
 begin
   message(concat(NomNote, ' = ',EntierEnChaine(N),', numéro d''octave = ', EntierEnChaine(Oc), 
                  ', octave = 12, code = ((',EntierEnChaine(Oc),' * octave) + ',NomNote, ') = ', 
                  entierEnChaine(N + (Oc * octave))));
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
   note(((Oc * Octave) + N), F);
 end;
 
begin
 metronome(140); nuance(forte);    
 Portee;
 Jouer('do', d0, -3, noire);
 Jouer('re', re, -3, noire);
 Jouer('mi', mi, -3, noire);
 Jouer('fa', fa, -3, noire);
 Jouer('sol', sol,-3, noire);
 Jouer('la', la, -3, noire);
 Jouer('si', si, -3, noire);
 Barre;
 Jouer('do', d0, -2, noire);
 Jouer('re', re, -2, noire);
 Jouer('mi', mi, -2, noire);
 Jouer('fa', fa, -2, noire);
 Jouer('sol', sol,-2, noire);
 Jouer('la', la, -2, noire);
 Jouer('si', si, -2, noire);
 Barre;
 Jouer('do', d0, -1, noire);
 Jouer('re', re, -1, noire);
 Jouer('mi', mi, -1, noire);
 Jouer('fa', fa, -1, noire);
 Jouer('sol', sol,-1, noire);
 Jouer('la', la, -1, noire);
 Jouer('si', si, -1, noire);
 Barre; MarquerUnePause; 
 EffacerMessage; Portee;
 Jouer('do', d0, 0, noire);
 Jouer('re', re, 0, noire);
 Jouer('mi', mi, 0, noire);
 Jouer('fa', fa, 0, noire);
 Jouer('sol', sol,0, noire);
 Jouer('la', la, 0, noire);
 Jouer('si', si, 0, noire);
 Barre;
 Jouer('do', d0, 1, noire);
 Jouer('re', re, 1, noire);
 Jouer('mi', mi, 1, noire);
 Jouer('fa', fa, 1, noire);
 Jouer('sol', sol,1, noire);
 Jouer('la', la, 1, noire);
 Jouer('si', si, 1, noire);
 Barre;
 Jouer('do', d0, 2, noire);
 Jouer('re', re, 2, noire);
 Jouer('mi', mi, 2, noire);
 Jouer('fa', fa, 2, noire);
 Jouer('sol', sol,2, noire);
 Jouer('la', la, 2, noire);
 Jouer('si', si, 2, noire);
 Barre; MarquerUnePause; 
 EffacerMessage; Portee;
 Jouer('do', d0, 3, noire);
 Jouer('re', re, 3, noire);
 Jouer('mi', mi, 3, noire);
 Jouer('fa', fa, 3, noire);
 Jouer('sol', sol,3, noire);
 Jouer('la', la, 3, noire);
 Jouer('si', si, 3, noire);
 Barre;
 Jouer('do', d0, 4, noire);
 Jouer('re', re, 4, noire);
 Jouer('mi', mi, 4, noire);
 Jouer('fa', fa, 4, noire);
 Jouer('sol', sol,4, noire);
 Jouer('la', la, 4, noire);
 Jouer('si', si, 4, noire);
 Barre; MarquerUnePause; 
end.