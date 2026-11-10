{$mode macpas} program ConversionDecimalEnTernaire;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 42, page 254.                              *}
 {*                                                     *}
 {*******************************************************}

 procedure DecimalEnTernaire(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnTernaire(-N);
   end
  else if (N = 0) then
   begin
    ecrire('0'); translater(1, 0);
   end
  else if (N = 1) then
   begin
    ecrire('1'); translater(1, 0);
   end
  else if (N = 2) then
   begin
    ecrire('2'); translater(1, 0);
   end
 else {N >= 3}
   begin
    DecimalEnTernaire(N div 3);
    DecimalEnTernaire(N mod 3);
   end;
 end;
 
begin
 lg(7); DecimalEnTernaire(123456789); st;
end.

