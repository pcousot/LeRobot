{$mode macpas}  program DeLosCuatroMuleros;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 procedure Melodie; { andalouse }
  var I : integer;
 begin
  metronome(adagio);
  nuance(mezza_voce);
  for I := 1 to 2 do
   begin
    note(fa, double_croche); { De } note(fa, double_croche); { los }
    note(d0, double_croche); { cua- } note(fa, double_croche); { -tro } 
    note(sol, croche); { mu- }

    note(la, croche); { -le- } note(la, noire); { -ros, }
   end;
  
  note(sol, double_croche); { De } note(la, double_croche); { los }
  note(si + bemol, double_croche); { cua- }
  note(octave + re, double_croche); { -tro } 
  note(octave + d0, croche); { mu- }
  
  note(la, double_croche); { -le- } note(sol, double_croche); { -ros, }
  note(la, double_croche); { Ma- } 
  note(octave + d0, double_croche); { -mi- }
  note(si + bemol, croche); { -ta }
  
  note(la, double_croche); { mi- } note(fa, double_croche); { -a, }
  note(sol, double_croche); { Que } note(la, double_croche); { van } 
  note(sol, croche); { al }

  note(sol, double_croche); { a- } note(fa, double_croche); { -gua, }
  note(sol, double_croche); { Que } 
  note(la, double_croche); { van }
  note(sol, croche); { al }
  
  note(sol, croche); { a- } note(fa, noire); { -gua. }
 end; 
 
begin
 Melodie; 
end.