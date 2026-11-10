{$mode macpas} program ToileDaraignee; 
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Toile d'araignée, pages 229 et 238.                 *}
 {*                                                     *}
 {*******************************************************}

 procedure Hexagone (R : integer);
  var I : integer;
 begin
  lgRT(R, 60);
  ce; pw;
  for I := 1 to 2 do
   begin
    lc; av; av; bc; p3htd; av; phtd; av; av; phtd; av; ce; pe;
   end; 
 end;
 
 procedure Diagonales (R : integer);
  var I : integer;
 begin
  lgRT(R, 60);
  psw;
  for I := 1 to 4 do
   begin
    av; ce; pqtd;
   end;
  ce; pw; avf(2); ce; pe; avf(2); 
 end;

 procedure Toile;
  var I : integer;
 begin
  for I := 1 to 8 do
   begin
    Hexagone (5 * I);
    Diagonales(5 * I);
   end;
 end; 
 
begin
 Toile; st;
end.