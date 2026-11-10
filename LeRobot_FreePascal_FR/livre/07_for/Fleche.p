{$mode macpas} program Fleche;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Fleche, page 71.                                    *}
 {*                                                     *}
 {*******************************************************}

 procedure Plume;
 begin
  av; p3htg; av; lc; p3htg; av; av; p3htg; bc; av; phtd;
 end;
  
 procedure Empennage;
  var I : integer;
 begin
  for I := 1 to 5 do
   begin
    Plume;
   end;
 end;
 
 procedure Tige;
  var I : integer;
 begin
  for I := 1 to 10 do
   begin
    av;
   end;
 end;
 
 procedure Pointe;
 begin
  pqtg; av; p3htd; av; pqtd; av; p3htd; av; 
 end;
 
begin
 eb; Empennage; Tige; Pointe; st; 
end.