{$mode macpas} program ConversionDecimalEnBinaire;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 42, pages 254 et 266.                      *}
 {*                                                     *}
 {*******************************************************}

 procedure DecimalEnBinaire(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnBinaire(-N);
   end
  else if (N = 0) then
   begin
    ecrire('0'); translater(1, 0);
   end
  else if (N = 1) then
   begin
    ecrire('1'); translater(1, 0);
   end
 else {N >= 2}
   begin
    DecimalEnBinaire(N div 2);
    DecimalEnBinaire(N mod 2);
   end;
 end;
 
begin
 lg(7); DecimalEnBinaire(123456789); st;
end.

