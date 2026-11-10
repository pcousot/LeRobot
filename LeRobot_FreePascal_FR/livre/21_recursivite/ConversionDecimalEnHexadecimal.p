{$mode macpas} program ConversionDecimalEnHexadecimal;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 42, page 254.                              *}
 {*                                                     *}
 {*******************************************************}

 procedure DecimalEnHexadecimal(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnHexadecimal(-N);
   end
  else if (N >= 16) then
   begin
    DecimalEnHexadecimal(N div 16);
    DecimalEnHexadecimal(N mod 16);
   end
  else if (N = 15) then
   begin
    ecrire('F'); translater(1, 0);
   end
  else if (N = 14) then
   begin
    ecrire('E'); translater(1, 0);
   end
  else if (N = 13) then
   begin
    ecrire('D'); translater(1, 0);
   end
  else if (N = 12) then
   begin
    ecrire('C'); translater(1, 0);
   end
  else if (N = 11) then
   begin
    ecrire('B'); translater(1, 0);
   end
  else if (N = 10) then
   begin
    ecrire('A'); translater(1, 0);
   end
  else
   begin
    ecrire(EntierEnChaine(N)); translater(1, 0);
   end;
 end;
 
begin
 lg(7); DecimalEnHexadecimal(123456789); st;
end.

