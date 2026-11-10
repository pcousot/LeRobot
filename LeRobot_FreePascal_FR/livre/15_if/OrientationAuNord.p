{$mode macpas} program OrientationAuNord;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Faire pivoter le robot vers le nord, page 166.      *}
 {*                                                     *}
 {*******************************************************}
 
 procedure pn;
 begin
  if tne then
   begin
    phtg; 
   end
  else if te then
   begin
    pqtg; 
   end
  else if tse then
   begin
    p3htg; 
   end
  else if ts then
   begin
    pdt; 
   end
  else if tsw then
   begin
    p3htd; 
   end
  else if tw then
   begin
    pqtd; 
   end
  else if tnw then
   begin
    phtd; 
   end; 
 end;
 
 var
  I : integer;
  J : integer;
 
begin
 for I := 1 to 8 do
  begin
   ce; pn;
   for J := 1 to I do
    begin
     phtd;
    end;
   av;
  end;
 st;
end.