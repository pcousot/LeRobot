{$mode macpas} program FriseDoublesCrans;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Cran;
 { Dessiner le motif 'n_' }
 begin
   av; pqtd; av; pqtd; av; pqtg; av; pqtg;
 end;
 
 procedure FriseCrantee;
  var J : integer;
 begin
  for J := 1 to 20 do 
   begin
    Cran;
   end;
 end;

 var I : integer;
  
begin
 ag;
 for I := 1 to 2 do
  begin
   FriseCrantee;
   { Extrémité droite }
   av; pqtd; av; pqtd; av; av;
  end;
 st; 
end.