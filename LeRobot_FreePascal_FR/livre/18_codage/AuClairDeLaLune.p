{$mode macpas} program AuClairDeLALune;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* AuClairDeLALune, pages 208-209.                     *}
 {*                                                     *}
 {*******************************************************}

 { Au clair de la lune (attribué à Jean-Baptise Lulli) }
 
 procedure Strophe;
  var I : integer;
 begin
  metronome(moderato); { mesure 4 / 4 } nuance(piano);
  for I := 1 to 2 do 
   begin
    note(sol, noire); { Au / Prê-} note(sol, noire); { clair / -te }  
    note(sol, noire); { de / moi } note(la, noire); { la / ta }
    note(si, blanche); { lu- / plu- } note(la, blanche); { ne / -me }
    note(sol, noire); { Mon / Pour } note(si, noire); {a- / é- }
    note(la, noire); { mi / -crire } note(la, noire); { Pier- / un }
    note(sol, ronde); { -rot. / mot. }
   end;
  note(la, noire); { Ma } note(la, noire); { chan- }
  note(la, noire); { -delle }  note(la, noire); { est }
  note(mi, blanche); { mor- } note(mi, blanche); { -te. }
  note(la, noire); {  Je } note(sol, noire); { n'ai }
  note(fa + diese, noire); { plus } note(mi, noire); { de }
  note(re, ronde); { feu. }
  note(sol, noire); { Ou- } note(sol, noire); { -vre }
  note(sol, noire); { moi } note(la, noire); { ta }
  note(si, blanche); { por- } note(la, blanche); { -te, }
  note(sol, noire); { Pour } note(si, noire); { l'a- }
  note(la, noire); { -mour } note(la, noire); { de }
  note(sol, ronde); { Dieu. } silence(pause);
 end;
 
 procedure Chanson;
  var J : integer;
 begin
  for J := 1 to 3 do
   begin
    Strophe;
   end;
 end;
 
begin
 Chanson;
end.