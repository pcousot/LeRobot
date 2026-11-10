{$mode macpas} program JaiDuBonTabac;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure DebutPremierePartie;
 begin
  note(re, croche); note(mi, croche); note(fa + diese, croche); 
  note(re, croche); 
  
  note(mi, noire); note(mi, croche); note(fa + diese, croche); 
  
  note(sol, noire); 
 end;

 procedure PremierePartie;
 begin
  DebutPremierePartie; note(sol, noire); 
  
  note(fa + diese, noire); note(fa + diese, noire); 
  
  DebutPremierePartie; note(la, noire); 
  
  note(re, blanche);
 end;
 
 procedure DeuxiemePartie;
  var I : integer;
 begin
  for I := 1 to 2 do
   begin 
    note(la, noire); note(la, croche); note(sol, croche);
  
    note(fa + diese, noire); note(mi, croche); 
    note(fa + diese, croche); 
  
    note(sol, noire); note(la, noire);

    note(mi, blanche); 
  end;
 end;
 
 procedure Melodie;
 begin
  metronome(moderato); { mesure 2/4 } nuance(mezza_voce);
  PremierePartie; DeuxiemePartie; PremierePartie;
 end;
 
begin
 Melodie;
end.