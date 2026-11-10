(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(**                                                     **)
(*********************************************************)

open LibRobot

let nbChiffresMax = 15
let nbChiffresMaxP1 = 16
(* NbChiffresMax + 1 *)
let nbChiffres = ref 0
let r = Array.make (nbChiffresMaxP1 + 1) 0
(* Retenues (4 ème ligne en comptant du bas) *)
let rP = Array.make (nbChiffresMaxP1 + 1) false
(* Chiffres de R découveRPs *)
let a = Array.make (nbChiffresMaxP1 + 1) 0
(* A (3 ème ligne en comptant du bas) *)
let b = Array.make (nbChiffresMaxP1 + 1) 0
(* B (2 ème ligne en comptant du bas) *)
let s = Array.make (nbChiffresMaxP1 + 1) 0
(* A + B (1 ère ligne en comptant du bas) *)
let sP = Array.make (nbChiffresMaxP1 + 1) false
(* Chiffres de S découveRPs *)
let equ = Array.make (9 + 1) ' '

(* Caractères figurant sur les mêmes touches que les *)
(* chiffres sur le claviuer AZERTY *)
let initialiserAetBauHasard () =
  begin
    a.(1) <- 0;
    for i = 2 to !nbChiffres + 1 do a.(i) <- abs (random () + tickCount ()) mod 10 done;
    b.(1) <- 0;
    for i = 2 to !nbChiffres + 1 do b.(i) <- abs (random () + tickCount ()) mod 10 done
  end

let additionner () =
  (* S := A + B, retenues dans R *)
  let sC = ref 0 in
  begin
    r.(!nbChiffres + 1) <- 0;
    for i = !nbChiffres + 1 downto 2 do
      sC := r.(i) + a.(i) + b.(i);
      if !sC < 10 then begin
        r.(i - 1) <- 0;
        s.(i) <- !sC
      end else begin
        r.(i - 1) <- 1;
        s.(i) <- !sC - 10
      end
    done;
    s.(1) <- r.(1)
  end

let marquerAucunChiffreTrouve () =
  (* Marquer les chiffres de R et S restant à trouver *)
  begin
    for i = 1 to !nbChiffres + 1 do
      rP.(i) <- false;
      sP.(i) <- false
    done;
    rP.(1) <- true; (* La retenue de poids fort est portée directement dans le résultat S *)
    if s.(1) = 0 then sP.(1) <- true;
    rP.(!nbChiffres + 1) <- true (* Pas de retenue de poids faible *)
  end

(* Marque d'un emplacement a completer : un petit carre (un seul point se
   voyait a peine sur les ecrans actuels) *)
let marque couleur =
  cc couleur; ec 3; dp (); ec 1; cc noir

