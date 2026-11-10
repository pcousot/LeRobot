{$mode macpas} program CarresArborescents;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Dessins récursifs, page 244.                        *}
 {*                                                     *}
 {*******************************************************}

 procedure Arbre(L : integer);
 begin
  if (L >= 1) then
   begin
    p3htg; avf(L); p3htd; Arbre(L div 2); phtd; avf(L); phtg; 
    p3htd; avf(L); p3htg; Arbre(L div 2); phtg; avf(L); phtd; 
   end;
 end;

 procedure Carres(L : integer);
  var I : integer;
 begin
 if L >= 1 then
  begin
   for I := 1 to 4 do
    begin
     Arbre(L); pqtd; 
    end;
   Carres(L div 2);
  end;
 end;
 
begin
 lg(1.2); Carres(32); st;
end.