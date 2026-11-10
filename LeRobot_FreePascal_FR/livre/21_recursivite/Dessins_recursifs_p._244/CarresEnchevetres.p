{$mode macpas} program CarresEnchevetres;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Dessins récursifs, page 244.                        *}
 {*                                                     *}
 {*******************************************************}

 procedure Carres(L : real);
  var I : integer;
 begin
  if L > 2 then
   begin
    { Dessiner un carré de côté L en partant du centre }
    lg(L / 2); lc; av; pqtd; 
    bc; av; pqtd; avf(2); pqtd; avf(2); pqtd; avf(2); pqtd; av; pqtd;
    lc; av; pdt; 
    { Imbriquer quatre carrés }
    for I := 1 to 4 do
     begin
      lg(L / 3); lc; av; 
      Carres(L / 3);
      lg(L / 3); lc; avf(-1); 
      pqtd; 
    end;
    end;
 end;

begin
 Carres(170); st;
end.