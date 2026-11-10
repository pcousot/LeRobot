{$mode macpas} program NumerationGrecque;
 uses Robot1, Robot2, Robot3;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 43, page 276-277.                          *}
 {*                                                     *}
 {*******************************************************}

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
   Talent : begin
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
   Drachme : begin
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
    Obole : begin
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
 
 var NombreACoder : longint;
 
begin
 modeTexte; write('Nombre à coder N = '); readln(NombreACoder);
 ec(C); lg(X); ag;
 EcrireNombreEnGrec(NombreACoder);
 st;
end.