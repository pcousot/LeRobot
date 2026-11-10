{$mode macpas} program CarresImbriquesPeints;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motif de Horemis, pages 220-221.                    *}
 {*                                                     *}
 {*******************************************************}

 { Motif de S. Horemis, 'Optical and geometrical patterns and }
 { designs', Dover, New York, 1970.                           }
 
 const
  N = 6;
  DeuxPuissanceN = 64; { 2 à la puissance N }
 var 
  I : integer;
  J : integer;
begin
 eb; ag; lg(DeuxPuissanceN);
 for I := 1 to N do
  begin
   for J := 1 to 4 do
    begin
     avf(4); pqtd; 
    end;
   avf(2); phtd; 
   for J := 1 to 4 do
    begin
     avf(2); avf(-1); pqtd; peindre; pqtg; av; pqtd; 
    end;
   av; phtd; 
   lg(valLgX / 2);
  end;
 st;
end.