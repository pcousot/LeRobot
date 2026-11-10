{$mode macpas} program Serpentin;
 uses Robot1, Robot2;
   
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Serpentin, pages 173-174.                           *}
 {*                                                     *}
 {*******************************************************}

 procedure DessinSerpentin (L : integer );
  var I : integer;
 begin
  for I := 1 to (2 * L) do
   begin
    if (I <= L) then
     begin
      lg(I);
     end
    else
     begin
      lg(((2 * L) + 1) - I);
     end;
    if odd(I) then
     begin
      { Demi cercle supérieur } vd; vd; 
     end
    else
     begin
      { Demi cercle inférieur } vg; vg; 
     end;
  end;
 end;
 
begin {Robot}
 ag; DessinSerpentin(13); st; 
end. {Robot}