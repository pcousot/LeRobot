{$mode macpas} program Codage123456789;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Codage de 123 456 789 en numérations babylonienne,  *}
 {* égyptienne, grecque, romaine, héxadécimale, décima- *}
 {* le, octale, ternaire et binaire, page 199.          *}
 {*                                                     *}
 {*******************************************************}

 {*** Numération babylonienne ********************************************}
 
 procedure NumerationBabylonienne(NombreACoder : longint);

  const 
   X = 6; { Taille de la grille }
  
  procedure Trait;
   { Trait vertical }
  begin
   avf(4); avf(-4);
  end;
 
  procedure TeteDeClou;
   { Tête de clou }
  begin
   lc; pqtd; av; pqtg; bc;
   lgY(vallgY * 2); vg; avf(- 2); vg;
   lc; pqtg; av; pqtg; bc;
   lg(X);
  end;
 
  procedure Un (N : integer);
   { Clou dont la pointe est de hauteur N }
  begin
   lc; pqtd; av; pqtg; bc;
   avf(N); lc; pqtg; av; pqtd; TeteDeClou; lc; avf(- N); bc;
  end;
  
  procedure Dix;
   { Chevron }
  begin
   lc; av; pqtd; bc;
   lgX(X * 2); vd; p3htd; lgX(X); lgY(X * 2); vd; p3htd; lgY(X);
   lgX(X * 2); vd;
   lc; p3htg; av; p3htg; bc; lg(X);
  end;
     
  procedure Espacement (N : integer);
   { Laisser N blancs horizontalement partant d'une }
   { et revenant à une orientation  nord  du  robot }
  begin
   lc; pqtd; avf(N); pqtg; bc; 
  end;
 
  procedure DizainesDesUnitesSexagesimales (ChiffreDesDizaines : integer);
  begin
   case ChiffreDesDizaines of
    1: begin Dix; end;
    2: begin Dix; Dix; end; 
    3: begin Dix; Dix; Dix; end; 
    4: begin 
        lc; pqtd; avf(2); pqtg; bc;
        Dix;
        lc; avf(2); pqtg; avf(4); pqtd; bc;
        Dix; Dix; Dix;
        lc; avf(- 2); bc;
       end;
    5 : begin 
        lc; pqtd; av; pqtg; bc;
        Dix; Dix;
        lc; avf(2); pqtg; avf(5); pqtd; bc;
        Dix; Dix; Dix;
        lc; avf(- 2); bc;
       end;
   end;
  end;
 
  procedure UnitesDesUnitesSexagesimales (ChiffreDesUnites : integer);
  begin
   case ChiffreDesUnites of
    1: begin Un(4); end;
    2: begin Un(4); Un(4); end; 
    3: begin Un(4); Un(4); Un(4); end; 
    4: begin 
        lc; pqtd; av; pqtg; bc;
        lg(X * 2); TeteDeClou; lg(X);
        lc; avf(4); pqtg; avf(5); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
    5: begin
        lc; pqtd; av; pqtg; bc;
        Un(2); Un(2);
        lc; avf(4); pqtg; avf(5); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
    6: begin
        Un(2); Un(2); Un(2);
        lc;avf(4); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
    7: begin 
        lc; pqtd; av; pqtg; bc;
        lgX(X * 2); TeteDeClou;
        lc; avf(2); pqtg; avf(5); pqtd;bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
    8: begin 
        lc; pqtd; av; pqtg; bc;
        TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(5); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
    9: begin 
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc;avf(2); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
   end;
  end;
  
  procedure ZeroBabylonien;
   { En position médiale et uniquement pour marquer }
   { l'absence d'unités dans cette position }
  begin
   lc; pqtd; avf(6); bc;
   p3htg; avf(3); lg(X * 2); vd; avf(-1); vd; 
   lc; pdt;lg(X); av; bc; lg(X * 2); vd; avf(-1);
   vd; lc; lg(X * 4); av; p3htg; bc; lg(X);
  end;
 
  procedure UnitesEnBabylonien (UnitesSexagesimales : integer);
  begin
   if UnitesSexagesimales = 0 
    then 
     begin 
      ZeroBabylonien;
     end
    else
     begin
      case (UnitesSexagesimales div 10) of
       1 : begin DizainesDesUnitesSexagesimales(1); end;
       2 : begin DizainesDesUnitesSexagesimales(2); end;
       3 : begin DizainesDesUnitesSexagesimales(3); end;
       4 : begin DizainesDesUnitesSexagesimales(4); end;
       5 : begin DizainesDesUnitesSexagesimales(5); end;
      end;
      Espacement(1);
      case (UnitesSexagesimales mod 10) of
       1 : begin UnitesDesUnitesSexagesimales(1); end;
       2 : begin UnitesDesUnitesSexagesimales(2); end;
       3 : begin UnitesDesUnitesSexagesimales(3); end;
       4 : begin UnitesDesUnitesSexagesimales(4); end;
       5 : begin UnitesDesUnitesSexagesimales(5); end;
       6 : begin UnitesDesUnitesSexagesimales(6); end;
       7 : begin UnitesDesUnitesSexagesimales(7); end;
       8 : begin UnitesDesUnitesSexagesimales(8); end;
       9 : begin UnitesDesUnitesSexagesimales(9); end;  
      end;
     end;
   Espacement(4);
  end;
 
  procedure NombreEnBabylonien (C : longint);
  begin
   if (C < 60) then
    begin
     UnitesEnBabylonien(C);
    end
   else
    begin
     NombreEnBabylonien(C div 60);
     UnitesEnBabylonien(C mod 60);
    end;
  end;
 
 begin
  eb; ag; lc; av; pqtd; av; pqtg; bc; 
  lg(X); 
  NombreEnBabylonien(NombreACoder);
 end;
 
 {*** Numération égyptienne **********************************************}

 procedure NumerationEgyptienne(NombreACoder : longint);
 
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
   var I : integer; J : integer; C : integer;
       X : real;
  begin
   X := vallgX;
   if Chiffre <> 0 then
    begin
     C := ColonnesLigne1(Chiffre);
     if H then
      begin
       lg(GrilleH(PuissanceDeDix, Chiffre));
       if C = (ColonnesLigne2(Chiffre) - 1)  then 
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
     if C = (ColonnesLigne2(Chiffre) - 1) then 
      begin 
       Espacement(- (Largeur (PuissanceDeDix) + 
             EspaceColonnes(PuissanceDeDix, Chiffre)) / 2);
       C := ColonnesLigne2(Chiffre); 
      end;
    end;
   { Se placer pour tracer le Chiffre suivant }
   if H then
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


  const Horizontalement = true;
  var I : integer;
  
 begin
 
  if (NombreACoder >= 1000000000) 
   then
    begin
     writeln('Trop grand pour écrire en hiéroglyphes égyptiens.');
    end
   else 
    begin
     { Initialisation }
     CacherRobot; 
     eb; ag; lg(12); lc; av; pqtd; av; pqtg; bc; lg(G); Espacement(2);
 
     { Représentation classique }
     if (NombreACoder < 2000000) 
      then
       begin
        EcrireNombreEnHieroglyphes(Horizontalement, 0, NombreACoder);
       end;
  
     { Représentation hybride et grands nombres }
     if (NombreACoder >= 2000) then
      begin
       eb; ag; lg(12); lc; av; pqtd; av; pqtg; bc; lg(G); Espacement(2);
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
       eb; lg(12); lc; pn; av; bc; lg(G);
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
 end;

 {*** Numération grecque *************************************************}

procedure NumerationGrecque(NombreACoder : longint);

  const
   X = 2; { Taille de la grille }
   C = 1; { Taille du crayon }
   Talent = 6000;
   Drachme = 6;
   Obole = 1;

  procedure Espacement;
  begin
   lc; pqtd; avf(2); pqtg; bc;  
  end;
 
  procedure Un;
  begin 
   ec(C * 2); avf(9); avf(- 9); ec(C); 
  end;

  procedure UnDrachme;
  begin 
   ec(C * 2); avf(9); avf(- 4); pqtd; avf(2); lc; pqtg;
   avf(-5); bc; ec(C); 
  end;
 
  procedure UnTalent;
  begin 
   ec(C * 2); lc; pqtd; avf(3); pqtg; bc; avf(9); pqtg; 
   avf(3); avf(- 6); avf(3); pqtd; avf(- 9); lc; pqtd;
   avf(3); pqtg; bc; ec(C); 
  end;


  procedure Cinq;
  begin
   ec(C * 2);
   avf(9); pqtd; avf(6); pqtd; avf(4);
   lc; avf(5); pdt; bc;
   ec(C);  
  end;
 
  procedure CinqTalents;
  begin
   ec(C * 2);
   avf(9); pqtd; avf(6); pqtd; avf(3); pqtd; avf(3); 
   pqtg; avf(2); avf(- 2); pqtd; avf(3); lc; avf(- 6);
   pqtd; avf(- 6); bc; ec(C);  
  end;
 
  procedure Dix (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   lgY(vallgY * 3); phtd; av; pqtd; av; p3htd; avf(2);
   lc; pdt; avf(2); pqtg; bc; lg(X); ec(C);  
  end;

  procedure DixTalents (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   lc; lgY(vallgY / 3 * 2); av; bc; lgY(vallgY * 7 / 2); phtd; av; 
   pqtd; av; p3htd; av; pqtg; lgY(vallgY * 2 / 7); av; avf(- 1); 
   pqtd; av; lc; avf(- 2); pqtd; avf(- 1); bc; lg(X); ec(C);  
  end;
 
  procedure Cinquante;
  begin
   lc;lg(X / 2); avf(11); lg(X); pqtd; avf(2); pqtg; bc;
   Dix (false);
   lc; pqtg; avf(4); pqtg;lg(X / 2); avf(11); lg(X); pdt; bc;
   Cinq;
  end;
  
  procedure CinquanteTalents;
  begin
   lc;lg(X / 2); avf(11); lg(X); pqtd; avf(2); pqtg; bc;
   DixTalents (false);
   lc; pqtg; avf(4); pqtg;lg(X / 2); avf(11); lg(X); pdt; bc;
   Cinq;
  end;

  procedure Cent (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   avf(3); lgY(vallgY / 2); avf(- 3); pqtd; avf(2); pqtg; 
   avf(3); avf(- 6); lg(X); ec(C);  
  end;
 
  procedure CentTalents (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   avf(3); lgY(vallgY / 2); avf(- 3); pqtd; av; pqtd; 
   lgY(vallgY * 4 / 3); av; avf(- 1); pqtg; av; pqtg; 
   lgY(vallgY * 3 / 4); avf(3); avf(- 6); lg(X); ec(C);  
  end;

  procedure CinqCents;
  begin
   lc; avf(5); pqtd; avf(4); pqtg; bc;
   Cent(false);
   lc; pqtg; avf(6); pqtg; avf(5); pdt; bc;
   Cinq;
  end;
  
  procedure CinqCentsTalents;
  begin
   lc; avf(5); pqtd; avf(4); pqtg; bc;
   CentTalents (false);
   lc; pqtg; avf(6); pqtg; avf(5); pdt; bc;
   Cinq;
  end;

  procedure Mille (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   lgX(vallgX * 2); lgY(vallgY * 3); phtd; av; 
   lc; p3htg; av; p3htg; bc; av; p3htg; lg(X); ec(C);
  end;
 
  procedure MilleTalents (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   lgY(vallgY / 3 * 2); lc; pqtd; av; pqtg; bc; av; pqtd;
   av; avf(- 2); phtg; lgX(vallgX * 2); lgY(vallgY * 7 / 2); 
   av; lc; p3htg; av; p3htg; bc; av; p3htg; lgY(vallgY * 2 / 7);
   lc; avf(- 1); bc; lg(X); ec(C);
  end;

  procedure CinqMille;
  begin
   lc; lg(X / 2); avf(11); lg(X); pqtd; avf(2); pqtg; bc;
   Mille (false);
   lc; pqtg; avf(4); pqtg; lg(X / 2); avf(11); lg(X); pdt; bc;
   Cinq;
  end;
 
  procedure CinqMilleTalents;
  begin
   lc; lg(X / 2); avf(11); lg(X); pqtd; avf(2); pqtg; bc;
   MilleTalents (false);
   lc; pqtg; avf(4); pqtg; lg(X / 2); avf(11); lg(X); pdt; bc;
   Cinq;
  end;

  procedure DixMille (GrandeTaille : boolean);
  begin
   if GrandeTaille then begin lg(X * 3); ec(C * 2); end;
   avf(3); lgY(vallgY * 2); p3htd; av; pqtg; av;
   lgY(vallgY / 2); p3htd; avf(3); pdt;
   lg(X); ec(C);
  end;
 
  procedure CinquanteMille;
  begin
   lc; lg(X / 2); avf(11); lg(X); pqtd; avf(2); pqtg; bc;
   DixMille(false);
   lc; pqtg; avf(4); pqtg; lg(X / 2); avf(11); lg(X); pdt; bc;
   Cinq;
  end;

  procedure EcrireChiffre (GrandNombre : boolean;
                           Unite, PuissanceDeDix, Chiffre : integer);
   var I : integer;
  begin
   case Unite of
    Talent: begin
             for I := 1 to (chiffre div 5) do
              begin
               case PuissanceDeDix of
                0 : begin CinqTalents; end;
                1 : begin CinquanteTalents; end;
                2 : begin CinqCentsTalents; end;
                3 : begin CinqMilleTalents; end;
               end;
               Espacement;
              end;
             for I := 1 to (chiffre mod 5) do
              begin
               case PuissanceDeDix of
                0 : begin UnTalent; end;
                1 : begin DixTalents (true); end;
                2 : begin CentTalents (true); end;
                3 : begin MilleTalents (true); end;
               end;
               Espacement;
              end;
            end;
    Drachme: begin
              for I := 1 to (chiffre div 5) do
               begin
                case PuissanceDeDix of
                 0 : begin Cinq; end;
                 1 : begin Cinquante; end;
                 2 : begin CinqCents; end;
                 3 : begin CinqMille; end;
                 4 : begin CinquanteMille; end;
                end;
               Espacement;
              end;
             for I := 1 to (chiffre mod 5) do
              begin
               case PuissanceDeDix of
                0 : begin
                     if GrandNombre 
                      then 
                        begin UnDrachme; end 
                      else 
                        begin Un; end;
                      end;
                1 : begin Dix (true); end;
                2 : begin Cent (true); end;
                3 : begin Mille (true); end;
                4 : begin DixMille (true); end;
               end;
               Espacement;
              end;
             end;
     Obole: begin
             for I := 1 to chiffre do
              begin
               Un;
               Espacement;
              end;
            end;
   end;
  end;

  procedure EcrireNombre (B : boolean; U, P : integer; 
                          C : longint);
  begin
   if (C < 10) then
    begin
     EcrireChiffre(B, U, P, C);
    end
   else
    begin
     EcrireNombre(B, U, (P + 1), C div 10);
     EcrireChiffre(B, U, P, C mod 10);
    end;
  end;

  procedure EcrireNombreEnGrec (C : longint);
   const GrandNombre = true;
  begin
   if C >= 100000 then
   { Grands nombres }
    begin
     EcrireNombre(GrandNombre, Talent, 0, ((C div 6) div 6000));
     EcrireNombre(GrandNombre, Drachme, 0, ((C div 6) mod 6000));
     EcrireNombre(GrandNombre, Obole, 0, C mod 6);
    end
   else
    { Numération achrophonique classique } 
    begin
     EcrireNombre(not GrandNombre, Drachme, 0, C);
    end;
  end;
 
 begin
  ec(C); eb; ag; lc; pne; av; pn; bc; lg(X); 
  EcrireNombreEnGrec(NombreACoder);
 end;
 
 {*** Numération romaine *************************************************}

 procedure NumerationRomaine(NombreACoder : longint);
 
  const 
   X = 3; { Taille de la grille }
 
  procedure Espacement (N : integer);
  begin
   lc; pqtd; avf(N); pqtg; bc;  
  end;
 
  procedure Un;
  begin
   avf(6); avf(- 6);
   Espacement(2);
  end;
  
  procedure Cinq;
  begin
   lc; avf(6); bc; p3htd; lgx(X * 2); lgY(X * 6); av; 
   pqtg; av; lc; p3htd; av; pdt; bc;lg(X);
   Espacement(2);  
  end;

  procedure Dix;
  begin
   lgX(X * 4); lgY(X * 6); phtd; av; lc; p3htg; av; bc; 
   p3htg; av; lc; p3htg; bc; lg(X);
   Espacement(2);  
  end;
  
  procedure Cinquante;
  begin
   avf(6); avf(- 6); pqtd; avf(4);
   pqtg;
   Espacement(2);
  end;

  procedure Cent;
  begin
   lc; lgX(X * 4); lgY(X * 2);phtd; av; bc; lgX(X * 2); 
   p3htd; vd; lgY(X * 3); vd; vd; lgY(X * 2); vd; lc; 
   avf(2); pdt; bc; lg(X);
   Espacement(2);  
  end;

  procedure CinqCents;
  begin
   avf(6); pqtd; avf(1); lg(X * 3); vd; vd; lg(X); av; 
   lc; avf(- 4); pqtd; bc;
   Espacement(2);
  end;
  
  procedure Mille;
  begin
   avf(6); lgX(X * 2); lgY(X * 5); p3htd; av; pqtg;  av; 
   lg(X); p3htd; avf(6); pdt;
   Espacement(2); 
  end;
 
  procedure Surligner (N : integer);
  begin
   lc; avf(8); pqtg; avf(2); bc; avf(N - 2); avf(- (N - 2)); 
   lc; avf(- 2); pqtd; avf(- 8); bc;
  end;
 
  procedure DebutFacteurCentMille;
  begin
   avf(8); pqtd; avf(2); avf(- 2); pqtg; avf(- 8);
   Espacement(2); 
  end;
 
  procedure FinFacteurCentMille;
  begin
   avf(8); pqtg; avf(2); avf(- 2); pqtd; avf(- 8);
   Espacement(4); 
  end;
 
  procedure EcrireNombreEnRomain (N : longint);
  begin
   if (N >= 1000) then
    begin
     Mille;  EcrireNombreEnRomain(N - 1000);
    end
   else if (N >= 950) then
    begin
     Cinquante;  Mille; EcrireNombreEnRomain(N - 950);
    end
   else if (N >= 900) then
    begin
     Cent;  Mille; EcrireNombreEnRomain(N - 900);
    end
   else if (N >= 500) then
    begin
     CinqCents;  EcrireNombreEnRomain(N - 500);
    end
   else if (N >= 400) then
    begin
     Cent;  CinqCents; EcrireNombreEnRomain(N - 400);
    end
   else  if (N >= 100) then
    begin
     Cent;  EcrireNombreEnRomain(N - 100);
    end
   else if (N >= 90) then
    begin
     Dix;  Cent; EcrireNombreEnRomain(N - 90);
    end
   else if (N >= 50) then
    begin
     Cinquante;  EcrireNombreEnRomain(N - 50);
    end
   else if (N >= 40) then
    begin
     Dix;  Cinquante; EcrireNombreEnRomain(N - 40);
    end
   else if (N >= 10) then
    begin
     Dix;  EcrireNombreEnRomain(N - 10);
    end
   else if (N >= 9) then
    begin
     Un;  Dix;
    end
   else if (N >= 5) then
    begin
     Cinq;  EcrireNombreEnRomain(N - 5);
    end
   else if (N >= 4) then
    begin
     Un;  Cinq; 
    end
   else if (N >= 1) then
    begin
     Un;  EcrireNombreEnRomain(N - 1);
    end
   else if (N = 0) then
    begin
    end;
   
  end;
 
  function Largeur (N : longint) : integer;
  begin
   Largeur := 0;
   if (N >= 1000) then
    begin
     Largeur := 6 + Largeur(N - 1000);
    end
   else if (N >= 950) then
    begin
     Largeur := 2 * 6 + Largeur(N - 950);
    end
   else if (N >= 900) then
    begin
     Largeur := 2 * 6 + Largeur(N - 900);
    end
   else if (N >= 500) then
    begin
     Largeur := 6 + Largeur(N - 500);
    end
   else if (N >= 400) then
    begin
     Largeur := 2 * 6 + Largeur(N - 400);
    end
   else  if (N >= 100) then
    begin
     Largeur := 6 + Largeur(N - 100);
    end
   else if (N >= 90) then
    begin
     Largeur := 2 * 6 + Largeur(N - 90);
    end
   else if (N >= 50) then
    begin
     Largeur := 6 + Largeur(N - 50);
    end
   else if (N >= 40) then
    begin
     Largeur := 2 * 6 + Largeur(N - 40);
    end
   else if (N >= 10) then
    begin
     Largeur := 6 + Largeur(N - 10);
    end
   else if (N >= 9) then
    begin
     Largeur := 2 + 6;
    end
   else if (N >= 5) then
    begin
     Largeur := 6 + Largeur(N - 5);
    end
   else if (N >= 4) then
    begin
     Largeur := 2 + 6;
    end
   else if (N >= 1) then
    begin
     Largeur := 2 + Largeur(N - 1);
    end
   else if (N = 0) then
    begin
    end;
   end;

  procedure NombreEnRomain (N : longint);
  begin
   if N >= 500000000 then
    begin
     writeln('Trop grand pour écrire en chiffres romains.');
    end
   else if N >= 100000 then
    begin
     DebutFacteurCentMille;
     EcrireNombreEnRomain(N div 100000);
     Surligner(Largeur(N div 100000));
     FinFacteurCentMille;
     NombreEnRomain(N mod 100000);
    end
   else if N < 5000 then
    begin
     EcrireNombreEnRomain(N);
    end
   else
    begin
     EcrireNombreEnRomain(N div 1000);
     Surligner(Largeur(N div 1000));
     Espacement(2);
     EcrireNombreEnRomain(N mod 1000);
    end;
  end;

 begin
  ag; eb; lc; av; pqtd; av; pqtg; bc; lg(X); Espacement(2);
  NombreEnRomain(NombreACoder);
 end;

 {*** Numération hexadécimale ********************************************}

 procedure DecimalEnHexadecimal(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnHexadecimal(-N);
   end
  else if (N >= 16) then
   begin
    DecimalEnHexadecimal(N div 16);
    DecimalEnHexadecimal(N mod 16);
   end
  else if (N = 15) then
   begin
    ecrire('F'); translater(1, 0);
   end
  else if (N = 14) then
   begin
    ecrire('E'); translater(1, 0);
   end
  else if (N = 13) then
   begin
    ecrire('D'); translater(1, 0);
   end
  else if (N = 12) then
   begin
    ecrire('C'); translater(1, 0);
   end
  else if (N = 11) then
   begin
    ecrire('B'); translater(1, 0);
   end
  else if (N = 10) then
   begin
    ecrire('A'); translater(1, 0);
   end
  else
   begin
    ecrire(EntierEnChaine(N)); translater(1, 0);
   end;
 end;
 
 {*** Numération décimale ************************************************}

 procedure DecimalEnDecimal(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnDecimal(-N);
   end
  else if (N >= 10) then
   begin
    DecimalEnDecimal(N div 10);
    DecimalEnDecimal(N mod 10);
   end
  else
   begin
    ecrire(EntierEnChaine(N)); translater(1, 0);
   end;
 end;
 
 {*** Numération octale **************************************************}

 procedure DecimalEnOctal(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnOctal(-N);
   end
  else if (N >= 8) then
   begin
    DecimalEnOctal(N div 8);
    DecimalEnOctal(N mod 8);
   end
  else
   begin
    ecrire(EntierEnChaine(N)); translater(1, 0);
   end;
 end;

 {*** Numération ternaire ************************************************}

 procedure DecimalEnTernaire(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnTernaire(-N);
   end
  else if (N = 0) then
   begin
    ecrire('0'); translater(1, 0);
   end
  else if (N = 1) then
   begin
    ecrire('1'); translater(1, 0);
   end
  else if (N = 2) then
   begin
    ecrire('2'); translater(1, 0);
   end
 else {N >= 3}
   begin
    DecimalEnTernaire(N div 3);
    DecimalEnTernaire(N mod 3);
   end;
 end;

 {*** Numération binaire *************************************************}

 procedure DecimalEnBinaire(N : longint);
 begin
  if (N < 0) then
   begin
    ecrire('-'); translater(1, 0);
    DecimalEnBinaire(-N);
   end
  else if (N = 0) then
   begin
    ecrire('0'); translater(1, 0);
   end
  else if (N = 1) then
   begin
    ecrire('1'); translater(1, 0);
   end
 else {N >= 2}
   begin
    DecimalEnBinaire(N div 2);
    DecimalEnBinaire(N mod 2);
   end;
 end;
 
 {*** Nombre à coder *****************************************************}
 const NombreACoder = 123456789;
 
begin
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération babylonienne.'));
 NumerationBabylonienne(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);

 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération égyptienne.'));
 NumerationEgyptienne(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);
 
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération grecque.'));
 NumerationGrecque(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);
 
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération romaine.'));
 NumerationRomaine(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);

 
 lg(16); PoliceTexte(Courier); StyleTexte(Gras); TailleTexte(24); eb; ag;
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération héxadécimale.'));
 DecimalEnHexadecimal(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);

 lg(16); PoliceTexte(Courier); StyleTexte(Gras); TailleTexte(24); eb; ag;
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération décimale.'));
 DecimalEnDecimal(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);

 lg(16); PoliceTexte(Courier); StyleTexte(Gras); TailleTexte(24); eb; ag;
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération octale.'));
 DecimalEnOctal(NombreACoder); 
 bip; bip; marquerUnePause; cf(blanc);

 lg(16); PoliceTexte(Courier); StyleTexte(Gras); TailleTexte(24); eb; ag;
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération ternaire.'));
 DecimalEnTernaire(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);

 lg(16); PoliceTexte(Courier); StyleTexte(Gras); TailleTexte(24); eb; ag;
 message(concat('Codage de ', entierEnchaine(NombreACoder), ' en numération binaire.'));
 DecimalEnBinaire(NombreACoder);
 bip; bip; marquerUnePause; cf(blanc);
end.

