{$mode macpas} program TableauDeTournoi;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* TableauDeTournoi, pages 246-247.                    *}
 {*                                                     *}
 {*******************************************************}

 const
  L = 5; { Longueur d'un trait horizontal }

 procedure Tableau(N : integer);
  { Dessiner un tableau pour un tournoi de N }
  { joueurs                                  }
 begin
  { Pointe de l'accolade, pour le vainqueur }
  avf(L); 
  if (N > 1) then
   begin
     { Branche supérieure de l'accolade }
     pqtg; avf(N); pqtd;
     { Sous-tableau supérieur, contenant la }
     { moitié des joueurs                   }
     Tableau(N div 2); 
     { Revenir au centre de l'accolade }
     lc; pqtg; avf(-N); pqtd; bc; 
     { Branche inférieure de l'accolade }
     pqtd; avf(N); pqtg;
     { Sous-tableau inférieur, contenant le }
     { reste des joueurs                    }
     Tableau(N - (N div 2)); 
     { Revenir au centre de l'accolade }
     lc; pqtd; avf(-N); pqtg; bc; 
   end;
  { Revenir à l'extrémité de la pointe }
  avf(-L); 
 end;

begin
 lg(3); pe; Tableau(16); st;
end.