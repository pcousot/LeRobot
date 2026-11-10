{$mode macpas} program NumerationRomaine;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 43, page 277.                              *}
 {*                                                     *}
 {*******************************************************}

 const 
  X = 3; { Taille de la grille }
 
 procedure Espacement (N : integer);
 begin
  lc; pqtd; avf(N); pqtg; bc;  
 end;
 
 procedure Un;
 begin
  avf(6); avf(- 6);
  Espacement(2);
 end;
  
 procedure Cinq;
 begin
  lc; avf(6); bc; p3htd; lgx(X * 2); lgY(X * 6); av; 
  pqtg; av; lc; p3htd; av; pdt; bc;lg(X);
  Espacement(2);  
 end;

 procedure Dix;
 begin
  lgX(X * 4); lgY(X * 6); phtd; av; lc; p3htg; av; bc; 
  p3htg; av; lc; p3htg; bc; lg(X);
  Espacement(2);  
 end;
  
 procedure Cinquante;
 begin
  avf(6); avf(- 6); pqtd; avf(4);
  pqtg;
  Espacement(2);
 end;

procedure Cent;
 begin
  lc; lgX(X * 4); lgY(X * 2);phtd; av; bc; lgX(X * 2); 
  p3htd; vd; lgY(X * 3); vd; vd; lgY(X * 2); vd; lc; 
  avf(2); pdt; bc; lg(X);
  Espacement(2);  
 end;

 procedure CinqCents;
 begin
  avf(6); pqtd; avf(1); lg(X * 3); vd; vd; lg(X); av; 
  lc; avf(- 4); pqtd; bc;
  Espacement(2);
 end;
  
 procedure Mille;
 begin
  avf(6); lgX(X * 2); lgY(X * 5); p3htd; av; pqtg;  av; 
  lg(X); p3htd; avf(6); pdt;
  Espacement(2); 
 end;
 
 procedure Surligner (N : integer);
 begin
  lc; avf(8); pqtg; avf(2); bc; avf(N - 2); avf(- (N - 2)); 
  lc; avf(- 2); pqtd; avf(- 8); bc;
 end;
 
 procedure DebutFacteurCentMille;
 begin
  avf(8); pqtd; avf(2); avf(- 2); pqtg; avf(- 8);
  Espacement(2); 
 end;
 
 procedure FinFacteurCentMille;
 begin
  avf(8); pqtg; avf(2); avf(- 2); pqtd; avf(- 8);
  Espacement(4); 
 end;
 
 procedure EcrireNombreEnRomain (N : longint);
 begin
  if (N >= 1000) then
   begin
    Mille;  EcrireNombreEnRomain(N - 1000);
   end
  else if (N >= 950) then
   begin
    Cinquante;  Mille; EcrireNombreEnRomain(N - 950);
   end
  else if (N >= 900) then
   begin
    Cent;  Mille; EcrireNombreEnRomain(N - 900);
   end
  else if (N >= 500) then
   begin
    CinqCents;  EcrireNombreEnRomain(N - 500);
   end
  else if (N >= 400) then
   begin
    Cent;  CinqCents; EcrireNombreEnRomain(N - 400);
   end
  else  if (N >= 100) then
   begin
    Cent;  EcrireNombreEnRomain(N - 100);
   end
  else if (N >= 90) then
   begin
    Dix;  Cent; EcrireNombreEnRomain(N - 90);
   end
  else if (N >= 50) then
   begin
    Cinquante;  EcrireNombreEnRomain(N - 50);
   end
  else if (N >= 40) then
   begin
    Dix;  Cinquante; EcrireNombreEnRomain(N - 40);
   end
  else if (N >= 10) then
   begin
    Dix;  EcrireNombreEnRomain(N - 10);
   end
  else if (N >= 9) then
   begin
    Un;  Dix;
   end
  else if (N >= 5) then
   begin
    Cinq;  EcrireNombreEnRomain(N - 5);
   end
  else if (N >= 4) then
   begin
    Un;  Cinq; 
   end
  else if (N >= 1) then
   begin
    Un;  EcrireNombreEnRomain(N - 1);
   end
  else if (N = 0) then
   begin
   end;
   
 end;
 
 function Largeur (N : longint) : integer;
 begin
  Largeur := 0;
  if (N >= 1000) then
   begin
    Largeur := 6 + Largeur(N - 1000);
   end
  else if (N >= 950) then
   begin
    Largeur := 2 * 6 + Largeur(N - 950);
   end
  else if (N >= 900) then
   begin
    Largeur := 2 * 6 + Largeur(N - 900);
   end
  else if (N >= 500) then
   begin
    Largeur := 6 + Largeur(N - 500);
   end
  else if (N >= 400) then
   begin
    Largeur := 2 * 6 + Largeur(N - 400);
   end
  else  if (N >= 100) then
   begin
    Largeur := 6 + Largeur(N - 100);
   end
  else if (N >= 90) then
   begin
    Largeur := 2 * 6 + Largeur(N - 90);
   end
  else if (N >= 50) then
   begin
    Largeur := 6 + Largeur(N - 50);
   end
  else if (N >= 40) then
   begin
    Largeur := 2 * 6 + Largeur(N - 40);
   end
  else if (N >= 10) then
   begin
    Largeur := 6 + Largeur(N - 10);
   end
  else if (N >= 9) then
   begin
    Largeur := 2 + 6;
   end
  else if (N >= 5) then
   begin
    Largeur := 6 + Largeur(N - 5);
   end
  else if (N >= 4) then
   begin
    Largeur := 2 + 6;
   end
  else if (N >= 1) then
   begin
    Largeur := 2 + Largeur(N - 1);
   end
  else if (N = 0) then
   begin
   end;
  end;

 procedure NombreEnRomain (N : longint);
 begin
  if N >= 500000000 then
   begin
    writeln('Trop grand pour écrire en chiffres romains.');
   end
  else if N >= 100000 then
   begin
    DebutFacteurCentMille;
    EcrireNombreEnRomain(N div 100000);
    Surligner(Largeur(N div 100000));
    FinFacteurCentMille;
    NombreEnRomain(N mod 100000);
    end
  else if N < 5000 then
   begin
     EcrireNombreEnRomain(N);
   end
  else
   begin
    EcrireNombreEnRomain(N div 1000);
    Surligner(Largeur(N div 1000));
    Espacement(2);
    EcrireNombreEnRomain(N mod 1000);
   end;
 end;

 var NombreACoder : longint;
 
begin
 modeTexte; write('Nombre à coder N = '); readln(NombreACoder);
 lg(X); ag; Espacement(2);
 NombreEnRomain(NombreACoder);
 st;
end.