{$mode macpas} program Arabesque1;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Arabesque, page 107.                                *}
 {*                                                     *}
 {*******************************************************}

  procedure DemiMotif;
  begin
   { Quard de motif }
   phtg; avf(2); phtd; avf(2); phtg; av; 
   { Demi-carré central }
   p3htd; lc; avf(2); pqtd; bc; av; pqtg; av; lc; pqtg; avf(2); pqtg; 
   bc; av; pqtg; av; pqtd; lc; avf(2); p3htd; bc; 
   { Quard de motif }
   av; phtg; avf(2); phtd; avf(2); phtg; 
  end;
  
  procedure Motif;
  begin
   DemiMotif;
   vg; pdt; vg;
   DemiMotif;
  end;
  
  procedure OvalCentral;
  begin
   ce; lc; pn; av; av; bc; pqtd; vd; avf(2); vd; vd; avf(2); vd; 
  end;
  
  procedure QuardMotifCentral;
  begin
   vd; av; pqtg; vd; pqtg; vd; pqtg; av; vd; 
  end;
  
  var J : integer;
  
begin
 ec(2);
 { Motif extérieur }
 for J := 1 to 4 do
  begin
   lc; ce; pqtg; avf(11); pqtd;  avf(6); pqtd; bc;
   Motif; pdt; Motif;
  end;
 { Motif central }
 for J := 1 to 4 do
  begin
   lc; ce; pqtd; avf(5); pqtd; bc;
   QuardMotifCentral;
  end;
 OvalCentral;
 ce; pqtg; 
 st;
end.