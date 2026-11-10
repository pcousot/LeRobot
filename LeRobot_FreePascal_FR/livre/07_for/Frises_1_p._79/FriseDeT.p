{$mode macpas} program FriseDeT;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 
 procedure DessinerT;
 begin
  { Côté gauche }
  av; pqtg; av; pqtg; av; pqtd; av;
  { Dessus }
  pqtd; av; av; av; pqtd;
  { Côté droit }
  av; pqtd; av; pqtg; av; pqtg; av;
 end;
 
 var T : integer;
 
begin
 ag; pqtd;
 for T:= 1 to 10 do
  begin 
   DessinerT;
   av; { passer au T suivant }
  end;
 st;
end.