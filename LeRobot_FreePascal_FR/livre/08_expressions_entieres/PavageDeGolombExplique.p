{$mode macpas} program PavageDeGolombExplique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de Golomb, page 100.                         *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre (N : integer);
  var I : integer;
 begin
  for I := 1 to 4 do 
   begin
    avf(N); pqtg;
   end;
   avf(N); 
 end;
 
 procedure QuardDeCouronnePaire (N : integer);
  var I : integer;
 begin
  for I := 1 to (N div 2) do
   begin
    Carre(N);
   end;
  avf(N div 2); pqtg; avf(N div 2);
  for I := 1 to (N div 2) do
   begin
    Carre(N);
   end;
  pqtg; avf((N div 2) * (N + 1)); 
  pqtg; avf((N div 2) * (N + 1)); 
 end;
 
 procedure QuardDeCouronneImpaire (N : integer);
  var I : integer;
 begin
  for I := 1 to (N div 2) do
   begin
    Carre(N);
   end;
  avf(N); pqtg; avf(N);
  for I := 1 to (N div 2) do
   begin
    Carre(N);
   end;
  pqtg; avf(((N + 1) div 2) * N); 
  pqtg; avf(((N + 1) div 2) * N); 
 end;
 
 procedure Pavage(N : integer);
  var I : integer;
 begin
  pe;
  for I := 1 to N do
   begin
    if odd(I) then
     begin
      QuardDeCouronneImpaire (I);
     end
    else
     begin
      QuardDeCouronnePaire (I);
     end;
    if (I <> N) then
     begin
      avf(I + 1); pqtg;
     end;
   end;
 end;
 
 procedure MarquerLeBord(N : integer);
  var L : real; I, J, M : integer;
 begin
  L := VallgX;
  if odd(N) then
    M := ((N + 1) div 2) * N
  else
    M := (N + 1) * (N div 2);
  for I := 1 to 4 do begin
    for J := 1 to M do begin
     lg(2); pqtd; av; pdt; av; pqtd; lg(L); av; 
    end;
    lg(2); pqtd; av; pdt; av; pqtd; lg(L);
    pqtg; 
  end;
 end;
 
begin 
 eh; ag; lc; pdt; av; pdt; bc; lg(3); Pavage(10); pqtg; MarquerLeBord(10);
 st;
end.