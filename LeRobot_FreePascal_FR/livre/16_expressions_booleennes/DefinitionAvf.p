{$mode macpas} program DefinitionAvf;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Définition de Avf, pages 172-173.                   *}
 {*                                                     *}
 {*******************************************************}

 procedure Avf (N : integer);
  var I : integer;
 begin
  if (N > 0) then
   begin
    for I := 1 to N do
     begin
      av;
     end;
   end
  else if (N < 0) then
   begin
    pdt; 
    for I := 1 to (- N) do
     begin
      av;
     end;
    pdt; 
   end;
 end;

begin
 Avf(5); Avf(-5);
 st;
end.