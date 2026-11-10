{$mode macpas} program DoubleSpiraleDeVoderberg;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirale de Voderberg, page 234.                     *}
 {*                                                     *}
 {*******************************************************}

 { Pavage du plan à l'aide de deux spirales formées de pavés de }
 { Voderberg.                                                   }
 
 const
  TailleQuadrillage = 6; 
  N = 12; { N pavés contigus forment un demi-cercle. }
  Theta = 15;
  C = 4; { Nombre de demi-couronnes constituant une spirale. }
  
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
 
 procedure Spirale;
  var
   I : integer;
   J : integer;
   K : integer;
 begin
  for I := 1 to C do
   begin
    for J := 1 to N do
     begin
      PavePointe;
      for K := 1 to (I - 1) do
       begin
        PaveBase; PavePointe;
       end;
     end;
   end;
 end;

 procedure PavePointeMiroir;
  { Dessiner un pavé de Voderberg miroir en commençant par la pointe. }
 begin
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(4 * Theta);
  av; pdt; rt(7 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; 
 end;
 
 procedure PaveBaseMiroir;
  { Dessiner un pavé de Voderberg miroir en commençant par la base. }
 begin
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta); 
  av; pdt; rt(11 * Theta);
  av; pdt; rt(7 * Theta);
  av; avf(-1); rt(-(7 * Theta));
 end;
 
 procedure SpiraleMiroir;
  var
   I : integer;
   J : integer;
   K : integer;
 begin
  for I := 1 to C do
   begin
    for J := 1 to N do
     begin
      PavePointeMiroir;
      for K := 1 to (I - 1) do
       begin
        PaveBaseMiroir; PavePointeMiroir;
       end;
     end;
   end;
 end;

begin
 lg(TailleQuadrillage); Spirale; 
 ce; lg(TailleQuadrillage); pn; lc;
 av; pdt; rt(11 * Theta);
 av; pdt; rt(11 * Theta);
 av; pdt; rt(11 * Theta);
 av; pdt;
 bc;
 SpiraleMiroir; st;
end.