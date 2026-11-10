{$mode macpas} program FloconTernaire;
 uses Robot1, Robot2;

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
  if (L > 1) then
   begin
    tl(L div 3); rt(45); 
    Arbre(L div 3); 
    rt(-45); 
    Arbre(L div 3); 
    rt(-45); 
    Arbre(L div 3); 
    rt(45); tl(-(L div 3));
   end;
 end;
 
 procedure Flocon(L : integer);
 begin
  Arbre(L); rt(45);
  Arbre(L); rt(45);
  Arbre(L); rt(45);
  Arbre(L); rt(45);
  Arbre(L); rt(45);
  Arbre(L); rt(45);
  Arbre(L); rt(45);
  Arbre(L); rt(45);
 end;

begin
 Flocon(162); Flocon(54); st;
end.