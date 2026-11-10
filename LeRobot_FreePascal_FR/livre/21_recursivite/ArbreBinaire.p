{$mode macpas} program ArbreBinaire;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* ArbreBinaire, pages 248-249.                        *}
 {*                                                     *}
 {*******************************************************}

 procedure Arbre(L : integer);
  { Dessiner un arbre à L feuilles, la racine en haut, les feuilles }
  { en bas, en supposant que L >= 1,  l'arbre  étant  réduit  à  un }
  { point quand L = 1. Avant et après le dessin, le robot doit être }
  { placé  à  la racine de l'arbre, orienté au nord avec son crayon }
  { baissé.                                                         }
 begin
  if (L = 1) then
   begin
    { Dessiner  un  arbre  réduit  à un seul point (sans changer la }
    { position et l'orientation du robot).                          }
    dp;
   end
  else { L > 1 }
   begin
    { Le robot étant placé à la racine de l'arbre,  orienté au nord }
    { avec son crayon baissé, dessiner la branche sud-ouest.        }
    p3htg; avf(L); 
    { Orienter le robot au nord.                                    }
    p3htd;
    { Dessiner le sous-arbre gauche ayant  (L div 2) >= 1 feuilles, }
    { le  robot  étant  placé à la racine du sous-arbre, orienté au }
    { nord avec son crayon baissé.                                  }
    Arbre(L div 2); 
    { Sachant que le robot est placé à la racine du sous-arbre gau- }
    { che, orienté au nord et crayon baissé, revenir à la racine de }
    { l'arbre, sans rien dessiner.                                  }
    lc; phtd; avf(L); 
    { Le robot étant placé à la racine de l'arbre, orienté au nord- }
    { est avec son crayon levé, dessiner la branche sud-est.        }
    bc; pqtd; avf(L); 
    { Orienter le robot au nord.                                    }
    p3htg; 
    { Dessiner le  sous-arbre  droit  ayant  (L - (L div 2))  >=  1 }
    { feuilles,  le  robot  étant  placé à la racine du sous-arbre, }
    { orienté au nord avec son crayon baissé.                       }
    Arbre(L - (L div 2)); 
    { Placer le robot à la racine de l'arbre,  orienté au nord avec }
    { son crayon baissé.                                            }
    lc; phtg; avf(L); phtd; bc; 
   end;
 end;

begin
 lgX(2); lgY(3); eh; Arbre(32); st;
end.