let ecrireChiffre s x y c =
  (* Ecrire le chiffre C dans le style S en position (X, Y) par rapport au centre *)
  begin
    deplacer (x, y);
    marque blanc; (* effacer la marque de l'emplacement *)
    styleTexte s;
    ecrire (String.make 1 (Char.chr (Char.code '0' + c)));
    styleTexte normal
  end

let bipBipBip () =
  begin
    bip (); bip (); bip ()
  end

let nbErreurs = ref 0
let nbAdditionsEssayees = ref 0
let nbAdditionsReussies = ref 0

let erreur () =
  begin
    bipBipBip (); nbErreurs := !nbErreurs + 1
  end

let c = ref ' '

let carEnChiffreEtEcrire c i x y r =
  (* Lire le chiffre I au clavier (en indiquant les erreurs par un 'bip' *)
  let fin = ref false in
  begin
    r := Char.code c = Char.code '0' + i || c = equ.(i);
    if !r then ecrireChiffre normal x y i
    else erreur ()
  end

let ecrireNombre s y n p d =
  (* Ecrire le nombre N, du chiffre de rang P au chiffre de rang D, à la ligne Y *)
  (* (les lignes étant comptées de bas en haut) dans le style S (Gras ou Normal) *)
  let i = ref 0 in
  begin
    i := p;
    while n.(!i) = 0 && !i < d do i := !i + 1 done;
    for j = !i to d do ecrireChiffre s j y n.(j) done
  end

let marquerEmplacement y p d =
  (* Marquer  les  emplacements  des chiffres de rang P au rang D, d'un nombre  *)
  (* qui serait écrit à la ligne Y (les lignes étant comptées de bas en haut). *)
  for i = p to d do deplacer (i, y); marque noir done

let barre () =
  (* Dessiner la barre d'opération à la ligne 1 *)
  begin
    deplacer (0, 1); pe ();
    for i = 1 to !nbChiffres + 2 do av () done;
    pn ()
  end

let signeAddition () =
  (* Dessiner le signe d'addition à la ligne 2 *)
  begin
    deplacer (0, 2);
    styleTexte gras;
    ecrire (concat ["+"]);
    styleTexte normal
  end

let operationTerminee () =
  (* Retourne vrai ssi toutes les positions a compléter l'ont été *)
  let res = ref false in
  let resultat = ref false in
  res := true;
  for i = 1 to !nbChiffres + 1 do
    res := (!res && (rP.(i) || r.(i) = 0)) && sP.(i)
    (* Ne pas exiger que les retenues égales a zéro soient complétées *)
  done;
  resultat := !res;
  !resultat

let completerOperation () =
  (* Compléter l'opération en désignant à chauqe fois un emplacement avec la souris et *)
  (* en tapant un chiffre, les erreurs étant signalées par un 'bip' *)
  (* Retourne false si l'on a abandonné l'opération (touche Échap) *)
  let abandon = ref false in
  let x = ref 0 in
  let y = ref 0 in
  (* Coordonnees de la souris *)
  let rL = ref false in
  let c = ref ' ' in
  begin
    while not (operationTerminee ()) && not !abandon do
      ce ();
      message "Désigner une case (résultat ou retenue) : souris ou flèches, puis taper le chiffre. Échap : abandonner.";
      interactionTP x y c false false false false false;
      if !c = '\027' then abandon := true (* Échap : abandonner *)
      else if !y = 0 then
        if not sP.(!x) then begin
          carEnChiffreEtEcrire !c s.(!x) !x !y rL;
          sP.(!x) <- !rL
        end else bipBipBip ()
      else if !y = 4 then
        if not rP.(!x) then begin
          carEnChiffreEtEcrire !c r.(!x) !x !y rL;
          rP.(!x) <- !rL
        end else bipBipBip ()
      else bipBipBip ()
    done;
    ce ();
    not !abandon
  end

(* tout le dialogue est dans la fenetre du robot (barre du bas) : rien
   dans le terminal, qui n'a donc pas a etre efface *)
let effacerFenetreTexte () = ()

let () =
  sortie_terminal := false;
  (* grille de 20 pixels (12 par defaut) : la police de XQuartz est plus
     grande que celle du Macintosh et les lignes de chiffres se touchaient *)
  lg 20.;
  equ.(0) <- '\224'; (* Equivalent miniscule des chiffres sur les claviers AZERTY *)
  equ.(1) <- '&';
  equ.(2) <- '\233';
  equ.(3) <- '"';
  equ.(4) <- '\'';
  equ.(5) <- '(';
  equ.(6) <- '\167';
  equ.(7) <- '\232';
  equ.(8) <- '!';
  equ.(9) <- '\231';
  nbAdditionsEssayees := 0;
  nbAdditionsReussies := 0;
  effacerFenetreTexte ();
  while begin (* repeat ... until *)
    write ["Additions à combien de chiffres ? (réponse entre 1 et "; Printf.sprintf "%*d" 1 nbChiffresMax; ") : "];
    nbChiffres := lireEntier ();
    if !nbChiffres < 1 then
      writeln ["Erreur, pas assez de chiffres. Recommencer..."];
    if !nbChiffres > nbChiffresMax then
      writeln ["Erreur, addition avec trop de chiffres. Recommencer..."];
    not (1 <= !nbChiffres && !nbChiffres <= nbChiffresMax)
  end do () done;
  while begin (* repeat ... until *)
    initialiserAetBauHasard ();
    additionner ();
    marquerAucunChiffreTrouve ();
    marquerEmplacement 4 2 !nbChiffres; (* Retenue R*)
    ecrireNombre gras 3 b 2 (!nbChiffres + 1); (* Nombre A *)
    ecrireNombre gras 2 a 2 (!nbChiffres + 1); (* Nombre B *)
    signeAddition (); barre ();
    if s.(1) <> 0 then begin
      marquerEmplacement 0 1 (!nbChiffres + 1) (* S = A + B *)
    end else begin
      marquerEmplacement 0 2 (!nbChiffres + 1) (* S = A + B *)
    end;
    ce ();
    nbErreurs := 0;
    let termine = completerOperation () in
    nbAdditionsEssayees := !nbAdditionsEssayees + 1;
    (* Addition terminee : le resultat reste dans la barre du bas jusqu'a
       ce qu'on tape une touche (lue ici, pour qu'elle ne reponde pas a la
       question suivante) *)
    let suite = "   (taper une touche pour continuer)" in
    if not termine then
      message (concat ["Addition abandonnée."; suite])
    else if !nbErreurs = 0 then begin
      nbAdditionsReussies := !nbAdditionsReussies + 1;
      message (concat ["Bravo ! Addition réussie sans aucune erreur."; suite])
    end else if !nbErreurs = 1 then
      message (concat ["Addition terminée, avec une seule erreur."; suite])
    else
      message (concat ["Addition terminée, avec "; entierEnChaine !nbErreurs;
                       " erreurs."; suite]);
    ignore (lireCar ());
    ce (); cf blanc;
    message "Avez-vous terminé vos opérations ? (répondre 'O' ou 'N')";
    c := lireCar ();
    not ((!c = 'o' || !c = 'O') || !c = '0')
  end do () done;
  effacerFenetreTexte ();
  if !nbAdditionsReussies = !nbAdditionsEssayees then
    if !nbAdditionsEssayees = 1 then
      writeln ["Bravo, vous avez réussi votre opération sans erreurs !"]
    else
      writeln ["Félicitations, vous avez réussi toutes vos opérations sans aucune faute !"]
  else if !nbAdditionsEssayees = 1 then
    writeln ["Dommage, vous n'avez pas réussi votre opération du premier coup !"]
  else if !nbAdditionsReussies = 1 then
    writeln ["Une opération réussie du premier coup sur "; Printf.sprintf "%*d" 1 !nbAdditionsEssayees; " essais"]
  else
    writeln [Printf.sprintf "%*d" 1 !nbAdditionsReussies; " opérations réussies sans fautes sur "; Printf.sprintf "%*d" 1 !nbAdditionsEssayees; " tentatives"];
  writeln [];
  writeln ["Terminer en tapant la touche 'Retour-chariot'."];
  readln ()
