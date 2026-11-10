{$mode macpas} program ConversionsEnBinaire;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 35, page 210.                              *}
 {*                                                     *}
 {*******************************************************}

 function DecimalEnBinaire(N : longint) : string;
 begin
  if (N < 0) then
   begin
    DecimalEnBinaire := concat('-', DecimalEnBinaire(-N));
   end
  else if (N = 0) then
   begin
    DecimalEnBinaire := '0';
   end
  else if (N = 1) then
   begin
    DecimalEnBinaire := '1';
   end
 else {N >= 2}
   begin
    DecimalEnBinaire := concat(DecimalEnBinaire(N div 2), DecimalEnBinaire(N mod 2));
   end;
 end;
 
 function DecimalEnOctet(N : longint) : string;
 begin
  if (N < 0) then
   begin
    message('Nombre négatif dans ''DecimalEnOctet'''); st;
   end
  else if (N < 2) then
   begin
    DecimalEnOctet := concat('0000000', DecimalEnBinaire(N), ' ');
   end
  else if (N < 4) then
   begin
    DecimalEnOctet := concat('000000', DecimalEnBinaire(N), ' ');
   end
  else if (N < 8) then
   begin
    DecimalEnOctet := concat('00000', DecimalEnBinaire(N), ' ');
   end
  else if (N < 16) then
   begin
    DecimalEnOctet := concat('0000', DecimalEnBinaire(N), ' ');
   end
  else if (N < 32) then
   begin
    DecimalEnOctet := concat('000', DecimalEnBinaire(N), ' ');
   end
  else if (N < 64) then
   begin
    DecimalEnOctet := concat('00', DecimalEnBinaire(N), ' ');
   end
  else if (N < 128) then
   begin
    DecimalEnOctet := concat('0', DecimalEnBinaire(N), ' ');
   end
  else if (N < 256) then
   begin
    DecimalEnOctet := concat(DecimalEnBinaire(N), ' ');
   end
  else
   begin
    message('Nombre >= 256 dans ''DecimalEnOctet'''); st;
   end
 end;

begin
 lg(7);
 message('Ecriture de  127  en binaire');
 ecrire(DecimalEnBinaire(127)); 
 eb; ag; MarquerUnePause;
 cf(Blanc);
 message(concat('Ecriture de  ',DecimalEnBinaire(13653),'  en décimal'));
 ecrire(EntierEnChaine(13653));
 eb; ag; MarquerUnePause;
 cf(Blanc);
 message(concat(DecimalEnOctet(ord('D')), DecimalEnOctet(ord('e')), 
                DecimalEnOctet(ord('s')), DecimalEnOctet(ord('c')), 
                DecimalEnOctet(ord('a')), DecimalEnOctet(ord('r')), 
                DecimalEnOctet(ord('t')), DecimalEnOctet(ord('e')), 
                DecimalEnOctet(ord('s'))));
 ecrire('Descartes');
 eb; ag; MarquerUnePause;
end.

