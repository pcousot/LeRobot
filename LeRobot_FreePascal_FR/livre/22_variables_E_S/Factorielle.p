{$mode macpas} program Factorielle;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Factorielle, page 273.                              *}
 {*                                                     *}
 {*******************************************************}
 const Nmin = 0; Nmax = 14;
 var N : integer; I : integer; F : longint;
begin
 { Montrer la fenêtre d'entrées-sorties de Pascal }
 modeTexte;
 { Lire la valeur de N (tel que Nmin <= N <= Nmax) au clavier }
 repeat 
  write('N = '); readln(N);
  if ((N < Nmin) or (N > Nmax)) then
   begin
    write('N doit etre compris entre '); write(Nmin); write(' et ');
    write(Nmax); write('! Recommencer.'); writeln;
   end;
 until ((Nmin <= N) and (N <= Nmax));
 { Calculer F = N! }
 F := 1;
 for I := 1 to N do 
 begin
  F := F * I;
 end;
 { Ecrire F }
 write('N! = '); write(F); readln;
end.