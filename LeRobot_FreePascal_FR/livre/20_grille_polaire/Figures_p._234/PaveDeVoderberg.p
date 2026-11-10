{$mode macpas} program PaveDeVoderberg;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavé de Voderberg, page 234.                        *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleQuadrillage = 90;
  Theta = 15;
  
 procedure Pave;
  { Dessiner un pavé de Voderberg en commençant par la pointe. }
 begin
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(11 * Theta);
  av; pdt; rt(7 * Theta);
  av; pdt; rt(4 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; rt(13 * Theta);
  av; pdt; 
 end;
  
begin
 eb; ag; lg(TailleQuadrillage); rt(-20); Pave; st;
end.