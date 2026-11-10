{$mode macpas} program NumerationEgyptienne;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 43, page 275-276.                          *}
 {*                                                     *}
 {*******************************************************}

 const
  G = 6; { Taille de la grille }
   
 procedure DixPuissanceZero ;
  { Trait vertical }
 begin  
   avf(3); avf(- 3); 
 end;
 
 procedure DixPuissanceUn;
  { Anse }
 begin  
  avf(2); vd; vd; avf(2); pdt;
 end;

 procedure DixPuissanceDeux;
  { Spirale }
  var X : real;  
 begin  
  X := vallgX;
  lc; phtd; avf(2); pqtg; bc;
  lg(X / 2); vg; vg; lg(X); vg; vg; 
  lg(X / 2 * 3); vg; vg; lgX(X / 2 * 3); lgY(X); av; 
  phtg; lc; lgX(X / 2); av; pqtg; bc; lg(X);
 end;

 procedure DixPuissanceTrois;
  { Lotus }
  var X : real;  
 begin  
  X := vallgX;
  { Bas }
  lg(X / 2 * 3); vd; vd; pqtd; avf(2); 
  { Tige }
  lc; avf(- 1); pqtd; av; bc; lg(X); phtg; av; avf(- 1); pqtd; 
  av; avf(- 1); phtg; lg(X / 2 * 15); av; 
  { Fleur }
  lgX(X); lgY(X / 2); pqtd; vg; phtg; av; pqtd; av; phtg; vg;
  lgX(X / 2 * 3); lgY(X); vg; vg; 
  { Se plaçer à droite du dessin orienté au nord }
  lc; pqtd; lg(X / 2); avf(18); pqtg; avf(3); pqtg; bc; lg(X);
 end;
 
 procedure DixPuissanceQuatre;
  { Index }
  var X : real;  
 begin  
  X := vallgX;
  avf(9); lgY(X * 2); phtg; av; avf(- 1); phtd; lg(X); avf(- 9);
 end;
 
 procedure DixPuissanceCinq;
  { Têtard }
  var X : real;  
 begin  
  X := vallgX;
  { Pattes }
  lc; pqtd; avf(2); bc; lgX(X * 3); lgY(X * 2); phtg; 
  vd; lgY(X / 2); lgX(X); pqtg; vg; phtd; vg; phtd; 
  lgY(X / 3 * 2); vd; 
  { Ventre }
  lc; p3htd; av; pqtd; bc; lgX(X * 3); lgY(X * 2); vd;
  { Tête et oeuil gauche }
  pqtg; lgX(X / 4); avf(- 1); lgY(X / 2); lgX(X / 4 * 5 );
  vd; phtd; lg(X * 2); vd; lc; p3htd; lg(X); av; bc; dp; 
  { Dos }
  lc; pdt; av; bc; pqtd; lgY(X / 2); lgX(X); vg; lgX(X / 2 * 7);
  lgY(X * 2); vd; 
  { Queue }
  phtg; lgX(X * 3); lgY(X * 2); vg; pdt; lgX(X * 4); lgY(X * 3);
  vd; p3htg; lgX(X / 2); lgY(X); vd; 
  { Plaçer le robot à droite du dessin orienté au nord }
  lc; pdt; lgX(X * 5); av; pqtg; lg(X); bc;   
 end;

