open LibRobot

(* Écrire un nombre en hiéroglyphes égyptiens *)

let g = 12.   (* Taille de la grille *)

(* Trait vertical *)
let dixPuissanceZero () =
  avf 3; avf (-3)

(* Anse *)
let dixPuissanceUn () =
  avf 2; vd (); vd (); avf 2; pdt ()

(* Spirale *)
let dixPuissanceDeux () =
  let x = valLgX () in
  lc (); phtd (); avf 2; pqtg (); bc ();
  lg (x /. 2.); vg (); vg (); lg x; vg (); vg ();
  lg (x /. 2. *. 3.); vg (); vg ();
  lgX (x /. 2. *. 3.); lgY x; av ();
  phtg (); lc (); lgX (x /. 2.); av (); pqtg (); bc ();
  lg x

(* Lotus *)
let dixPuissanceTrois () =
  let x = valLgX () in
  (* Bas *)
  lg (x /. 2. *. 3.); vd (); vd (); pqtd (); avf 2;
  (* Tige *)
  lc (); avf (-1); pqtd (); av (); bc (); lg x;
  phtg (); av (); avf (-1); pqtd ();
  av (); avf (-1); phtg (); lg (x /. 2. *. 15.); av ();
  (* Fleur *)
  lgX x; lgY (x /. 2.); pqtd (); vg (); phtg ();
  av (); pqtd (); av (); phtg (); vg ();
  lgX (x /. 2. *. 3.); lgY x; vg (); vg ();
  (* Se plaçer à droite du dessin orienté au nord *)
  lc (); pqtd (); lg (x /. 2.); avf 18; pqtg (); avf 3;
  pqtg (); bc (); lg x

(* Index *)
let dixPuissanceQuatre () =
  let x = valLgX () in
  avf 9; lgY (x *. 2.); phtg (); av (); avf (-1);
  phtd (); lg x; avf (-9)

(* Têtard *)
let dixPuissanceCinq () =
  let x = valLgX () in
  (* Pattes *)
  lc (); pqtd (); avf 2; bc (); lgX (x *. 3.);
  lgY (x *. 2.); phtg ();
  vd (); lgY (x /. 2.); lgX x; pqtg (); vg ();
  phtd (); vg (); phtd ();
  lgY (x /. 3. *. 2.); vd ();
  (* Ventre *)
  lc (); p3htd (); av (); pqtd (); bc ();
  lgX (x *. 3.); lgY (x *. 2.); vd ();
  (* Tête et oeuil gauche *)
  pqtg (); lgX (x /. 4.); avf (-1); lgY (x /. 2.);
  lgX (x /. 4. *. 5.);
  vd (); phtd (); lg (x *. 2.); vd (); lc (); p3htd ();
  lg x; av (); bc (); dp ();
  (* Dos *)
  lc (); pdt (); av (); bc (); pqtd (); lgY (x /. 2.);
  lgX x; vg (); lgX (x /. 2. *. 7.);
  lgY (x *. 2.); vd ();
  (* Queue *)
  phtg (); lgX (x *. 3.); lgY (x *. 2.); vg ();
  pdt (); lgX (x *. 4.); lgY (x *. 3.);
  vd (); p3htg (); lgX (x /. 2.); lgY x; vd ();
  (* Plaçer le robot à droite du dessin orienté au nord *)
  lc (); pdt (); lgX (x *. 5.); av (); pqtg (); lg x;
  bc ()

(* Un Génie *)
let tete () =
  let x = valLgX () in
  vg (); vg (); phtd (); lgX (x /. 2.); vg (); phtg ();
  lgX (x /. 2. *. 3.);
  lgY (x *. 2.); vg ();
  (* Coiffe *)
  lc (); lg x; pqtg (); av (); bc (); phtd ();
  lg (x /. 2.);
  av (); vg (); phtg (); vg (); lc (); phtg (); av ();
  bc (); pqtg (); av (); vd ();
  phtd (); vd ();
  lc (); pqtg (); lgX (x /. 2. *. 3.); lgY (x *. 2.);
  av (); bc (); lg x

