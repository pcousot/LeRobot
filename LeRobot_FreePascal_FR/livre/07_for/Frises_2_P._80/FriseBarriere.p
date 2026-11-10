{$mode macpas} program FriseBarriere;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure n;
  { Dessiner le motif de la barrière en forme de n }
 begin
  av; av; pqtd; av; av; pqtd; av; av; pdt; 
 end;  

 procedure Barriere;
 { Dessiner une barrière }
  var I : integer;
 begin
  for I := 1 to 20 do
   begin
    n;
   end;
 end;
 
begin
 ag; Barriere; st; 
end.