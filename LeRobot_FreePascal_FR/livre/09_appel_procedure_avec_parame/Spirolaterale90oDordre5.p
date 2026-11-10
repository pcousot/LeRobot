{$mode macpas} program Spirolaterale90oDordre5;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirolatérale à 90 degrés d'ordre 5, page 107.      *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner une courbe spirolatérale de Frank C. Odds à 90 degrés }
 { d'ordre 5.                                                     }
 var
  I : integer;
  J : integer;
begin
 for I := 1 to 4 do 
  begin
   for J := 1 to 5 do
    begin
     avf(J); pqtd;
    end;
  end;
 st;
end.