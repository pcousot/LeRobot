{$mode macpas} program ConversionDecimalEnOctal;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 42, page 254.                              *}
 {*                                                     *}
 {*******************************************************}

 procedure DecimalEnOctal(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnOctal(-N);
   end
  else if (N >= 8) then
   begin
    DecimalEnOctal(N div 8);
    DecimalEnOctal(N mod 8);
   end
  else
   begin
    ecrire(EntierEnChaine(N)); translater(1, 0);
   end;
 end;
 
begin
 lg(7); DecimalEnOctal(123456789); st;
end.

