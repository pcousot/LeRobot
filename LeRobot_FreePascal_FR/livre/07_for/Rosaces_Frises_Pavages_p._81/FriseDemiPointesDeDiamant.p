{$mode macpas} program FriseDemiPointesDeDiamant;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}

 procedure MotifGauche;
 begin
  av; av; av; p3htd; av; phtd; av; av; pqtd; av; pdt; av; pqtg; 
 end;
 
 procedure MotifDroit;
 begin
  av; av; Phtd; av; p3htd; av; av; av; pqtd; av; pdt; av; pqtg; 
 end;
 
 procedure TraitHorizontal;
  var
   I : integer;
   J : integer;
 begin
  for I := 1 to 2 do
   begin
    for J := 1 to 40 do
     begin
      av;
     end;
    pdt; 
   end;
 end;

 var J :integer;
 
begin 
 ag;
 for J := 1 to 20 do
  begin
   MotifGauche;
   MotifDroit;
  end;
 lc; pdt; av; pqtd; bc; TraitHorizontal;
 lc; pqtd; av; av; av; av; pqtg; bc; TraitHorizontal;
 lc; pqtd; av; pqtg; bc; TraitHorizontal;
 st;
end.