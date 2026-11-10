{$mode macpas} program AvSansSortirDuCadre;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Le robot est-il au bord du cadre ?, page 188.       *}
 {*                                                     *}
 {*******************************************************}

 procedure AvSansSortir;
 begin
  if (not tb) then
   begin
    av; 
   end;
 end;
 
 var I : integer;
 
begin
 for I := 1 to 1025 do
  begin
   AvSansSortir;
  end;
 st; 
end.