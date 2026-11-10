{$mode macpas} program EnPassantParLaLorraine;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure Melodie;
  var
   I : integer;
 begin
  metronome(168); { mesure 6/8 }
  nuance(mezza_voce);
  
  
  for I := 1 to 2 do
   begin
    note(fa, noire); note(la, croche);
    note(octave + d0, noire); note(octave + d0, croche); 
    note(octave + d0, noire); note(octave + d0, croche); 
  
    note(octave + re, noire); note(si + bemol, croche);
    note(octave + d0, noire); note(octave + d0, croche);
  
    note(octave + re, noire); note(octave + re, croche); 
    note(octave + d0, noire_pointee + noire); silence(demi_soupir);
   end;
   
  note(octave + d0, noire); note(octave + d0, croche);
  
  note(octave + fa, noire);  note(octave + d0, croche);
  note(octave + d0, noire);  note(si + bemol, croche); 
  
  note(la, noire); note(sol, croche); note(la, noire); 
  note(la, croche);
  
  note(la, noire); note(octave + d0, croche);
  note(octave + d0, noire); note(si + bemol, croche); 
  
  note(la, noire); note(sol, croche); note(fa, noire); 
  note(la, croche);
  
  note(octave + d0, noire_pointee + noire); silence(demi_soupir);
  
  note(octave + re, noire); note(si + bemol, croche); 
  note(sol, noire); note(mi, croche);
  
  note(fa, blanche_pointee + noire);  silence(demi_soupir);
 end;
 
begin
 Melodie;
end.