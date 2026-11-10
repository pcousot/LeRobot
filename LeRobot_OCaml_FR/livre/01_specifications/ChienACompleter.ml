(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Dessins à compléter, page 7.                        **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessin d'un chien à compléter *)
(* Mémorisation de la direction courante du robot *)
let orientationCourante = ref 0

let memoriserDirection () =
  (* Mémoriser la direction courante du robot dans 'OrientationCourante' *)
  orientationCourante := valOrientation ()

let reprendreDirection () =
  (* Mettre le robot dans la direction mémorisée dans 'OrientationCourante' *)
  pivoter !orientationCourante

(* Mémorisation de la taille de la grille *)
let tailleHorizontale = ref 0.0
let tailleVerticale = ref 0.0

let memoriserTailleGrille () =
  begin
    tailleHorizontale := valLgX ();
    tailleVerticale := valLgY ()
  end

let reprendreTailleGrille () =
  begin
    lgX !tailleHorizontale;
    lgY !tailleVerticale
  end

(* Mémorisation de la position du crayon *)
let crayonBaisse = ref false

let memoriserPositionCrayon () =
  crayonBaisse := valBc ()

let reprendrePositionCrayon () =
  if !crayonBaisse then bc ()
  else lc ()

(* Mémoriser le numéro de la position courante du robot *)
let numero = ref 0

let numeroterE () =
  (* Marquer d'une croix la position courante du robot, la numéroter *)
  (* à  l'est  avec  la  valeur de 'Numero' qui est incrementé, sans *)
  (* changer la position et l'orientation du robot. *)
  begin
    dc ();
    memoriserDirection (); memoriserTailleGrille (); memoriserPositionCrayon ();
    lg (float_of_int (valEc ()) +. 3.); pe (); lc (); av (); ecrire (entierEnChaine !numero);
    pdt (); av ();
    reprendreDirection (); reprendreTailleGrille (); reprendrePositionCrayon ();
    numero := !numero + 1
  end

let numeroterW () =
  (* Marquer d'une croix la position courante du robot, la numéroter *)
  (* à  l'ouest  avec la valeur de 'Numero' qui est incrementé, sans *)
  (* changer la position et l'orientation du robot. *)
  begin
    dc ();
    memoriserDirection (); memoriserTailleGrille (); memoriserPositionCrayon ();
    lg (float_of_int (valEc ()) +. 10.); pw (); lc (); av (); ecrire (entierEnChaine !numero);
    pdt (); av ();
    reprendreDirection (); reprendreTailleGrille (); reprendrePositionCrayon ();
    numero := !numero + 1
  end

(* Mémorisation de la taille du crayon *)
let tailleCrayon = ref 0

let memoriserTailleCrayon () =
  tailleCrayon := valEc ()

let reprendreTailleCrayon () =
  ec !tailleCrayon

let () =
  (* Initialisation *)
  (* Adaptation : en Pascal, eb ; la fenetre d'OCaml etant plus haute,
     le chien partirait du bord inferieur ; on le centre verticalement. *)
  lc (); lg 30.; ec 2; dg (); ce (); translater (0, -5);
  policeTexte times; tailleTexte 9; numero := 0; numeroterE ();
  (* Profil arrière de la patte avant *)
  avf 2; numeroterE (); pqtd ();
  (* Ventre *)
  avf 3; numeroterE (); vg (); numeroterE ();
  (* Patte arrière *)
  pdt (); avf 3; numeroterE (); pqtg (); av (); numeroterE (); pqtg (); avf 4;
  (* Queue *)
  avf 2; numeroterE (); vd (); numeroterE (); pdt (); vg (); vd (); numeroterE ();
  (* Dos *)
  avf 3; numeroterE (); vd (); numeroterE ();
  (* Tête *)
  (* Oreille *)
  av (); av (); numeroterE (); pqtg (); av (); numeroterE (); pqtg (); av (); numeroterE ();
  (* Oeil *)
  (*lc;*)
  av (); memoriserTailleCrayon (); ec 4; dp (); reprendreTailleCrayon (); pdt (); av (); (*bc;*)
  pqtg (); av (); numeroterE (); pqtg (); av (); numeroterE ();
  (* Museau *)
  pqtd (); avf 2; numeroterE (); pqtg (); avf 2; numeroterE (); pqtg ();
  (* Gueule *)
  vg (); numeroterE (); pdt (); vd (); numeroterW (); pdt (); avf 2; numeroterE (); vd ();
  numeroterE ();
  (* Profil avant de la patte avant *)
  avf 3; numeroterW (); pqtg (); av (); numeroterW ();
  st ()
