{$mode macpas} program SpiraleDeBaravelle;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirale de Baravelle; page 220.                     *}
 {*                                                     *}
 {*******************************************************}
 const
  N = 7;
  DeuxPuissanceN = 128;
  
 procedure Carre;
 begin
  avf(2); pqtd; avf(2); pqtd; avf(2); pqtd; avf(2); pqtd; 
 end;

 procedure Spirale;
  var I : integer;
 begin
  for I := 1 to N do
   begin
    av; p3htd; av; p3htd; av; pqtd; av; phtd; 
    lg(valLgX / 2);
    av; p3htd; av; av; p3htd; av; pqtd; av; phtd; 
   end;
 end;

begin
 lg(1); eb; ag; lg(DeuxPuissanceN); Carre; Spirale; 
 lg(1); eb; ag; pn; lg(DeuxPuissanceN); avf(2); pqtd; avf(2); pqtd; Spirale; 
 lg(1); eb; ag; pn; lg(DeuxPuissanceN); avf(2); phtg; peindre;
 lg(1); eb; ag; pe; lg(DeuxPuissanceN); avf(2); phtd; peindre;
 st;
end.