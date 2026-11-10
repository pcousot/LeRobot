{$mode macpas} program Chenille;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Chenille, page 147.                                 *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleGrille = 6;
  NombreDanneaux = 7;
 
 procedure AGauche (N : integer);
  { Décentrer à gauche de la moitié de la longueur de la chenille }
 begin
  lg(2 * TailleGrille); lc; pqtg; avf(N); pqtd; bc;
 end;
        
 procedure Dos (N : integer);
 { Dessiner le dos de la chenille comportant N anneaux de rayon }
 { égal à (2 * TailleGrille)                                    }
  var I : integer;
 begin
  lg(2 * TailleGrille); 
  for I := 1 to N do
   begin
    vd; vd; pdt;
   end;
  pdt; vd;
 end;
 
 procedure Patte;
  { Dessiner une patte de la chenille de longueur TailleGrille }
 begin
  lg(TailleGrille); pqtg; av; pdt; av; pqtg;  
 end;

 procedure Pattes (P : integer);
  { Dessiner P pattes de la chenille espacées de (2 * TailleGrille) }
  var I : integer;
 begin
  Patte;
  for I := 1 to (P - 1) do
   begin
    lg(2 * TailleGrille); av; Patte;
   end;
 end;
 
 procedure Tete;
  { Dessinerla tête de la chenille }
 begin
  lg(TailleGrille); vd; vd; 
  { Oeil } lc; lg(2 * TailleGrille); av; pqtg; bc; dc;
  cc(jaune); peindre;
 end;
 
 procedure Chenille (N : integer);
  { Dessiner une chenille de N anneaux et (2 * N) pattes }
 begin
  AGauche(N); Dos(N); Pattes(2 * N); Tete;
 end;

begin
 Chenille(NombreDanneaux); st;
end.