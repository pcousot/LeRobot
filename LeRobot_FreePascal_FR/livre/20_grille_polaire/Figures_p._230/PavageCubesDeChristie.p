{$mode macpas} program PavageCubesDeChristie;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavages de triangles, losanges et carrés, page 230. *}
 {*                                                     *}
 {*******************************************************}

 { Pavage de A. H. Christie, 'Pattern design. An introduction to the }
 { study of formal ornament', Clarendon press, Oxford, 1929 ; réimp- }
 { ression Dover, New York, 1969.                                    }
 
 const
  LongueurCote = 13;
  Angle = 30; 
  NbLignes = 7;
  NbColonnes = 7;
  
 procedure Cube;
 begin
  pne; av; pqtd; av; pqtd; av; pqtd; av;
  ps; avf(2); phtg; av; p3htg; avf(2); 
  phtd; peindre; pqtd; cc(violet); peindre; cc(noir); phtd; 
  avf(2); p3htg; av; phtg; avf(2);
 end;
 
 procedure Pavage;
  var 
   I : integer;
   J : integer;
 begin
  lgRT(LongueurCote, Angle); 
  eh;
  for I := 1 to NbLignes do
   begin
    ag; lc;
    if odd(I) then
     begin
      ps; avf(2); pse; av;
     end
    else
     begin
      pse; av; ps; av; psw; av;
     end;
    bc;
    for J := 1 to NbColonnes do
     begin
      Cube;
     end;
   end;
 end;
 
begin
 Pavage; st;
end.