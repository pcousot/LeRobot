{$mode macpas} program CourbeDeSierpinski;
 uses Robot1, Robot2, Robot3;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Courbes de Sierpinsky d'ordre 5, page 278.          *}
 {*                                                     *}
 {*******************************************************}
 const
  TailleGrille = 1;
  Ordre = 5;
  
 procedure Ligne (D : integer);
  { Avancer dans la direction D }
 begin
  pivoter(D); av;
 end;
 
 var H : integer;
 
 procedure A(K : integer); forward;
 procedure B(K : integer); forward;
 procedure C(K : integer); forward;
 procedure D(K : integer); forward;
 
 procedure A;
 begin
  if K > 0 then
   begin
    A(K - 1); pivoter(SudEst);  av; 
    B(K - 1); pivoter(Est);     avf(2);
    D(K - 1); pivoter(NordEst); av; 
    A(K - 1); 
   end;
 end;
 
 procedure B;
 begin
  if K > 0 then
   begin
    B(K - 1); pivoter(SudOuest); av; 
    C(K - 1); pivoter(Sud);      avf(2); 
    A(K - 1); pivoter(SudEst);   av; 
    B(K - 1); 
   end;
 end;
 
 procedure C;
 begin
  if K > 0 then
   begin
    C(K - 1); pivoter(NordOuest); av; 
    D(K - 1); pivoter(Ouest);     avf(2); 
    B(K - 1); pivoter(SudOuest);  av; 
    C(K - 1); 
   end;
 end;
 
 procedure D;
 begin
  if K > 0 then
   begin
    D(K - 1);  pivoter(NordEst);   av; 
    A(K - 1); pivoter(Nord);      avf(2);
    C(K - 1); pivoter(NordOuest); av; 
    D(K - 1); 
   end;
 end;
 
 procedure CourbeSierpinski(I : integer);
 begin
    A(I); pivoter(SudEst);    av; 
    B(I); pivoter(SudOuest);  av; 
    C(I); pivoter(NordOuest); av; 
    D(I); pivoter(NordEst);   av; 
 end;
 
begin
 eh; ag; lg(TailleGrille); pe; lc; av; bc; pn; CourbeSierpinski(Ordre); st;
end.