{$mode macpas} program TrianglesIsocelesEnCercle;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Page 234.                                           *}
 {*                                                     *}
 {*******************************************************}

 { Pavage de plan à l'aide de triangles isocèles disposés en }
 { couronnes circulaires. }
 
 const
  N = 12;
  Lo = 30;
  C = 4; { Nombre de couronnes }
  
 procedure Tip;
  { Dessiner un triangle isocèle en commençant par la pointe }
 begin
  tl(Lo);
  rt(180 - ((180 - (180 / N)) / 2)); tl(2 * Lo * cos(((180 - (180 / N)) / 2) / 180 * PI));
  rt(180 - ((180 - (180 / N)) / 2)); tl(Lo); pdt; 
 end;
 
 procedure Tib;
  { Dessiner un triangle isocèle en commençant par la base }
 begin
  tl(Lo);
  rt(180 - (180 / N)); tl(Lo);
  rt(180 - ((180 - (180 / N)) / 2)); tl(2 * Lo * cos(((180 - (180 / N)) / 2) / 180 * PI));
  lc; avf(-1); bc; rt((180 - (180 / N)) / 2);
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
      Tip;
      for K := 1 to (I - 1) do
       begin
        Tib; Tip;
       end;
     end;
    av;
   end;
 end;
 
begin
 Pavage; st;
end.