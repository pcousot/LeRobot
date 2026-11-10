{$mode macpas} program DessinerCadreAuBord;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 43, page 274.                              *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner un cadre autour de l'écran }
 
 procedure AuBord;
  { Gagner le bord du cadre rapidement }
  var Fin : boolean; I : Integer;
 begin
  Fin := false; I := 4096;
  while not Fin do begin
   lg(I);
   while not tb do
    begin
     av;
    end;
   if I <= 1 then
    Fin := true
   else
    I := I div 2;
  end;
 end;
 
 procedure RejoindreCoinNE;
 begin
  lc; pn; AuBord; pe; AuBord; bc;
 end;
  
 procedure DessinerCadre;
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    pqtd; AuBord;
   end;
 end;
 
begin
 RejoindreCoinNE; DessinerCadre; ce; st;
end.