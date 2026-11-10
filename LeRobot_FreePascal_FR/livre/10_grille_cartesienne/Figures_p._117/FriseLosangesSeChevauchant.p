{$mode macpas}  program FriseLosangesSeChevauchant;
 uses Robot1, Robot2;

 procedure Losange;
  var J : integer;
 begin
  lgx(10); lgy(30);
  for j:= 1 to 4 do
   begin
    av; pqtd;
   end;
 end;

 procedure Frise;
  var K : integer;
 begin
  ag;
  { S'orienter au NE }
  phtd;
  for K := 1 to 48 do 
   begin
    Losange;
    { Avancer au milieu du losange }
    phtd; lc; av; bc;
    { S'orienter au NE }
    phtg; 
   end;
 end;
 
begin 
 Frise; st;
end.