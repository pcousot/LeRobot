{$mode macpas} program MotifVandeVecht;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Motif ornemental de N.J. van de Vecht, page 117.    *}
 {*                                                     *}
 {*******************************************************}

 { Motif de N. J. van de Vecht }

 procedure Motif;
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pdt; avf(3); pqtd; avf(3); lc; pdt; avf(6); pdt; bc; 
 end;
 
 procedure MotifPeint;
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  phtd; peindre; phtg; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pdt; avf(3); phtd; peindre; phtd; avf(3); lc; pdt; 
  avf(6); pdt; bc; 
 end;

begin
 Motif; lc; pqtd; avf(8); pqtg; avf(6); bc; MotifPeint; st;
end.