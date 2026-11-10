{$mode macpas} program ChevaliersDeLaTableRonde;
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
  metronome(moderato); { mesure 3/4 }
  nuance(forte);
  
  for I := 1 to 2 do 
   begin
    note(re, croche); note(sol, croche);
  
    note(sol, noire); note(sol, croche); note(si, croche);
    note(si, croche); note(octave + re, croche);
  
    note(octave + re, noire); note(si, noire); note(si, croche); 
    note(si, croche); 
  
    note(la, noire); note(re, croche); note(la, croche); 
    note(la, croche); note(la, croche); 
  
    note(sol, noire); silence(soupir);
  end;
  
  for I := 1 to 2 do 
   begin
    note(octave + re, croche); note(octave + re, croche);
   
    note(octave + mi, noire); note(octave + d0, croche); 
    note(octave + d0, croche); 
  
    note(octave + d0, noire); note(octave + mi, croche); 
    note(octave + mi, croche); 
  
    note(octave + re, noire); note(si, croche);  note(si, croche); 
  
    note(si, noire); note(octave + re, croche);
    note(octave + re, croche); 
  
    note(octave + d0, noire); note(la, croche); 
    note(octave + re, croche); note(octave + re, croche);
    note(octave + re, croche);
    
    if I = 1 then
     begin
      note(si, noire);
     end
    else
     begin
      note(sol, noire);
     end;
    silence(soupir);
   end;
 end;
 
begin
 Melodie;
end.