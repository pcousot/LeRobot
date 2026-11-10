{$mode macpas} program TracerCadre;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* TracerCadre, pages 189-190.                         *}
 {*                                                     *}
 {*******************************************************}

 procedure AuBord;
  { Rejoindre le bord en avançant tout droit. }
 begin
  while (not tb) do
   begin
    av;
   end;
 end;
 
 procedure Cadre;
 begin
  { Rejoindre le bord supérieur sans rien tracer }
  lc; AuBord;
  { Tracer la moitié droite du bord supérieur }
  pqtd; bc; AuBord;
  { Tracer le bord droit }
  pqtd; AuBord;
  { Tracer le bord inférieur }
  pqtd; AuBord;
  { Tracer le bord gauche }
  pqtd; AuBord;
  { Tracer le bord supérieur }
  pqtd; AuBord;
  { Placer le robot au centre du cadre, orienté au nord }
  ce; pn;
 end;
 
begin
 Cadre; st;
end.