{$mode macpas} program AgAdEhEb;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Définition de ag, ad, eh et eb, pages 192, 194-195. *}
 {*                                                     *}
 {*******************************************************}

 { Définition de la commande ag; }
 
 procedure AuBordOuest;
 begin
  lc; pw;
  while (not tb) do
   begin
    av; 
   end;
 end;
 
 procedure AlOuest;
 begin
  if tn then
   begin AuBordOuest; pn; end
  else if tne then
   begin AuBordOuest; pne; end
  else if te then
   begin AuBordOuest; pe; end
  else if tse then
   begin AuBordOuest; pse; end
  else if ts then
   begin AuBordOuest; ps; end
  else if tsw then
   begin AuBordOuest; psw; end
  else if tw then
   begin AuBordOuest; end
  else
   begin AuBordOuest; pnw; end;
 end;
 
 procedure ag;
 begin
  if valBC then
   begin AlOuest; bc; end
  else
   begin AlOuest; end;
 end;

 { Définition de la commande ad; }
 
 procedure AuBordEst;
 begin
  lc; pe;
  while (not tb) do
   begin
    av; 
   end;
 end;
 
 procedure AlEst;
 begin
  if tn then
   begin AuBordEst; pn; end
  else if tne then
   begin AuBordEst; pne; end
  else if te then
   begin AuBordEst; end
  else if tse then
   begin AuBordEst; pse; end
  else if ts then
   begin AuBordEst; ps; end
  else if tsw then
   begin AuBordEst; psw; end
  else if tw then
   begin AuBordEst; pw; end
  else
   begin AuBordEst; pnw; end;
 end;
 
 procedure ad;
 begin
  if valBC then
   begin AlEst; bc; end
  else
   begin AlEst; end;
 end;

 { Définition de la commande eb; }
 
 procedure AuBordSud;
 begin
  lc; ps;
  while (not tb) do
   begin
    av; 
   end;
 end;
 
 procedure EnBas;
 begin
  if tn then
   begin AuBordSud; pn; end
  else if tne then
   begin AuBordSud; pne; end
  else if te then
   begin AuBordSud; pe; end
  else if tse then
   begin AuBordSud; pse; end
  else if ts then
   begin AuBordSud; end
  else if tsw then
   begin AuBordSud; psw; end
  else if tw then
   begin AuBordSud; pw; end
  else
   begin AuBordSud; pnw; end;
 end;
 
 procedure eb;
 begin
  if valBC then
   begin EnBas; bc; end
  else
   begin EnBas; end;
 end;

 { Définition de la commande eh; }
 
 procedure AuBordNord;
 begin
  lc; pn;
  while (not tb) do
   begin
    av; 
   end;
 end;
 
 procedure EnHaut;
 begin
  if tn then
   begin AuBordNord; end
  else if tne then
   begin AuBordNord; pne; end
  else if te then
   begin AuBordNord; pe; end
  else if tse then
   begin AuBordNord; pse; end
  else if ts then
   begin AuBordNord; ps; end
  else if tsw then
   begin AuBordNord; psw; end
  else if tw then
   begin AuBordNord; pw; end
  else
   begin AuBordNord; pnw; end;
 end;
 
 procedure eh;
 begin
  if valBC then
   begin EnHaut; bc; end
  else
   begin EnHaut; end;
 end;
 
 procedure Trait;
 begin
  av; av; av; { Dessiner le trait de longueur 3 }
  pdt; av; av; av; pdt; { Reprendre la position initiale }
 end;
 
begin 
{ Faisceau de 5 traits au milieu du bord gauche du cadre }
 ag; Trait; phtd; Trait; phtd; Trait; phtd; Trait; phtd; Trait; pdt; 
{ Faisceau de 5 traits au milieu du bord droit du cadre }
 ad; Trait; phtg; Trait; phtg; Trait; phtg; Trait; phtg; Trait; pdt; 
{ Faisceau de 5 traits au milieu du bord supérieur du cadre }
 ce; eh; pqtd; Trait; phtd; Trait; phtd; Trait; phtd; Trait; phtd; 
 Trait; pqtd; 
{ Faisceau de 5 traits au milieu du bord inférieur du cadre }
 eb; pqtd; Trait; phtg; Trait; phtg; Trait; phtg; Trait; phtg; Trait;
 pqtd;
{ Faisceau de 3 traits au coin supérieur gauche du cadre }
 eh; ag; pqtd; Trait; phtd; Trait; phtd; Trait; pdt; 
{ Faisceau de 3 traits au coin supérieur droit du cadre }
 ad; pqtg; Trait; phtg; Trait; phtg; Trait; pdt; 
{ Faisceau de 3 traits au coin inférieur gauche du cadre }
 eb; ag; Trait; phtd; Trait; phtd; Trait; pqtg; 
{ Faisceau de 3 traits au coin inférieur droit du cadre }
 ad; Trait; phtg; Trait; phtg; Trait; pqtd; 
{ Faisceau de 8 traits au centre du cadre }
 ce; Trait; phtd; Trait; phtd; Trait; phtd; Trait; phtd; Trait; phtd;
 Trait; phtd; Trait; phtd; Trait; phtd; st;
end.