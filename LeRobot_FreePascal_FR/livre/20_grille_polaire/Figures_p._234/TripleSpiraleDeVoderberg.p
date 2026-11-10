{$mode macpas} program TripleSpiraleDeVoderberg;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirale de Voderberg, page 234.                     *}
 {*                                                     *}
 {*******************************************************}

 { Pavage du plan à l'aide de trois spirales formées de pavés de }
 { Voderberg.                                                    }
 
 const
  TailleQuadrillage = 6;
  Longueur = 3; { Nombre de tiers de couronnes constituant une spirale }
  Theta = 15;
  
 procedure PavePointe;
  { Dessiner un pavé de Voderberg en commençant par la pointe }
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
  { Dessiner un pavé de Voderberg en commençant par la base }
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
 
 procedure Segment (N : integer);
  var
   I : integer;
   J : integer;
 begin
  for I := 1 to 4 do
   begin
    PavePointe;
    for J := 1 to N do
     begin
      PaveBase; PavePointe; 
     end;
   end;
 end;
  
 procedure Virage (N : integer);
  var
   I : integer;
   J : integer;
 begin
  for I := 1 to 4 do
   begin
    PavePointe;
    for J := 1 to (N - 1) do
     begin
      PaveBase; PavePointe; 
     end;
   end;
 end;
  
 procedure Spirale(L : integer);
  var
   I : integer;
 begin
  for I := 1 to L do
   begin
    Segment(I); Virage(I);
   end;
 end;

begin 
 ce; lg(TailleQuadrillage); pn;
 Spirale(Longueur);
 ce; lg(TailleQuadrillage); pn; rt(8 * Theta);
 Spirale(Longueur);
 ce; lg(TailleQuadrillage); pn; rt(16 * Theta);
 Spirale(Longueur);
 st; 
end.