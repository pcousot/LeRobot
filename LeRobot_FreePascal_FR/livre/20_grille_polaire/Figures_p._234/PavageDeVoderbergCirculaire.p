{$mode macpas} program PavageDeVoderbergCirculaire;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage du disque de Voderberg, page 234.            *}
 {*                                                     *}
 {*******************************************************}

 { Pavage de plan à l'aide de pavés de Voderberg disposés en }
 { couronnes circulaires. }
 
 const
  TailleQuadrillage = 8;
  N = 12; { 2 * N pavés forment un cercle. }
  C = 3; { Nombre de couronnes }
  Theta = 15;
  
 procedure PavePointe;
  { Dessiner un pavé de Voderberg en commençant par la pointe. }
 begin
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(7 * Theta);
  av; pdt; rt(4 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; 
 end;
 
 procedure PaveBase;
  { Dessiner un pavé de Voderberg en commençant par la base. }
 begin
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(4 * Theta);
  av; avf(-1); rt(-(4 * Theta));
 end;
 
 procedure Pavage;
  var
   I : integer;
   J : integer;
   K : integer;
 begin
  for I := 1 to C do
   begin
    for J := 1 to (2 * N) do
     begin
      PavePointe;
      for K := 1 to (I - 1) do
       begin
        PaveBase; PavePointe;
       end;
     end;
    { Passer à la couronne extérieure suivante. }
    lc;
    av; pdt; rt(11 * Theta);
    av; pdt; rt(11 * Theta);
    av; pdt; rt(11 * Theta);
    av; pdt; rt(-(9  * Theta));
    bc;
   end;
 end;
 
begin
 lg(TailleQuadrillage); Pavage; st;
end.