{ Un Génie }

 procedure Tete;
  var X : real; 
 begin 
  X := vallgX;   
  vg; vg; phtd; lgX(X / 2); vg; phtg; lgX(X / 2 * 3);
  lgY(X * 2); vg;
  { Coiffe }
  lc; lg(X); pqtg; av; bc; phtd; lg(X / 2);
  av; vg; phtg; vg; lc; phtg; av; bc; pqtg; av; vd; phtd; vd;
  lc; pqtg; lgX(X / 2 * 3); lgY(X * 2); av; bc; lg(X);
 end;

 procedure BrasDroit;
  var X : real;  
 begin  
  X := vallgX;
  lgY(X * 3); av; lg(X / 2); p3htg; vg; phtg; vg;
  lc; pdt; lgX(X / 2); lgY(X * 3); av; bc; lg(X);
 end;
   
 procedure BrasGauche;
  var X : real;  
 begin  
  X := vallgX;
  lgY(X * 3); av; lg(X / 2); p3htd; vd; phtd; vd;
  lc; pdt; lgX(X / 2); lgY(X * 3); av; bc; lg(X); 
 end;

 procedure DixPuissanceSix;
  { Génie du million }
  var X : real;  
 begin  
  X := vallgX;
  { Cuisse gauche }
  lc; pqtd; lgX(X / 2); av; pqtg; bc; lg(X * 2); vd;
  { Côté droit du corps }
  phtg; lgX(X / 2); vg; phtd; lgX(X); lgY(X * 4); vg; phtd;
  { Bras droit, tête, bras gauche }
  lg(X); BrasDroit; lgX(X / 2 * 7); lgY(X * 2); vg; lg(X); 
  BrasGauche; lc; phtd; av; bc; p3htd; Tete;
  { Côté gauche du corps }
  p3htd; lgY(X * 3); vg; lgX(X / 2); lgY(X * 3); vg; phtd;
  lgX(X); lgY(X * 2); vd; lg(X);
  { Jambe gauche }
  p3htg; lgX(X / 2); av; avf(-9); 
  { Jambe et cuisse droites }
  lc; lgY(X / 2 * 3); lgX(X / 2); phtg; av; bc; lgX(X / 2);
  lgY(X * 2); pqtg; av; pdt; lgX(X * 2); lgY(X / 2 * 3); av; 
  { Placer le robot à droite du dessin orienté au nord }
  lc; lgX(X * 7 / 2); lgY(X * 2); av; lg(X); p3htg; bc;
 end;
 
 { Taille des hiéroglyphes }
 
 function Largeur (PuissanceDeDix : integer) : integer;
 begin
  case PuissanceDeDix of
   6 : begin Largeur := 6; end;
   5 : begin Largeur := 10; end;
   4 : begin Largeur := 0; end;
   3 : begin Largeur := 3; end;
   2 : begin Largeur := 3; end;
   1 : begin Largeur := 2; end;
   0 : begin Largeur := 0; end;
  end;
 end; 
 
 function Hauteur (PuissanceDeDix : integer) : integer;
 begin
  case PuissanceDeDix of
   6 : begin Hauteur := 11; end;
   5 : begin Hauteur := 4; end;
   4 : begin Hauteur := 11; end;
   3 : begin Hauteur := 11; end;
   2 : begin Hauteur := 3  end;
   1 : begin Hauteur := 3; end;
   0 : begin Hauteur := 3; end;
  end;
 end;
 
 { Disposition des hiéroglyphes }

 function Lignes (Chiffre : integer) : integer;
 begin
  case Chiffre  of
   0 : begin Lignes := 0; end;
   1, 2, 3 : begin Lignes := 1; end;
   4, 5, 6, 7, 8 : begin Lignes := 2; end;
   9 : begin Lignes := 3; end;
  end;
 end;
 
 function ColonnesLigne1 (Chiffre : integer) : integer;
 begin
  case Chiffre  of
   0 : begin ColonnesLigne1 := 0; end;
   1 : begin ColonnesLigne1 := 1; end;
   2, 4, 5 : begin ColonnesLigne1 := 2; end;
   3, 6, 7, 9 : begin ColonnesLigne1:= 3; end;
   8 : begin ColonnesLigne1 := 4; end;
  end;
 end;

 function ColonnesLigne2 (Chiffre : integer) : integer;
 begin
  case Chiffre  of
   0, 1, 2, 3 : begin ColonnesLigne2 := 0; end;
   4 : begin ColonnesLigne2 := 2; end;
   5, 6, 9 : begin ColonnesLigne2 := 3; end;
   7, 8 : begin ColonnesLigne2 := 4; end;
  end;
 end;
 
 function EspaceLignes (PuissanceDeDix, 
                        Chiffre : integer) : integer; 
 begin
  EspaceLignes := 1;
  case Chiffre  of
   0 : begin EspaceLignes := 0; end;
   4, 5, 6, 7, 8 : 
       begin 
        case PuissanceDeDix of
         3, 4 : begin EspaceLignes := 2; end;
        end;
       end;
  end;
 end;
 
 function EspaceColonnes (PuissanceDeDix, 
                          Chiffre : integer) : integer;
 begin
  case Chiffre of
   0, 1 : begin EspaceColonnes := 0; end;
   2, 3, 4, 5, 6, 7, 8, 9 
     : begin
        case PuissanceDeDix of
         0, 1, 2, 3, 4, 6 :  begin EspaceColonnes := 1; end;
         5 : begin EspaceColonnes := - 2; end;
        end;
       end;
   end;
 end;
 
 { Taille  de la grille dans l'écriture horizontalement }
 { ou verticalement }

 function GrilleH (PuissanceDeDix, Chiffre : integer) : real;
 begin
  GrilleH := vallgX;
  case PuissanceDeDix of
   0, 1, 2 : begin GrilleH := (vallgX / 2); end;
   5 : begin GrilleH := (vallgX / 4) * 3; end;
  end;
  case Chiffre of
   4, 5, 6, 7, 8 : 
       begin 
        case PuissanceDeDix of
         3, 4 : begin  GrilleH := (vallgX / 11) * 5; end;
        end;
       end;
   9 : begin 
        case PuissanceDeDix of
          3, 4 : begin  GrilleH := (vallgX / 22) * 7; end;
        end; 
       end;
   end;
  end;

 function GrilleV (PuissanceDeDix : integer) : real;
 begin
  GrilleV := (vallgX / 2);
  case PuissanceDeDix of
   6, 5, 4, 3 :
     begin 
      GrilleV := (vallgX / 4) * 3; 
     end;
  end;
 end;
 
 { Largeur d'une colonne dans la représentation hybride }
 
 function LargeurCoefficient (ValeurPrededente, PuissanceDeDix,
                              Nombre : integer) : integer;
  var V : integer;
 begin
  V := ColonnesLigne1(Nombre mod 10) * (Largeur(PuissanceDeDix) 
               + EspaceColonnes(PuissanceDeDix, Nombre mod 10));
  if (ColonnesLigne1(Nombre mod 10) = 
               (ColonnesLigne2(Nombre mod 10) - 1)) 
   then
    begin
     V := V + Largeur(PuissanceDeDix);
    end;
  if (V > ValeurPrededente) then
   begin 
    ValeurPrededente := V;
   end;
  if (Nombre < 10) then
   begin
    LargeurCoefficient := ValeurPrededente;
   end
  else
   begin
    LargeurCoefficient := LargeurCoefficient(ValeurPrededente,
                          PuissanceDeDix + 1, Nombre div 10);
   end;
 end;
  
 procedure Espacement ( N : real);
  { Déplacer le robot crayon levé de N fois la taille }
  { de la grille,  à droite si N ≥ 0,  à gauche sinon }
  var X : real;
 begin
  X := vallgX; 
  lc; if (N > 0) then begin pqtd; lg(X * N); av; pqtg; end
                 else begin pqtg; lg(- X * N); av; pqtd; end;
  bc; lg(X);
 end;

 procedure EcrireChiffreEnHieroglyphes (H : boolean; 
                               PuissanceDeDix, Chiffre : integer);
  var 
   I : integer;
   J : integer;
   C : integer;
   X : real;
 begin
  X := vallgX;
  if Chiffre <> 0 then
   begin
   C := ColonnesLigne1(Chiffre);
   if H then
    begin
     lg(GrilleH(PuissanceDeDix, Chiffre));
     if C = (ColonnesLigne2(Chiffre) - 1) 
      then 
       begin
        Espacement((Largeur(PuissanceDeDix) + 
           EspaceColonnes(PuissanceDeDix, Chiffre)) / 2); 
       end;
    end
  else
   begin
    lg(GrilleV(PuissanceDeDix));
    Espacement(- (ColonnesLigne1(Chiffre) * (Largeur(PuissanceDeDix) 
               + EspaceColonnes(PuissanceDeDix, Chiffre)) 
               - EspaceColonnes(PuissanceDeDix, Chiffre)) / 2);
   end;
  for J := 1 to Lignes(Chiffre) do
   begin
    for I := 1 to C do
     begin
      case PuissanceDeDix of
       6 : begin DixPuissanceSix; end;
       5 : begin DixPuissanceCinq; end;
       4 : begin DixPuissanceQuatre; end;
       3 : begin DixPuissanceTrois; end;
       2 : begin DixPuissanceDeux; end;
       1 : begin DixPuissanceUn; end;
       0 : begin DixPuissanceZero; end;
      end; 
      { Colonne suivante }
      Espacement(EspaceColonnes(PuissanceDeDix, Chiffre));
     end;
    { Ligne suivante }
    lc; avf(Hauteur(PuissanceDeDix) + 
             EspaceLignes(PuissanceDeDix, Chiffre)); bc;
    Espacement(- C * (Largeur(PuissanceDeDix) + 
             EspaceColonnes(PuissanceDeDix, Chiffre)));
    if C = (ColonnesLigne2(Chiffre) - 1) 
     then 
      begin 
       Espacement(- (Largeur (PuissanceDeDix) + 
             EspaceColonnes(PuissanceDeDix, Chiffre)) / 2);
       C := ColonnesLigne2(Chiffre); 
      end;
   end;
  { Se placer pour tracer le Chiffre suivant }
  if H
   then
    begin
     Espacement(C * (Largeur(PuissanceDeDix) + 
             EspaceColonnes(PuissanceDeDix, Chiffre)) 
             - EspaceColonnes(PuissanceDeDix, Chiffre));
     lc; avf(- Lignes (Chiffre) * (Hauteur(PuissanceDeDix) + 
             EspaceLignes(PuissanceDeDix, Chiffre))); bc;
     Espacement(2);
     case PuissanceDeDix of
      4, 3, 2, 1 : begin Espacement(1); end;
     end; 
    end
   else
    begin
     Espacement({ColonnesLigne1(Chiffre)} (C * (Largeur(PuissanceDeDix) 
             + EspaceColonnes(PuissanceDeDix, Chiffre)) 
             - EspaceColonnes(PuissanceDeDix, Chiffre)) / 2);
    end;
   lg(X);
 end;
 end;

 function PlusFortePuissance (C : longint) : integer;
 begin
  if (C < 10) then
   begin
    PlusFortePuissance := 0;
   end
  else
   begin
    PlusFortePuissance := 1 +
        PlusFortePuissance(C div 10) ;
   end;
 end;

 function DixPuissance (N : integer) : longint;
 begin
  if N = 0 
   then
    begin
     DixPuissance := 1;
    end
   else
    begin
     DixPuissance := DixPuissance(N - 1) * 10;
    end;
 end;

 procedure EcrireNombreEnHieroglyphes (H : boolean; 
                                       P : integer ; C : longint);
 begin
  if (C < 10) then
   begin
    EcrireChiffreEnHieroglyphes(H, P, C);
   end
  else
   begin
    if H 
     then
      begin 
       EcrireNombreEnHieroglyphes(H, (P + 1), C div 10);
       EcrireChiffreEnHieroglyphes(H, P, C mod 10);
      end
     else
      begin
       EcrireChiffreEnHieroglyphes(H, P, C mod 10);
       EcrireNombreEnHieroglyphes(H, (P + 1), C div 10);
      end;
   end;
 end;

 procedure LireLongint (var N : longint);
  { Lire un entier N strictement positif (suivi d'un blanc, }
  { d'un 'retour-chariot' ou d'un 'entrer'),  en corrigeant }
  { avec 'retour-arrière' }
  const
   CodeRetourChariot = 13;
   CodeEntrer = 3;
   CodeRetourArriere = 8;
   Incitation = 'Nombre à coder : ';
  type
   Caracteres = set of char;
  var
   C : char;
   M : string;
   Fin : boolean;
   CaracteresDeFin, CaracteresDeCorrection : Caracteres;
   
   procedure LireC;
    { Lire le prochain caractère dans C }
    var Correct : boolean;
   begin
    repeat
     LireCar(C);
     if M = '' then
      begin
       { Le premier caractère est un digit non nul }
       Correct := C in ['1'..'9'];
      end
     else
      begin
       { Les caractères suivants sont un digit, un caractère de }
       { correction ou de fin }
       Correct := C in (['0'..'9'] + CaracteresDeCorrection
                        + CaracteresDeFin);
      end;
     if (not Correct) then 
      begin Bip; end
     else if (C in CaracteresDeCorrection) then
      begin 
       if M <> '' then
        begin
         { Effacer le dernier digit lu }
         N := N div 10; 
         Delete(M, length(M), 1);
         message(concat(Incitation, M));
        end;
       { Lire le caractère suivant }
       Correct := false; 
      end;
     until Correct;
   end;
   
 begin
  { Terminer par blanc, 'retour-chariot' ou 'entrer' }
  CaracteresDeFin := [' ', chr(CodeRetourChariot), chr(CodeEntrer)];
  { Corriger par un 'retour-arrière' }
  CaracteresDeCorrection := [chr(CodeRetourArriere)];
  { Lire le premier digit non nul dans C }
  M := ''; message(concat(Incitation, M));
  LireC;
  M := C; N := ord(C) - ord('0'); message(concat(Incitation, M));
  { Lire les digits suivants ou terminer }
  repeat
   { Lire un digit ou un caractère de fin C }
   LireC;
   { Compléter le nombre }
   if (C in ['0'..'9']) then
    begin
     if N <= ((maxlongint - (ord(C) - ord('0'))) div 10) then
      begin
       N := (10 * N) + (ord(C) - ord('0'));
       M := concat(M, C);
       message(concat(Incitation, M));
       Fin := false;
      end
     else
      begin
       if N = maxlongint then
        begin
         { Fin par débordement supérieur }
          Fin := true; Bip;
        end
       else
        begin
         { Débordement supérieur, lire un autre digit ou un }
         { caractère de fin }
          Fin := false; Bip;
        end;
      end;
    end
   else
    begin
     { Fin normale, par un caractère de fin }
     Fin := true;
    end;
  until Fin;
 end;


 const
  Horizontalement = true;
 var
  NombreACoder : longint;
  I : integer;
  
begin
 { Lire le nombre à coder }
 LireLongint(NombreACoder);
 
 if (NombreACoder >= 1000000000) 
  then
   begin
    writeln('Trop grand pour écrire en hiéroglyphes égyptiens.');
   end
  else 
   begin
    { Initialisation }
    CacherRobot; lg(G); ag; lc; avf(10); bc; Espacement(2);
 
    { Représentation classique }
    if (NombreACoder < 2000000) 
     then
      begin
       EcrireNombreEnHieroglyphes(Horizontalement, 0, NombreACoder);
      end;
  
    { Représentation hybride et grands nombres }
    if (NombreACoder >= 2000)
     then
      begin
       ag; eb; Espacement(2);
       { Colonne de la plus forte puissance (génie, têtard, }
       { index ou  lotus) à multiplier }
       I := 2;
       if PlusFortePuissance(NombreACoder) = 3 
        then
          begin
           I:=0;
          end
         else
          if PlusFortePuissance(NombreACoder) = 4 
           then
            begin
             I:=1;
            end;
       Espacement(LargeurCoefficient
                 (Largeur(PlusFortePuissance(NombreACoder) -I), 0,
                   NombreACoder div DixPuissance(PlusFortePuissance
                    (NombreACoder) -I)) / 2);
       EcrireNombreEnHieroglyphes(not Horizontalement, 0, 
                 NombreACoder div DixPuissance(PlusFortePuissance
                  (NombreACoder) - I));
       EcrireChiffreEnHieroglyphes(not Horizontalement,
                 ((PlusFortePuissance(NombreACoder) - I)), 1);
       eb;
       Espacement(LargeurCoefficient(Largeur
                 (PlusFortePuissance(NombreACoder) -I), 0, 
                   NombreACoder div DixPuissance(PlusFortePuissance
                    (NombreACoder) - I)) / 2 + 1);
       { Ligne du reste du nombre }
       EcrireNombreEnHieroglyphes(Horizontalement, 0, 
                 NombreACoder mod DixPuissance 
                  (PlusFortePuissance(NombreACoder) - I));
      end;
   end;
 st;
end.
