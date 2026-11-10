{$mode macpas} program PavageDuTriangleAlaEscherPeint;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage du triangle à la Escher, page 233.           *}
 {*                                                     *}
 {*******************************************************}

 const 
  R = 5; { Taille d'une branche de l'étoile }
 
 procedure Hexagone;
  var I : integer;
 begin
 for I := 1 to 6 do 
  begin
   av; rt(60);
  end;
 end;
 
 procedure Etoile;
  var I : integer;
 begin
  for I := 1 to 6 do 
   begin
    av; rt(60); av; rt(240);
   end;
 end;
 
  procedure TriangleOndule;
 begin
  phtd; vd; vg; lgrt(valLgX, 60); p3htg; vd; vg; pqtg; vd; vg;
 end;
 
 procedure Motif;
 begin
  { Triangle }
  lg(R * 5); TriangleOndule;
  { Hexagone }
  lc; pqtg; lg(R * 5); av; phtg; lg(R); av; bc; lgrt(R * 2, 54); 
  bc; Hexagone; lc; pdt; lg(R); av; peindre; p3htg; lg(R * 5); 
  av; pqtg; bc;
  { Etoile }
  lc; lgrt(R * 5, 60); avf(2); lg(R); pdt; av; lgrt(R, 60); phtg; bc;
  Etoile; lc; phtd; lg(R); pdt; peindre; av; lgrt(R * 5, 60); avf(- 2); 
  bc;
 end;
 
 procedure MotifSansEtoile;
 begin
  { Triangle }
  lg(R * 5); TriangleOndule;
  { Hexagone }
  lc; pqtg; lg(R * 5); av; phtg; lg(R); av; bc; lgrt(R * 2, 54); 
  bc; Hexagone; lc; pdt; lg(R); av; peindre; p3htg; lg(R * 5); 
  av; pqtg; bc;
 end;

 var
  I : integer;
  J : integer;
begin
 for J := 1 to 3 do
  begin
   for I := 1 to (J -1) do
    begin
     Motif;
    end;
    MotifSansEtoile;
     lc; lg(R * 5); pqtg; avf(J * 2 + 1); pqtg; lgrt(R * 5, 60); 
     avf(2); pdt; bc; 
  end;  
 st;
end.