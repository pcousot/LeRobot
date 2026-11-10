{$mode macpas} program CarreMagique;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Carrés magiques d'ordres 3, 5 et 7, pages 278 280.  *}
 {*                                                     *}
 {*******************************************************}
 var
  N : integer;  { Ordre du carré magique (impair) }
  I : integer;  { Indice des lignes (de 1 à N de bas en haut) }
  J : integer;  { Indice des colonnes (de 1 à N de gauche à droite) }
  C : integer;  { Elément de la ligne I et de la colonne J }
  
 procedure Afficher(I : integer; J : integer; C : integer);
  { Afficher l'élément C au point de coordonnées (I, J) du carré }
 begin
  eb; ag; translater((2 * (I - 1)), ((2 * J) - 1));
  Ecrire(concat(' ', EntierEnChaine(C)));
 end;
 
begin
 { Lire l'ordre du carré magique }
 modetexte; { Montrer la fenêtre d'entrées-sorties de Pascal }
 repeat
  write('Ordre du carré magique (impair), N = ');
  readln(N);
 until ((N > 0) and odd(N));
 { Dessiner la matrice dans la fenêtre de dessin du robot }
 lg(12); CacherRobot;
 for I := 0 to N do
  begin
   eb; ag; translater((2 * I), 0); pn; avf(2 * N);
   eb; ag; translater(0, (2 * I)); pe; avf(2 * N);
  end; 
	{ Remplir le carré magique }
 I := (N + 1) div 2; J := N; Afficher(I, J, 1);
 for C := 2 to sqr(N) do
  begin
   if (C mod N) <> 1 then
    begin
     I := (I mod N) + 1;
     J := (J mod N) + 1;
    end
   else
    begin
     J := J - 1;
    end;
			Afficher(I, J, C);
  end;
 st;
end.
