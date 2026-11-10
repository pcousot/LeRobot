{$mode macpas} program PavageDeAl_Karagi;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de Al-Karagi, page 99.                       *}
 {*                                                     *}
 {*******************************************************}
 var
  I : integer;
  J : integer; 
  K : integer;
  L : integer;
begin
 lg(3); eb; ag;
 for I := 1 to 10 do
  begin
   { Dessiner un carré de taille de côté 1 + 2 + ... + I }
   for J := 1 to 4 do
    begin
     for K := 1 to I do 
      begin
       for L := 1 to K do
        begin
         av;
        end;
      end;
     pqtd; 
    end;
  end;
 st;
end.