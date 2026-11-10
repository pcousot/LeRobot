{$mode macpas} program OhMyDarlingClementine;
 uses Robot1, Robot2, Robot3;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}
 { Chanson traditionnelle am\'ericaine }
begin
 metronome(andante); nuance(mezza_voce);
 note(fa, croche_pointee); { Oh } note(fa, double_croche); { my }
 note(fa, noire); { dar- } note(d0, noire); { -ling, }
 note(la, croche_pointee); { oh } note(la, double_croche); { my }
 note(la, noire); { dar- } note(fa, noire); { -ling, }
 note(fa, croche); { oh }  note(la, croche); { my }
 note(octave + d0, noire_pointee); { dar- } 
 note(octave + d0, croche); { -ling, }
 note(si + bemol, croche); { cle- } note(la, croche); { -men- }
 note(sol, blanche); { -tine ! } 
 note(sol, croche_pointee); { Thou } note(la,double_croche); { art }
 note(si + bemol, noire); { lost } note(si + bemol, noire); { and }
 note(la, croche_pointee); { go- } note(sol, double_croche); { -ne }
 note(la, noire); { for } note(fa ,noire); { ever, }
 note(fa, croche); { Dread- } note(la, croche); { - }
 note(sol, noire_pointee); { -ful } note(d0, croche); { sorry }
 note(mi, croche); { Cle- } note(sol, croche ); { -men- }
 note(fa, blanche_pointee); { -tine. }
end.