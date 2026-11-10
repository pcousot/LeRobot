{$mode macpas} program NumerationBabylonienne;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 43, page 274-275.                          *}
 {*                                                     *}
 {*******************************************************}

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
   1 : begin Dix; end;
   2 : begin Dix; Dix; end; 
   3 : begin Dix; Dix; Dix; end; 
   4 : begin 
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
   1 : begin Un(4); end;
   2 : begin Un(4); Un(4); end; 
   3 : begin Un(4); Un(4); Un(4); end; 
   4 : begin 
        lc; pqtd; av; pqtg; bc;
        lg(X * 2); TeteDeClou; lg(X);
        lc; avf(4); pqtg; avf(5); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
   5 : begin
        lc; pqtd; av; pqtg; bc;
        Un(2); Un(2);
        lc; avf(4); pqtg; avf(5); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
   6 : begin
        Un(2); Un(2); Un(2);
        lc;avf(4); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
   7 : begin 
        lc; pqtd; av; pqtg; bc;
        lgX(X * 2); TeteDeClou;
        lc; avf(2); pqtg; avf(5); pqtd;bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
   8 : begin 
        lc; pqtd; av; pqtg; bc;
        TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(5); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(2); pqtg; avf(6); pqtd; bc;
        TeteDeClou; TeteDeClou; TeteDeClou;
        lc; avf(- 4); bc;
       end;
   9 : begin 
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

 var NombreACoder : longint;
 
begin
 modeTexte; write('Nombre à coder N = '); readln(NombreACoder);
 lg(X); ag;
 NombreEnBabylonien(NombreACoder);
 st;
end.