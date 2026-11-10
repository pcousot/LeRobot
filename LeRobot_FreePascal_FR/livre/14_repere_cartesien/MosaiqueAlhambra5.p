{$mode macpas} program MosaiqueAlhambra5;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Mosaique de l'Alhambra, page 155.                   *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleGrilleX = 6;
  TailleGrilleY = 6;
  NombreDeMotifsParLigne = 4;
  NombreDeLignes = 4;  
  LargeurMotif = 6;
  HauteurMotif = 8;
  EspaceEntreMotifs = 2; { > 1 }

 procedure Motif;
 begin
  vg; pqtd; av; pqtg; av; lgY(2 * TailleGrilleY); pqtd; vg; 
  lgY(TailleGrilleY); pqtd; vd; pqtg; av; pqtd; av; pqtg; 
  lgY(2 * TailleGrilleY); vd; vd; lgY(TailleGrilleY); pqtg; 
  av; pqtd; av; pqtg; vd; pqtd; lgY(2 * TailleGrilleY); vg; 
  pqtd; lgY(TailleGrilleY); av; pqtg; av; pqtd; vg; pdt; 
 end; 

 procedure Ligne;
  var I : integer;
 begin
  for I := 1 to NombreDeMotifsParLigne do
   begin
    Motif; translater(LargeurMotif + EspaceEntreMotifs, 0);
   end;
 end;
 
 procedure Pavage;
  var J : integer;
 begin
  for J := 1 to NombreDeLignes do
   begin
    deplacer(-(((NombreDeMotifsParLigne + (J mod 2)) * 
                (LargeurMotif + EspaceEntreMotifs)) div 2), 
             -(((HauteurMotif + EspaceEntreMotifs) * 
                (J - (NombreDeLignes div 2))) div 2));
    Ligne;
   end;
 end;
 
 procedure Cadre;
  var I : integer;
 begin
  translater( - ((LargeurMotif + EspaceEntreMotifs) div 2) *
                  (1 div NombreDeLignes)
              - (LargeurMotif div 2) * ((NombreDeLignes + 1) mod 2)
              + (EspaceEntreMotifs div 2) * (NombreDeLignes  mod 2),
              - EspaceEntreMotifs);
  for I := 1 to 2 do
   begin
    avf(((NombreDeLignes + 1) div 2) * (HauteurMotif + EspaceEntreMotifs) +
          ((HauteurMotif - EspaceEntreMotifs) div 2) *
            ((NombreDeLignes + 1) mod 2) +
          ((NombreDeLignes + 1) mod 2 +1) * EspaceEntreMotifs );
    pqtg; 
    avf(- ((LargeurMotif + EspaceEntreMotifs) div 2) *
            (1 div NombreDeLignes)
        + (NombreDeMotifsParLigne * (LargeurMotif + EspaceEntreMotifs))
        + ((LargeurMotif + EspaceEntreMotifs) div 2)
        + EspaceEntreMotifs);
    pqtg; 
   end;
 end;
 
begin
 lgX(TailleGrilleX); lgY(TailleGrilleY);
 Pavage; Cadre; p3htd; peindre;
 st;
end.