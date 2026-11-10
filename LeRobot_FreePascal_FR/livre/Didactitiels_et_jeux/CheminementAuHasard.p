{$mode macpas} program CheminementAuHasard;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

  var
   R : integer;
   I : integer;
begin
 for I := 1 to 1000 do
  begin
   { Tirer au sort un nombre R compris entre 0 et 7 }
   R := (abs(random) mod 8);
   { Pivoter sur place de R quarts de tour à droite }
   Pivoter(R);
   { Tirer au sort un nombre R compris entre 1 et 5 }
   R := (abs(random) mod 5) + 1;
   { Avancer R fois dans la direction courante, sauf si le robot touche le bord }
   while (R <> 0) and (not TB) do
    begin
     av;
     R := R - 1;
    end;
   end;
  st; 
end.

