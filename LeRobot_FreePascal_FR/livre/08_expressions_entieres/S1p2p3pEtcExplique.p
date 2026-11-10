{$mode macpas} program S1p2p3pEtcExplique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Calcul de 1 + 2 + 3 + ... + 10, page 100.           *}
 {*                                                     *}
 {*******************************************************}

 const Nmax = 10;
 
 procedure Carre;
 begin
  av; pqtd; av; pqtd; av; pqtd; av; pqtd; av; 
 end;
  
 var
  I : integer;
  J : integer; 

begin
 eb; ag; lc; av; pqtd; av; pqtg; bc; 
 for I := 1 to Nmax do
  begin
   for J := 1 to I do 
    begin
     Carre;
    end;
   translater(1, -I);
  end;
  { Carre extérieur }
  avf(Nmax + 1); pqtg;
  avf(Nmax); pqtg;
  avf(Nmax + 1); pqtg;
  avf(Nmax); pqtg;
  lc; 
  avf(Nmax + 1); pqtg;
  avf(Nmax); pqtg;
  p3htd; cc(jaune); peindre;
 st;
end.