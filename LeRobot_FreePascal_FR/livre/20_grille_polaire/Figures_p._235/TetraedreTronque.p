{$mode macpas} program TetraedreTronque;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développement  du  tétraèdre  tronqué, pages 235 et *}
 {* 239-240.                                            *}
 {*                                                     *}
 {*******************************************************}

 const LgCote = 24;

 procedure FaceEtCoin;
  var I: integer;
 begin
  { Hexagone }
  pqtd; lgRT(LgCote, 60); phtg;
  for I:=1 to 6 do
   begin
    av; rt(60);
   end;
  { Triangle équilatéral }
  pdt; av; pqtd; av; 
 end;
 
 procedure DeveloppementDuTetraedreTronque;
  var I: integer;
 begin
  for I :=1 to 2 do
   begin
    { Face et coin en bas }
    FaceEtCoin; lc; p3htd; avf(2); phtg; av; p3htd; bc; 
    { Face et coin en haut }
    FaceEtCoin; lc; av; phtg; avf(2); pqtg; bc; 
   end;
 end; 

begin
 DeveloppementDuTetraedreTronque; st;
end.