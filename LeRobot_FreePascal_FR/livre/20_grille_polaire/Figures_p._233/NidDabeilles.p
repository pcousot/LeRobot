{$mode macpas} program NidDabeilles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage du plan avec des polygones, page 233.        *}
 {*                                                     *}
 {*******************************************************}

 const
  LgLigne = 8;
  NbLignes = 9;
 
 procedure Hexagone;
  var I : integer;
 begin
  for I := 1 to 5 do
   begin
    av; rt(-60);
   end;
  av; translater(2, 0); rt(-60);
 end;
 
 procedure Ligne(L : integer);
  var C : integer;
 begin
  for C := 1 to LgLigne do
   begin
    Hexagone;
   end;
  rt(-60);
  if odd(L) then
   begin
    translater((-(2 * LgLigne) + 1), -1);
   end
  else
   begin
    translater((-(2 * LgLigne) - 1), -1);
   end;
  rt(60); translater(0, -1);
 end;
 
 procedure Pavage;
  var L : integer;
 begin
  for L := 1 to NbLignes do
   begin
    Ligne(L);
   end;
 end;
 
begin
 eh; ag; translater(0, -2); Pavage; st;
end.