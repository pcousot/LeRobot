{$mode macpas} program FriseEnDentsDeScie;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseEnDentsDeScie, page 164.                       *}
 {*                                                     *}
 {*******************************************************}
 const NombreDeDents = 31;
 var I : integer;
begin
 ag; phtd; 
 for I := 1 to (2 * NombreDeDents) do
  begin
   av; 
   if tne then
    begin
     p3htd; 
    end
   else
    begin
     p3htg; 
    end;
  end;
 st;
end.