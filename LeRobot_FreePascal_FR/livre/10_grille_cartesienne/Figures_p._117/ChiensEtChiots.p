{$mode macpas} program ChiensEtChiots;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Famille de chiens en balade, page 117.              *}
 {*                                                     *}
 {*******************************************************}

 procedure Chien;
 begin
  { Profil arrière de la patte avant } avf(2); pqtd;
  { Ventre } avf(3); vg; 
  { Patte arrière } pdt; avf(3); pqtg; av; pqtg; avf(4); 
  { Queue } avf(2); vd; pdt; vg; vd; 
  { Dos } avf(3); vd;
  { Tête }
   { Oreille } avf(2); pqtg; av; pqtg; av;
   { Oeil } lc; av; dc; pdt; av; bc; pqtg; av; pqtg; av;
   { Museau } pqtd; avf(2); pqtg; avf(2); pqtg; 
   { Gueule } vg; pdt; vd; pdt; avf(2); vd; 
  { Profil avant de la patte avant } avf(3); pqtg; av;
 end;
 
begin
 eb; ag; lc; pqtd; avf(7); pqtg; bc; 
 { Père } lg(18); Chien; lc; avf(9); pn; bc;
 { Mère } lg(14); Chien; lc; avf(8); pn; bc;
 { Chiots } lg(4); Chien; lc; avf(11); pn; bc; Chien;
 lc; avf(11); pn; bc; Chien; st;
end.