let brasDroit () =
  let x = valLgX () in
  lgY (x *. 3.); av (); lg (x /. 2.); p3htg (); vg ();
  phtg (); vg ();
  lc (); pdt (); lgX (x /. 2.); lgY (x *. 3.); av ();
  bc (); lg x

let brasGauche () =
  let x = valLgX () in
  lgY (x *. 3.); av (); lg (x /. 2.); p3htd (); vd ();
  phtd (); vd ();
  lc (); pdt (); lgX (x /. 2.); lgY (x *. 3.); av ();
  bc (); lg x

(* Génie du million *)
let dixPuissanceSix () =
  let x = valLgX () in
  (* Cuisse gauche *)
  lc (); pqtd (); lgX (x /. 2.); av (); pqtg (); bc ();
  lg (x *. 2.); vd ();
  (* Côté droit du corps *)
  phtg (); lgX (x /. 2.); vg (); phtd (); lgX x;
  lgY (x *. 4.); vg (); phtd ();
  (* Bras droit, tête, bras gauche *)
  lg x; brasDroit (); lgX (x /. 2. *. 7.);
  lgY (x *. 2.); vg (); lg x;
  brasGauche (); lc (); phtd (); av (); bc (); p3htd ();
  tete ();
  (* Côté gauche du corps *)
  p3htd (); lgY (x *. 3.); vg (); lgX (x /. 2.);
  lgY (x *. 3.); vg (); phtd ();
  lgX x; lgY (x *. 2.); vd (); lg x;
  (* Jambe gauche *)
  p3htg (); lgX (x /. 2.); av (); avf (-9);
  (* Jambe et cuisse droites *)
  lc (); lgY (x /. 2. *. 3.); lgX (x /. 2.); phtg ();
  av (); bc (); lgX (x /. 2.);
  lgY (x *. 2.); pqtg (); av (); pdt ();
  lgX (x *. 2.); lgY (x /. 2. *. 3.); av ();
  (* Placer le robot à droite du dessin orienté au nord *)
  lc (); lgX (x *. 7. /. 2.); lgY (x *. 2.); av ();
  lg x; p3htg (); bc ()

(* Taille des hiéroglyphes *)
let largeur puissanceDeDix =
  match puissanceDeDix with
  | 6 -> 6
  | 5 -> 10
  | 4 -> 0
  | 3 -> 3
  | 2 -> 3
  | 1 -> 2
  | 0 -> 0
  | _ -> 0

let hauteur puissanceDeDix =
  match puissanceDeDix with
  | 6 -> 11
  | 5 -> 4
  | 4 -> 11
  | 3 -> 11
  | 2 -> 3
  | 1 -> 3
  | 0 -> 3
  | _ -> 0

(* Disposition des hiéroglyphes *)
let lignes chiffre =
  match chiffre with
  | 0 -> 0
  | 1 | 2 | 3 -> 1
  | 4 | 5 | 6 | 7 | 8 -> 2
  | 9 -> 3
  | _ -> 0

let colonnesLigne1 chiffre =
  match chiffre with
  | 0 -> 0
  | 1 -> 1
  | 2 | 4 | 5 -> 2
  | 3 | 6 | 7 | 9 -> 3
  | 8 -> 4
  | _ -> 0

let colonnesLigne2 chiffre =
  match chiffre with
  | 0 | 1 | 2 | 3 -> 0
  | 4 -> 2
  | 5 | 6 | 9 -> 3
  | 7 | 8 -> 4
  | _ -> 0

let espaceLignes puissanceDeDix chiffre =
  match chiffre with
  | 0 -> 0
  | 4 | 5 | 6 | 7 | 8 when puissanceDeDix = 3
                         || puissanceDeDix = 4 -> 2
  | _ -> 1

let espaceColonnes puissanceDeDix chiffre =
  if chiffre < 2 || chiffre > 9 then 0
  else match puissanceDeDix with
    | 0 | 1 | 2 | 3 | 4 | 6 -> 1
    | 5 -> -2
    | _ -> 0

