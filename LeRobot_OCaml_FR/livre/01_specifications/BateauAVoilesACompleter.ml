(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Dessins à compléter, page 7.                        **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner un bateau à voiles à completer *)
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

let () =
  (* Initialisation *)
  lg 12.; ec 2; dg ();
  policeTexte times; tailleTexte 9; numero := 0;
  (* Déplacer le robot en bas sans rien dessiner *)
  lc (); pdt (); avf 10; numeroterE (); pqtg ();
  (* Dessiner l'arriere de la coque *)
  (* Dessiner la ligne de flotaison arrière *)
  (*bc;*)
  avf 9; numeroterE ();
  (* Dessiner l'arrière de la coque *)
  phtg (); avf 4; numeroterE ();
  (* Dessiner le pont arrière *)
  pqtg (); phtg (); avf 13; numeroterE ();
  (* Dessiner le mât *)
  pqtd (); avf 16; numeroterE ();
  (* Dessiner le drapeau *)
  pqtd (); avf 4; numeroterE (); pqtd (); avf 2; numeroterE (); pqtd (); avf 4;
  numeroterE (); pqtg (); av (); numeroterE ();
  (* Dessiner la grand voile *)
  phtg (); avf 12; numeroterE ();
  pqtd (); phtd (); avf 12;
  (* Dessiner le foc *)
  avf 9; numeroterE (); pqtd (); phtd ();
  avf 9; numeroterE (); pqtd (); phtd ();
  avf 10; numeroterW (); pqtd ();
  (* Dessiner l'avant du bateau*)
  (* Dessiner le pont avant *)
  avf 10; numeroterE ();
  (* Dessiner l'avant de la coque *)
  pdt (); phtd (); avf 4; numeroterE ();
  (* Dessiner la ligne de flotaison avant *)
  phtg (); avf 6; numeroterW ();
  st ()
