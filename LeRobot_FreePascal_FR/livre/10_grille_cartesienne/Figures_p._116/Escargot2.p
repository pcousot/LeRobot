{$mode macpas} program Escargot2;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Escargot, pages 116 et 122.                         *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 { Monter au centre de la coquille }
 lc; avf(4); bc; pqtd;
 { Coquille }
 for I := 1 to 11 do
  begin
   vg; lg(12 + (5 * I));
  end;
 lg(12); avf(4);
 { Corps }
 pqtd; avf(9); vg; vg; avf(31); pdt; phtd; avf(2); phtg; avf(14);
 { Rejoindre l'antenne }
 lc; avf(10); bc; avf(4);
 { Antenne }
 phtd; av; lg(2); vg; vg; vg; vg; lg(12); pdt; av;
 { Oeil }
 phtd; lc; av; bc; lg(2); vg; vg; vg; vg;   
 st; 
end.