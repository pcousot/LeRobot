{$mode macpas} program  MosaiqueAlhambra6;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Mosaïque de l'Alhambra, pages 180, 182-184.         *}
 {*                                                     *}
 {*******************************************************}

 const 
  TailleDeGrille = 8; { doit être pair }
  NombreDeLignes = 4;
  NombreDeColonnes = 8;
      
 procedure DemiMotif;
 begin
  phtd; av; phtd; av; pqtg; av; 
  lg(TailleDeGrille div 2); p3htd; av; pqtg; av;
  lg(TailleDeGrille); p3htd; av; pqtg; av; phtd; av; p3htd; avf(2);
  lg(TailleDeGrille div 2); phtg; av; pqtd; av;
  lg(TailleDeGrille); phtg; avf(2);
  { Peindre }
  avf(-1); phtg; 
  if (tsw or tne) then 
   begin 
    cc(jaune); 
   end 
  else
   begin
    cc(indigo);
   end;
  peindre;
  cc(noir); phtd; av;
 { Remettre le robot dans l'orientation initiale }  
 pqtd; 
end;

 procedure Motif;
 begin
  DemiMotif; 
  lc; pqtd; avf(5); pqtd; av; bc;
  DemiMotif;
 end;

 procedure MotifDouble;
 begin
  Motif; 
  { Motif suivant } 
  lc; phtg; avf(2); p3htd; bc;
  Motif;
 end;

 var
  I : integer;
  J : integer;
     
begin
 lg(TailleDeGrille); eh; ag; translater(1, -3);
 for J := 1 to NombreDeLignes do
  begin
   for I := 1 to (NombreDeColonnes div 2) do 
    begin
     MotifDouble;
     { MotifDouble suivant } 
     lc; phtd; avf(2); p3htg; bc;
    end;
   { Ligne suivante } 
    if odd(J) then
     begin
      lc; pdt; avf(6); bc; 
     end
    else
     begin
      lc; avf(4); pdt; bc;
     end;
  end; 
 st;
end.