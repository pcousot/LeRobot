{$mode macpas} program PavageCarreaux3Couleurs;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage en trois couleurs, page 135.                 *}
 {*                                                     *}
 {*******************************************************}
 const
  NombreDeLignes = 10; { pair }
  LongueurLigne = 10;  { pair }
 
 procedure Carre;
  { Le  robot  étant  orienté  à l'est, dessiner un carre en bas à }
  { droite du crayon et le peindre de la couleur du  crayon.  Pour }
  { terminer, placer le robot en bas à gauche du carré vers l'est. }
 begin
  cc(noir); av; pqtg; av; pqtg; av; pqtg; av;
 end;
 
 procedure PeindreCarre;
  { Le  robot  étant  en  bas  à  gauche  du carré, orienté au sud, }
  { peindre le carré de la couleur du  crayon, puis placer le robot }
  { en bas à gauche du carré tourné vers l'est. }
 begin
  phtd; peindre; p3htg; cc(noir); av;
 end;
 
 procedure LigneImpaire;
  { Dessiner une ligne de petits carreaux bleux et rouges }
  var I : integer;
 begin
  for I := 1 to (LongueurLigne div 2) do
   begin
    Carre; cc(bleu); PeindreCarre; Carre; cc(rouge); PeindreCarre; 
   end;
 end;

 procedure LignePaire;
  { Dessiner une ligne de petits carreaux blancs et indigos }
  var I : integer;
 begin
  for I := 1 to (LongueurLigne div 2) do
   begin
    Carre; cc(blanc); PeindreCarre; Carre; cc(indigo); PeindreCarre; 
   end;
 end;
 
 procedure ALaLigne;
 begin
  avf(- LongueurLigne); lc; pqtd; av; pqtg; bc; 
 end;
 
 procedure Pavage;
  var I : integer;
 begin
  for I := 1 to (NombreDeLignes div 2) do
   begin
    LigneImpaire; ALaLigne;
    LignePaire; ALaLigne;
   end;
 end;

begin
 ag; eh; avf(-1); pqtd; 
 Pavage; st;
end.