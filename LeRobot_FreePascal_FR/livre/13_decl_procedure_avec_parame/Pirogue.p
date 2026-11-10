{$mode macpas} program Pirogue;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pirogue, page 147.                                  *}
 {*                                                     *}
 {*******************************************************}

 const NombreDeRameurs = 12;
 
 procedure Pirogue (N : integer);
  { Dessiner une pirogue de N rameurs }
 begin
  { Dessiner le fond de la pirogue }
  pqtd; avf(N);
  { Dessiner l'avant de la pirogue }
  lg(3); phtg; av; p3htg; lg(12);
  { Dessiner le dessus de la pirogue }
  avf(N + 1);
  { Dessiner l'arrière de la pirogue }
  lg(3); p3htg; av; phtg; avf(2);
  { Placer le robot sous le premier rameur }
  lc; pqtg; av; pqtd; bc;
 end;
 
 procedure Rameur;
 begin
  lg(3);
  { Corps}        pqtg; avf(2);
  { Bras droit }  pqtd; av; pdt; av;
  { Bras gauche } av; pdt; av; pqtg;
  { Cou }         av;
  { Tête }        pqtg; vd; vd; vd; vd;
  { Resdescendre} pqtg; avf(3); pqtg;
 end;

 procedure Espace;
  { Prévoir un espace entre chaque rameur }
 begin
  lg(12); av; 
 end;   

 procedure Rameurs (N : integer);
  { Dessiner les rameurs sur la pirogue }
  var I : integer;
 begin
  for I :=1 to N do 
  begin
   Rameur;
   Espace;
  end;
 end;

begin
 Pirogue(NombreDeRameurs); Rameurs(NombreDeRameurs); st;
end.