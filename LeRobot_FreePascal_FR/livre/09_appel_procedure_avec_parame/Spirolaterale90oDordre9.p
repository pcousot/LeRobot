{$mode macpas} program Spirolaterale90oDordre9;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirolatérale à 90 degrés d'ordre 9, page 107-108.  *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner une courbe spirolatérale de Frank C. Odds à 90 degrés }
 { d'ordre 9.                                                     }
 var
  I : integer;
  J : integer;
begin
 lc; avf(-4); bc; 
 for I := 1 to 4 do 
  begin
   for J := 1 to 9 do
    begin
     avf(J); pqtd;
    end;
  end;
 st;
end.