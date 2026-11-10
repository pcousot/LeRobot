{$mode macpas} program DeuxPuissance;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* DeuxPuissance, page 267.                            *}
 {*                                                     *}
 {*******************************************************}

 function DeuxPuissance(N : integer) : longint;
 begin
  if (N = 0) then
   begin
    DeuxPuissance := 1;
   end
  else
   begin
    DeuxPuissance := (2 * DeuxPuissance(N - 1));
   end;
 end;

 { Conversion d'un entier de type longint en une chaine de caractères }
 { écrite sur l'écran. }
 
 procedure Chiffre(C : integer);
  { Dessiner le chiffre C, le robot partant en bas à gauche et terminant }
  { dans la même position }
 begin
  bc; pn;
  case C of
   0 : begin
        av; av; pqtd; av; pqtd; av; av; pqtd; av; pqtd; 
       end;
   1 : begin
        lc; pqtd; av; pqtg; av; av; pdt; bc; av; av; lc; pqtd; av; pqtd; 
       end;
   2 : begin
        lc; av; av; pqtd; bc; av; pqtd; av; pqtd; av; pqtg; av; pqtg; av; pdt; av; pqtd; 
       end;
   3 : begin
        lc; av; av; pqtd; bc; av; pqtd; av; pqtd; av; pdt; av; pqtd; av; pqtd; av; pqtd; 
       end;
   4 : begin
        lc; av; av; pdt; bc; av; pqtg; av; pqtg; av; pdt; av; av; lc; pqtd; av; pqtd;
       end;
   5 : begin
        pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; av; lc; pqtd; av; av; pqtd; av; pqtd; 
       end;
   6 : begin
        av; pqtd; av; pqtd; av; pqtd; av; pqtd; av; av; pqtd; av; lc; pqtd; av; av; pqtd; av; pqtd; 
       end;
   7 : begin
        lc; av; av; pqtd; bc; av; pqtd; av; av; pqtd; lc; av; pqtd; 
       end;
   8 : begin
        av; pqtd; av; pdt; av; pqtd; av; pqtd; av; pqtd; av; av; pqtd; av; pqtd; 
       end;
   9 : begin
        lc; av; bc; pqtd; av; pdt; av; pqtd; av; pqtd; av; pqtd; av; av; pqtd; av; pqtd; 
       end;
  end;
 end;
 
 procedure Esp;
  { Laisser un espace entre deux nombres }
 begin
  lc; pe; av; av; 
 end;
 
 procedure Moins;
  { Dessiner un signe - }
 begin
  pn; lc; av; pqtd; bc; av; lc; pqtd; av; pqtd; av; pqtd;
 end;
 
 procedure EntierEnChaine(N : longint);
  { Ecrire le nombre N }
 begin
  if (0 <= N) and (N <= 9) then
   begin
    Chiffre(N);
   end
  else
   begin
    if (N < 0) then
     begin
      Moins; Esp; EntierEnChaine(-N);
     end
    else
     begin
      EntierEnChaine(N div 10); Esp; EntierEnChaine(N mod 10);
     end;
   end;
 end;
 
begin
 ag; EntierEnChaine(DeuxPuissance(16)); st;
end.