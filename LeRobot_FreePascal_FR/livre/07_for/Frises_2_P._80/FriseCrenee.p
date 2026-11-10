{$mode macpas} program FriseCrenee;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure MotifCrene;
  { Le robot étant orienté à l'est, dessiner un motif créné }
 begin
   av; pqtd; av; av; pqtg; av; pqtd; vg; 
   vg; pqtd; av; pqtg; av; av; pqtd; av; 
 end;
 

 procedure Frise;
  { Le robot étant orienté au nord, dessiner une frise de 7 }
  { motifs crénés }
  var I :integer;
 begin
  pqtd; 
  for I := 1 to 7 do
   begin
    MotifCrene;
   end;
 end;
 
begin
 ag; Frise; st; 
end.