{$mode macpas} program Addition_A_Completer;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {*                                                     *}
 {*******************************************************}

 const
  NbChiffresMax = 15;
  NbChiffresMaxP1 = 16; { NbChiffresMax + 1 }

 type
  TypeChiffre = 0..9;
  TypeNombre = array [1..NbChiffresMaxP1] of TypeChiffre;
  TypePosition = array [1..NbChiffresMaxP1] of boolean;

 var 
  NbChiffres : integer;
  R  : TypeNombre; { Retenues (4 ème ligne en comptant du bas)}
  RP : TypePosition; { Chiffres de R découveRPs }
  A  : TypeNombre; { A (3 ème ligne en comptant du bas)}
  B  : TypeNombre; { B (2 ème ligne en comptant du bas)}
  S  : TypeNombre; { A + B (1 ère ligne en comptant du bas)}
  SP : TypePosition; { Chiffres de S découveRPs }
  Equ : array [TypeChiffre] of char; { Caractères figurant sur les mêmes touches que les }
   { chiffres sur le claviuer AZERTY }
 
 procedure InitialiserAetBauHasard;
  var I : integer;
 begin
  A[1] := 0;
  for I := 2 to (NbChiffres + 1) do
   begin
    A[I] := abs(Random + TickCount) mod 10;
   end;
  B[1] := 0;
  for I := 2 to (NbChiffres + 1) do
   begin
    B[I] := abs(Random + TickCount) mod 10;
   end;
 end;
 
 procedure Additionner;
  { S := A + B, retenues dans R }
  var I : integer;
      SC : integer;
 begin
  R[NbChiffres + 1] := 0;
  for I := (NbChiffres + 1) downto 2 do
   begin
    SC := R[I] + A[I] + B[I];
    if SC < 10 then
     begin
      R[I - 1] := 0;
      S[I] := SC;
     end
    else
     begin
      R[I - 1] := 1;
      S[I] := SC - 10;
     end;
   end;
  S[1] := R[1];
 end;
 
 procedure MarquerAucunChiffreTrouve;
  { Marquer les chiffres de R et S restant à trouver }
  var I : integer;
 begin
  for I := 1 to (NbChiffres + 1) do
   begin
    RP[I] := false;
    SP[I] := false;
   end;
  RP[1] := true; { La retenue de poids fort est portée directement dans le résultat S }
  if S[1] = 0 then { Le chiffre de poids fort du résultat S est non nul }
   begin
    SP[1] := true;
   end;
  RP[NbChiffres + 1] := true; { Pas de retenue de poids faible }
 end;
 
 procedure EcrireChiffre(S: integer; X, Y : integer; C : TypeChiffre);
  { Ecrire le chiffre C dans le style S en position (X, Y) par rapport au centre }
 begin
  deplacer(X, Y);
  styleTexte(S);
  Ecrire(char(ord('0') + C));
  styleTexte(Normal);
 end;
 
 procedure BipBipBip;
 begin
  Bip;Bip;Bip;
 end;
 
 var
  NbErreurs : integer;
  NbAdditionsEssayees : integer;
  NbAdditionsReussies : integer;
  
 procedure Erreur;
 begin
  BipBipBip; NbErreurs := NbErreurs + 1;
 end;
 
 var C : char; 
 
 procedure CarEnChiffreEtEcrire(C : char; I : TypeChiffre; X, Y : integer; var R : boolean);
  { Lire le chiffre I au clavier (en indiquant les erreurs par un 'bip' }
  var Fin : boolean;
 begin
   R := (ord(C) = (ord('0') + I)) or (C = Equ[I]);
   if R then
    begin
     EcrireChiffre(Normal, X, Y, I);
    end
   else
    begin
     Erreur;
    end;
 end;
 
 procedure EcrireNombre(S: integer; Y : integer; N : TypeNombre; P, D : integer);
  { Ecrire le nombre N, du chiffre de rang P au chiffre de rang D, à la ligne Y }
  { (les lignes étant comptées de bas en haut) dans le style S (Gras ou Normal) }
  var
   I : integer; 
   J : integer;
 begin
  I := P;
  while (N[I] = 0) and (I < D) do
   begin
    I := I + 1;
   end;
  for J := I to D do
   begin
    EcrireChiffre(S, J, Y, N[J]);
   end;
 end;
 
 procedure MarquerEmplacement (Y : integer; P, D : integer);
  { Marquer  les  emplacements  des chiffres de rang P au rang D, d'un nombre  }
  { qui serait écrit à la ligne Y (les lignes étant comptées de bas en haut). }
  var
   I : integer;
 begin
  for I := P to D do
   begin
    deplacer(I, Y); dp;
   end;
 end;

 procedure Barre;
  { Dessiner la barre d'opération à la ligne 1 }
  var
   I : integer;
 begin
  deplacer(0, 1); pe; 
  for I := 1 to (NbChiffres + 2) do
   begin
    av;
   end;
  pn;
 end;
 
 procedure SigneAddition;
  { Dessiner le signe d'addition à la ligne 2 }
 begin
  deplacer(0, 2);
  styleTexte(Gras);
  ecrire(concat('+'));
  styleTexte(Normal);
 end;
 
 function OperationTerminee : boolean;
  { Retourne vrai ssi toutes les positions a compléter l'ont été }
  var
   Res : boolean;
   I : integer;
 begin
  Res := true;
  for I := 1 to (NbChiffres + 1) do
   begin
    Res := Res
         and (RP[I] or (R[I] = 0)) { Ne pas exiger que les retenues égales a zéro soient complétées }
         and SP[I];
   end;
  OperationTerminee := Res;
 end;
 
 procedure CompleterOperation;
  { Compléter l'opération en désignant à chauqe fois un emplacement avec la souris et }
  { en tapant un chiffre, les erreurs étant signalées par un 'bip' }
  var
   X, Y : integer; { Coordonnees de la souris }
   RL : boolean;
   C : char;
 begin
  while not OperationTerminee do
   begin
    ce; 
    Message('Désigner un emplacement avec la souris ou les flèches et taper un chiffre.');
    Interaction(X, Y, C, false, false, false, false, false);
    if (Y = 0) then
     begin
      if not SP[X] then 
       begin
        CarEnChiffreEtEcrire(C, S[X], X, Y, RL);
        SP[X] := RL;
       end
      else
       begin
        BipBipBip;
       end;
     end
    else if (Y = 4) then
     begin
      if not RP[X] then 
       begin
        CarEnChiffreEtEcrire(C, R[X], X, Y, RL);
        RP[X] := RL;
       end
      else
       begin
        BipBipBip;
       end;
     end
    else
     begin
      BipBipBip;
     end;
   end;
  ce;
 end;
 
 procedure EffacerFenetreTexte;
  var I : integer;
 begin
  modeTexte;
  for I := 1 to 25 do
   begin
    writeln;
   end;
 end;
 
begin
 Equ[0] := #224; { Equivalent miniscule des chiffres sur les claviers AZERTY }
 Equ[1] := '&';
 Equ[2] := #233;
 Equ[3] := '"';
 Equ[4] := '''';
 Equ[5] := '(';
 Equ[6] := #167;
 Equ[7] := #232;
 Equ[8] := '!';
 Equ[9] := #231;
 NbAdditionsEssayees := 0;
 NbAdditionsReussies := 0;
 EffacerFenetreTexte;
 repeat
  write('Additions à combien de chiffres ? (réponse entre 1 et ', NbChiffresMax : 1,') : ');
  readln(NbChiffres);
  if (NbChiffres < 1) then
   begin
    writeln('Erreur, pas assez de chiffres. Recommencer...');
   end;
  if (NbChiffres > NbChiffresMax) then
   begin
    writeln('Erreur, addition avec trop de chiffres. Recommencer...');
   end;
 until (1 <= NbChiffres)  and (NbChiffres <= NbChiffresMax);
 repeat
   InitialiserAetBauHasard;
   Additionner;
   MarquerAucunChiffreTrouve;
   MarquerEmplacement(4, 2, NbChiffres); { Retenue R}
   EcrireNombre(Gras, 3, B, 2, NbChiffres + 1); { Nombre A }
   EcrireNombre(Gras, 2, A, 2, NbChiffres + 1); { Nombre B }
   SigneAddition; Barre;
   if S[1] <> 0 then
    begin
     MarquerEmplacement(0, 1, NbChiffres + 1); { S = A + B }
    end
   else
    begin
     MarquerEmplacement(0, 2, NbChiffres + 1); { S = A + B }
    end;
   ce;
   NbErreurs := 0;
   CompleterOperation;
   NbAdditionsEssayees := NbAdditionsEssayees + 1;
   if NbErreurs = 0 then
    begin
     NbAdditionsReussies := NbAdditionsReussies + 1;
     Message('Félicitations, aucune erreur !');
    end
   else if NbErreurs = 1 then
    begin
     Message('Dommage, une seule erreur !');
    end
   else
    begin
     Message(concat(EntierEnChaine(NbErreurs),' erreurs !'));
    end;
   MarquerUnePause;
   ce; cf(Blanc);
   Message('Avez-vous terminé vos opérations ? (répondre ''O'' ou ''N'')');
   LireCar(C);
 until (C = 'o') or (C = 'O') or (C = '0');
 EffacerFenetreTexte;
 if NbAdditionsReussies = NbAdditionsEssayees then
   begin
    if NbAdditionsEssayees = 1 then 
      begin
       writeln('Bravo, vous avez réussi votre opération sans erreurs !');
      end
     else
      begin
       writeln('Félicitations, vous avez réussi toutes vos opérations sans aucune faute !');
      end
   end
 else if NbAdditionsEssayees = 1 then
  begin
   writeln('Dommage, vous n''avez pas réussi votre opération du premier coup !');
  end
 else if NbAdditionsReussies = 1 then
  begin
   writeln('Une opération réussie du premier coup sur ', NbAdditionsEssayees : 1, ' essais');
  end
 else
  begin
   writeln(NbAdditionsReussies : 1, ' opérations réussies sans fautes sur ', NbAdditionsEssayees : 1, ' tentatives');
  end;
 writeln;
 writeln('Terminer en tapant la touche ''Retour-chariot''.');
 readln;
end.