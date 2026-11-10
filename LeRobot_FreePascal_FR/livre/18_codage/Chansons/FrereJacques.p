{$mode macpas} program FrereJacques;
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
  metronome(andante); { mesure 4/4 }
  nuance(mezza_voce);
  for I := 1 to 2 do
   begin
    note(fa,  noire);
    note(sol, noire);
    note(la,  noire);
    note(fa,  noire);
   end;
  for I := 1 to 2 do
   begin
    note(la, noire);
    note(si + bemol, noire);
    note(octave + d0, blanche);
   end;
  for I := 1 to 2 do
   begin
    note(octave + d0, croche_pointee);
    note(octave + re, double_croche);
    note(octave + d0, croche);
    note(si + bemol,  croche);
    note(la, noire);
    note(fa, noire);
   end;
  for I := 1 to 2 do
   begin
    note(fa, noire);
    note(d0, noire);
    note(fa, blanche);
   end;
 end;
 
begin
 Melodie;
end.