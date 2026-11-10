{$mode macpas} program OTannenbaum;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* O Tannenbaum (chanson allemande), pageS 213 et 214- *}
 {* 215.                                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Refrain;
 begin
  note(d0, noire); { O } note(fa, croche_pointee); { Tan- } 
  note(fa, double_croche); { -nen— } note(fa, noire); { -baum, }
  note(sol, noire); { o } note(la, croche_pointee); { Tan- } 
  note(la, double_croche); { -nen— } note(la, noire_pointee); 
  { -baum, } note(fa, croche); { wie } note(sol, croche); { treu } 
  note(la, croche); { sind } note(si+bemol, noire); { dei- } 
  note(mi, noire); { -ne } note(sol, noire); { Blät- } 
  note(fa, noire); { -ter ! }
 end;
 
 procedure Couplet;
 begin
  silence(demi_soupir); note(d0 + octave, croche); { Du }
  note(d0 + octave, croche); { grünst } note(la, croche); { nicht }
  note(re+octave, noire_pointee); { nur } note(d0 + octave, croche); 
  { zur } note(d0 + octave, croche); { Som- } 
  note(si + bemol, croche); { -mer- } note(si + bemol, noire_pointee);
  { -zeit } note(si + bemol, croche); { Nein, } 
  note(si + bemol, croche); { auch } note(sol, croche); { im } 
  note(d0+ octave, noire_pointee); { Win- } note(si + bemol, croche);
  { -ter } note(si + bemol, croche); { wenn } note(la, croche); { es }
  note(la, noire); { schneit. }
 end;
 
 procedure Chanson { allemande };
 begin
  metronome(adagio); nuance(mezza_voce); Refrain; Couplet; Refrain; 
 end; 
  
begin
 Chanson;
end.