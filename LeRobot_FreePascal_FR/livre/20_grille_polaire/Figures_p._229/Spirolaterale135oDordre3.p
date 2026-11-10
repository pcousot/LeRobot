{$mode macpas} program Spirolaterale135oDordre3;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirolatérale, page 229.                            *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 lg(20);
 for I := 1 to 8 do 
  begin
   rt(135);
   av; rt(-135);
   av; av; rt(-135);
   av; av; av; 
  end;
 st;
end.