(* Taille de la grille dans l'écriture horizontale *)
let grilleH puissanceDeDix chiffre =
  let x = valLgX () in
  match chiffre, puissanceDeDix with
  | (4 | 5 | 6 | 7 | 8), (3 | 4) -> x /. 11. *. 5.
  | 9, (3 | 4) -> x /. 22. *. 7.
  | _, (0 | 1 | 2) -> x /. 2.
  | _, 5 -> x /. 4. *. 3.
  | _ -> x

(* Taille de la grille dans l'écriture verticale *)
let grilleV puissanceDeDix =
  match puissanceDeDix with
  | 6 | 5 | 4 | 3 -> valLgX () /. 4. *. 3.
  | _ -> valLgX () /. 2.

(* Largeur d'une colonne dans la représentation
   hybride *)
let rec largeurCoefficient valeurPrecedente puissanceDeDix
    nombre =
  let chiffre = nombre mod 10 in
  let v =
    colonnesLigne1 chiffre
    * (largeur puissanceDeDix
       + espaceColonnes puissanceDeDix chiffre) in
  let v =
    if colonnesLigne1 chiffre = colonnesLigne2 chiffre - 1
    then v + largeur puissanceDeDix else v in
  let valeurPrecedente = max v valeurPrecedente in
  if nombre < 10 then valeurPrecedente
  else largeurCoefficient valeurPrecedente
      (puissanceDeDix + 1) (nombre / 10)

(* Déplacer le robot crayon levé de N fois la taille de
   la grille, à droite si N ≥ 0, à gauche sinon *)
let espacement n =
  let x = valLgX () in
  lc ();
  if n > 0. then begin
    pqtd (); lg (x *. n); av (); pqtg ()
  end else begin
    pqtg (); lg (-. (x *. n)); av (); pqtd ()
  end;
  bc (); lg x

(* Dessiner le hiéroglyphe de la puissance de dix *)
let hieroglyphe puissanceDeDix =
  match puissanceDeDix with
  | 6 -> dixPuissanceSix ()
  | 5 -> dixPuissanceCinq ()
  | 4 -> dixPuissanceQuatre ()
  | 3 -> dixPuissanceTrois ()
  | 2 -> dixPuissanceDeux ()
  | 1 -> dixPuissanceUn ()
  | 0 -> dixPuissanceZero ()
  | _ -> ()

(* Écrire le chiffre (multiple de la puissance de dix)
   horizontalement si h est vrai, verticalement sinon *)
let ecrireChiffreEnHieroglyphes h puissanceDeDix chiffre =
  let x = valLgX () in
  (* Largeur d'un hiéroglyphe et de l'espace qui le
     suit *)
  let pas =
    largeur puissanceDeDix
    + espaceColonnes puissanceDeDix chiffre in
  let espace = espaceColonnes puissanceDeDix chiffre in
  if chiffre <> 0 then begin
    let c = ref (colonnesLigne1 chiffre) in
    if h then begin
      lg (grilleH puissanceDeDix chiffre);
      if !c = colonnesLigne2 chiffre - 1 then
        espacement (float_of_int pas /. 2.)
    end else begin
      lg (grilleV puissanceDeDix);
      espacement
        (-. (float_of_int (colonnesLigne1 chiffre * pas
                           - espace) /. 2.))
    end;
    for j = 1 to lignes chiffre do
      for i = 1 to !c do
        hieroglyphe puissanceDeDix;
        (* Colonne suivante *)
        espacement (float_of_int espace)
      done;
      (* Ligne suivante *)
      lc ();
      avf (hauteur puissanceDeDix
           + espaceLignes puissanceDeDix chiffre);
      bc ();
      espacement (float_of_int (- (!c * pas)));
      if !c = colonnesLigne2 chiffre - 1 then begin
        espacement (-. (float_of_int pas /. 2.));
        c := colonnesLigne2 chiffre
      end
    done;
    (* Se placer pour tracer le chiffre suivant *)
    if h then begin
      espacement (float_of_int (!c * pas - espace));
      lc ();
      avf (- (lignes chiffre
              * (hauteur puissanceDeDix
                 + espaceLignes puissanceDeDix chiffre)));
      bc ();
      espacement 2.;
      if 1 <= puissanceDeDix && puissanceDeDix <= 4 then
        espacement 1.
    end else
      espacement (float_of_int (!c * pas - espace) /. 2.);
    lg x
  end

let rec plusFortePuissance c =
  if c < 10 then 0
  else 1 + plusFortePuissance (c / 10)

let rec dixPuissance n =
  if n = 0 then 1
  else dixPuissance (n - 1) * 10

let rec ecrireNombreEnHieroglyphes h p c =
  if c < 10 then ecrireChiffreEnHieroglyphes h p c
  else
    if h then begin
      ecrireNombreEnHieroglyphes h (p + 1) (c / 10);
      ecrireChiffreEnHieroglyphes h p (c mod 10)
    end else begin
      ecrireChiffreEnHieroglyphes h p (c mod 10);
      ecrireNombreEnHieroglyphes h (p + 1) (c / 10)
    end

(* Lire un entier n strictement positif dans la fenêtre
   du robot, chiffre par chiffre (en terminant par un
   blanc ou par Entrée, et en corrigeant avec la touche
   d'effacement) *)
let lireNombre () =
  let incitation = "Nombre à coder : " in
  let caracteresDeFin = [' '; '\r'; Char.chr 3] in
  let effacement = Char.chr 8 in
  let n = ref 0 and m = ref "" in
  let afficher () = message (incitation ^ !m) in
  (* Lire le prochain caractère correct *)
  let rec lireC () =
    let c = lireCar () in
    if !m = "" && not ('1' <= c && c <= '9') then begin
      (* Le premier caractère est un chiffre non nul *)
      bip (); lireC ()
    end else if c = effacement then begin
      (* Effacer le dernier chiffre lu *)
      n := !n / 10;
      m := String.sub !m 0 (String.length !m - 1);
      afficher (); lireC ()
    end else if ('0' <= c && c <= '9')
              || List.mem c caracteresDeFin then c
    else begin
      bip (); lireC ()
    end in
  (* Lire les chiffres jusqu'à un caractère de fin *)
  let rec lireChiffres () =
    let c = lireC () in
    if '0' <= c && c <= '9' then begin
      let d = Char.code c - Char.code '0' in
      if !n <= (maxLongint - d) / 10 then begin
        n := 10 * !n + d;
        m := !m ^ String.make 1 c;
        afficher (); lireChiffres ()
      end else if !n = maxLongint then
        (* Fin par débordement supérieur *)
        bip ()
      else begin
        (* Débordement : lire un autre caractère *)
        bip (); lireChiffres ()
      end
    end in
  afficher ();
  lireChiffres ();
  !n

let horizontalement = true

let () =
  let nombre = lireNombre () in
  if nombre >= 1000000000 then begin
    cacherRobot (); ce ();
    ecrire "Trop grand pour les hiéroglyphes égyptiens.";
    writeln ["Trop grand pour les hiéroglyphes."]
  end else begin
    (* Initialisation *)
    cacherRobot (); lg g; ag (); lc (); avf 10; bc ();
    espacement 2.;
    (* Représentation classique *)
    if nombre < 2000000 then
      ecrireNombreEnHieroglyphes horizontalement 0 nombre;
    (* Représentation hybride et grands nombres *)
    if nombre >= 2000 then begin
      (* La ligne du reste descend sous le point de
         départ : on part 6 pas au-dessus du bord du
         bas *)
      ag (); eb (); translater (0, 6); espacement 2.;
      (* Puissance p de la colonne (génie, têtard, index
         ou lotus) à multiplier *)
      let pf = plusFortePuissance nombre in
      let p =
        if pf = 3 then pf else if pf = 4 then pf - 1
        else pf - 2 in
      let coefficient = nombre / dixPuissance p in
      let l =
        largeurCoefficient (largeur p) 0 coefficient in
      espacement (float_of_int l /. 2.);
      ecrireNombreEnHieroglyphes (not horizontalement) 0
        coefficient;
      ecrireChiffreEnHieroglyphes (not horizontalement)
        p 1;
      eb (); translater (0, 6);
      espacement (float_of_int l /. 2. +. 1.);
      (* Ligne du reste du nombre *)
      ecrireNombreEnHieroglyphes horizontalement 0
        (nombre mod dixPuissance p)
    end
  end;
  st ()
