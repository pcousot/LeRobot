{$mode macpas} program FriseCransBarres;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure MotifDroit;
 begin
  av; av; pqtd; av; pqtg; av; pdt; av; 
  av; pdt; av; pqtd; av; pqtd; av; av;
 end;
  
 procedure MotifGauche;
 begin
  av; av; pqtg; av; pqtg; av; pdt; av; 
  av; pdt; av; pqtd; av; pqtg; av; av;
 end;
  
 procedure Frise;
  var I : integer;
 begin
  for I := 1 to 10 do
   begin
    MotifDroit; MotifGauche;
   end;
 end;
  
begin
 ag; Frise; st;
end.