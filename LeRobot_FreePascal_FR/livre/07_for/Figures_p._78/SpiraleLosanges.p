{$mode macpas} program SpiraleLosanges;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quadrillages, carrés, spirale et tuyaux d'orgue,    *}
 {* page 78.                                            *}
 {*                                                     *}
 {*******************************************************}

 var 
  I : integer;
  J : integer;
  K : integer;
begin
 phtd; 
 for I := 1 to 10 do
  begin
   for J := 1 to 2 do
    begin
     for K := 1 to I do
      begin
       av;
      end;
     pqtd; 
    end;
  end;
 st;
end.