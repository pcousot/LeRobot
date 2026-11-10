{$mode macpas} program DessinMaximal;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Trajectoiures du Robot, page 15.                    *}
 {*                                                     *}
 {*******************************************************}

 procedure EnHaut;
 begin
  lg(1); eh; lg(51);
 end;
 
 procedure AGauche;
 begin
  lg(1); ag; lg(51);
 end;
 
 procedure ALaLigne;
 begin
  lc; AGauche; ps; av; pe; bc; 
 end;
 
 procedure Croix;
  var I : integer;
 begin
  for I := 1 to 8 do
   begin
    phtd;
    av; pdt; av; pdt; 
    vg; pdt; vd; pdt; 
    vd; pdt; vg; pdt; 
   end;
 end;
 
 var L, C : integer;
 
begin
 EnHaut; AGauche;
 for L := 1 to 4 do
  begin
   ALaLigne;
   for C := 1 to 8 do
    begin
     av; Croix;
    end;
  end;
 st;
end.