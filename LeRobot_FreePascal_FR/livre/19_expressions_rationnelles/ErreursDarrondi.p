{$mode macpas} program ErreursDarrondi;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Erreurs d'arrondi, pages 219-220.                   *}
 {*                                                     *}
 {*******************************************************}
begin
 writeln('sqr(sqr(sqr(sqr(sqr(sqrt(sqrt(sqrt(sqrt(sqrt(2)))))))))) = '); 
 writeln('  ', sqr(sqr(sqr(sqr(sqr(sqrt(sqrt(sqrt(sqrt(sqrt(2)))))))))) : 30); 
 writeln('<> 2.000000000000000000000e+0 ! '); 
 writeln;
 writeln('Terminer en tapant ''retour-chariot''');
 readln;
end.