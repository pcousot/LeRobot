{$mode macpas} program Alouette;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure Melodie;
  var I : integer;
 begin
  metronome(moderato); { mesure 4/4 }
  nuance(mezza_voce);
  
  { Refrain }
  note(sol, noire_pointee); note(la, croche); note(si, noire); 
  note(si, noire);
  
  note(la, croche); note(sol, croche); note(la, croche); 
  note(si, croche); note(sol, noire); note(re, noire);
  
  note(sol, noire_pointee); note(la, croche); note(si, noire); 
  note(si, noire);
  
  note(la, croche); note(sol, croche); note(la, croche);
  note(si, croche); note(sol, noire); silence(soupir);
  
  { Couplet }
  note(sol, croche); note(sol, croche); note(sol, croche); 
  note(sol, croche); note(sol, croche); note(si, croche); 
  note(octave + re, noire); 
  
  note(octave + re, croche); note(octave + mi, croche); 
  note(octave + re, croche); note(octave + d0, croche); 
  note(si, croche); note(la, croche); note(sol, noire); 

  for I := 1 to 2 do
   begin
    note(octave + re, croche); note(octave + re, croche); 
    note(octave + re, noire); note(re, croche);  
    note(re, croche);  note(re, noire); 
   end;
  
  note(octave + re, ronde);
 end;
 
begin
 Melodie;
end.