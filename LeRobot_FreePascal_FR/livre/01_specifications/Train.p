{$mode macpas} program Train;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Moyens de transport, page 10.                       *}
 {*                                                     *}
 {*******************************************************}
 
 { Dessiner un train à vapeur avec tandem et deux wagons de voyageurs }

 procedure Roue;
 begin
  vg; vg; vg; vg; 
 end;
 
 procedure Locomotive;
 begin
  { Avant }
  avf(2); pqtg; avf(3); pqtg; av; pqtg; avf(3); pqtg; av; pqtd; av; pdt; 
  avf(5);
  { Corps }
  pqtd; av; pqtg; avf(2); pqtd; av; pqtd; avf(2); pqtd; av; pdt; avf(11);
  pqtd; avf(5); pqtd; avf(6); Roue; avf(3); Roue; avf(3); pdt; avf(12); 
  { Cabine }
   pqtg; avf(8); pqtd; av;
   { Fenêtre }
   pqtd; lc; av; bc; avf(3); pqtg; avf(2); pqtg; avf(2); phtg; av; phtg; 
   av; pqtd; lc; av; bc; pqtd; 
   avf(2); phtd; avf(3); phtd; av; pqtg; av; pqtd; avf(4); pqtd;  avf(2); 
   Roue; avf(3); Roue; avf(2); pdt; avf(7); pqtg; av; pqtd; av; 
 end;
 
 procedure Tander;
 begin
  av; pqtg; avf(3); pqtd; avf(2); phtg; avf(2); phtd; avf(5); pqtd; avf(6);
  pqtd; avf(2); Roue; avf(5); Roue; avf(2); pqtd; av; pqtd; lc; avf(9); bc;
  av; 
 end;
 
 procedure Fenetre;
 begin
  pqtd; lc; av; bc; avf(3); pqtg; avf(2); pqtg; avf(3); pqtg; avf(2); lc; 
  pqtd; av; pqtd; bc; 
 end;
 
 procedure Porte;
 begin
  pqtd; lc; av; bc; avf(4); lc; pqtg; av; dc; pdt; av; pqtg; bc; avf(3); 
  pqtg; avf(3); pqtg; avf(7); pqtg; avf(3); lc; pqtd; av; pqtd; bc; 
 end;
 
 procedure Wagon;
 begin
  av; av; pqtd; av; pdt; avf(8); pqtg; av; pdt; avf(2); Fenetre; avf(3); 
  Fenetre; avf(3); Porte; avf(4); Fenetre; avf(3); Fenetre; avf(4); pdt; 
  av; pqtg; avf(8); pqtd; avf(3); Roue; avf(11); Roue; avf(3); pdt; 
  avf(17); pqtg; av; pqtd; av; 
 end;
 
begin
 lg(6); ag; pqtd; Locomotive; Tander; Wagon; Wagon; st;
end.