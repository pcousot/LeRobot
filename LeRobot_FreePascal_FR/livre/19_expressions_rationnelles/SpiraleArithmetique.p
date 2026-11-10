{$mode macpas} program SpiraleArithmetique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* SpiraleArithmetique, page 218.                      *}
 {*                                                     *}
 {*******************************************************}

 procedure Arc(L : real);
 begin
  lg(L); vd;
 end;

begin
 Arc(100); Arc(66.666666667); 
 Arc(44.444444444); Arc(29.62962963); 
 Arc(19.75308642); Arc(13.16872428); 
 Arc(8.7791495199); Arc(5.8527663466); 
 Arc(3.9018442311); Arc(2.6012294874); 
 Arc(1.7341529916); Arc(1.1561019944); 
 st;
end.