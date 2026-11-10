{$mode macpas} program MosaiqueAlhambra4;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Mosaïque de l'Alhambra en couleur, page 135.        *}
 {*                                                     *}
 {*******************************************************}

 const 
  NombreDeLignes  = 3;
  NombreDeColonnes = 7;
      
 procedure Motif1;
 begin
  phtd; av; p3htd; avf(2); p3htg; av; p3htg; av;
  { Peindre}  
  phtd; cc(indigo); peindre; cc(noir); phtg; av; avf(-1); p3htg;  
  cc(jaune); peindre; cc(noir); p3htd;
  { Continuer } 
  av; 
 end;
 
 procedure Motif2;
  var I : integer;
 begin
  for I := 1 to 2 do
   begin
    av; p3htd; av; phtg; av; pqtd; av; phtg; av; p3htd; av; pqtg; 
   end;
  cc(violet); peindre; cc(noir);
 end;

 var 
  I : integer;
  J : integer;
     
begin
 eh; ag; lc; avf(-2); bc;
 for J := 1 to NombreDeLignes do
  begin
   for I := 1 to NombreDeColonnes do 
    begin
     Motif1;
     { Motif2 suivant } 
     lc; avf(- 2); pqtd; av; bc; 
      Motif2;
     { Motif1 suivant } 
     lc; avf(-1); pqtd; avf(2); pqtg; bc;
    end;
    { Ligne paire suivante } 
    lc; pdt; avf(2); bc; 
    for I := 1 to NombreDeColonnes do 
     begin
      Motif1;
      { Motif1 suivant } 
      lc; pdt; avf(4); pqtg; bc; 
     end;
    { Ligne impaire suivante } 
    lc; avf(2); pdt; bc; 
  end; 
  st;
end.