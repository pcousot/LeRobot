{$mode macpas} program LePontDAvignon;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure Refrain;
 begin
  note(sol, croche); note(sol, croche); 
  
  note(sol, noire); note(la, croche); note(la, croche); 
  
  note(la, noire); note(si, croche); note(octave + ut, croche); 
  
  note(octave + re, croche); note(sol, croche); 
  note(fa + diese, croche); note(sol, croche); 
  
  note(la, croche); note(re, croche); note(sol, croche); 
  note(sol, croche); 
  
  note(sol, noire); note(la, croche); note(la, croche); 
  
  note(la, noire); note(si, croche); note(octave + ut, croche);
  
  note(octave + re, croche); note(sol, croche); note(la, croche); 
  note(fa + diese, croche); 
  
  note(sol, noire); silence(soupir);
 end;
 
 procedure Couplet;
 begin
  note(sol, double_croche); note(sol, double_croche); 
  note(sol, double_croche); note(sol, double_croche); 
  
  note(la, blanche);
  
  note(sol, croche); silence(demi_soupir); note(sol, double_croche); 
  note(sol, double_croche); note(sol, double_croche);
  note(sol, double_croche);
  
  note(la, blanche);

  note(sol, noire); silence(soupir);
 end;
 
 procedure Melodie;
  var I : integer;
 begin
  metronome(76); { mesure 2/4 }
  nuance(mezza_voce);
  for I := 1 to 4 do
   begin
    Refrain; Couplet;
   end;
  Refrain;
 end;
 
begin
 Melodie;
end.