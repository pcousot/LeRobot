{$mode macpas} program PavesRecursifs;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavés récursifs, page 245 et 246.                   *}
 {*                                                     *}
 {*******************************************************}

 procedure Pave(N : integer);
 begin
  if N = 0 then
   begin
    { Dessiner un carré de côté 0 }   
    dp;
   end
  else
   begin
    { Dessiner un carré de côté N }
    avf(N); pqtd; avf(N); pqtd; avf(N); pqtd; avf(N); pqtd;
    { Paver l'intérieur } 
    Pave(N - 1);
   end;
 end;
 
begin
 eb; ag; Pave(10); st;
end.