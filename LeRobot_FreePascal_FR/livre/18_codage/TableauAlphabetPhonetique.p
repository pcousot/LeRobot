{$mode macpas} program TableauAlphabetPhonetique;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Alphabet phonétique international, page 211.        *}
 {*                                                     *}
 {*******************************************************}

 const
  G = 7;  { taille de la grille }
  H = 3;  { Hauteur d'une boite (et largeur d'une petite boite) }
  L = 11; { Largeur d'une grande boite }
  
 procedure Alaligne;
 begin
  lg(G); ag; lc; pdt; avf(H); pqtg; av; pqtg; bc; 
 end;
 
 procedure Lettre(L : string);
 begin
  lg(G);
  avf(H); pqtd; avf(H); pqtd; avf(H); pqtd; avf(H); 
  lc; pdt; av; pqtg; av;  
  ecrire(L);
  pdt; av; pqtg; avf(H - 1); pqtg; bc; 
 end;
 
 procedure Traduction(T : string);
 begin
  lg(G);
  avf(H); pqtd; avf(L); pqtd; avf(H); pqtd; avf(11); 
  lc; pdt; av; pqtg; av;  
  ecrire(T);
  pdt; av; pqtg; avf(L - 1); pdt; bc; 
  lg(H); av; pqtd; lg(G); avf(H); pqtd; lg(H); av; pqtd; lg(G); avf(H); pdt; 
 end;
 
begin
 PoliceTexte(Courier); TailleTexte(12); StyleTexte(Gras); 
 eh; Alaligne;
 Lettre('A'); Traduction('Alpha');
 Lettre('B'); Traduction('Bravo');
 Lettre('C'); Traduction('Charlie');
 Lettre('D'); Traduction('Delta');
 Lettre('E'); Traduction('Echo');
 Alaligne;
 Lettre('F'); Traduction('Foxtrot');
 Lettre('G'); Traduction('Golf');
 Lettre('H'); Traduction('Hotel');
 Lettre('I'); Traduction('India');
 Lettre('J'); Traduction('Juliet');
 Alaligne;
 Lettre('K'); Traduction('Kilo');
 Lettre('L'); Traduction('Lima');
 Lettre('M'); Traduction('Mike');
 Lettre('N'); Traduction('November');
 Lettre('O'); Traduction('Oscar');
 Alaligne;
 Lettre('P'); Traduction('Papa');
 Lettre('Q'); Traduction('Quebec');
 Lettre('R'); Traduction('Romeo');
 Lettre('S'); Traduction('Sierra');
 Lettre('T'); Traduction('Tango');
 Alaligne;
 Lettre('U'); Traduction('Uniform');
 Lettre('V'); Traduction('Victor');
 Lettre('W'); Traduction('Whiskey');
 Lettre('X'); Traduction('Xray');
 Lettre('Y'); Traduction('Yankee');
 Alaligne;
 Lettre('Z'); Traduction('Zulu');
 st; 
end.