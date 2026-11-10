open LibRobot

(* Esquisser un chien à compléter *)

(* Mémorisation de la direction courante du robot *)
let orientationCourante = ref 0

(* Mémoriser la direction courante du robot dans
   orientationCourante *)
let memoriserDirection () =
  orientationCourante := valOrientation ()

(* Mettre le robot dans la direction mémorisée dans
   orientationCourante *)
let reprendreDirection () =
  pivoter !orientationCourante

(* Mémorisation de la taille de la grille *)
let tailleHorizontale = ref 0.0
let tailleVerticale = ref 0.0

let memoriserTailleGrille () =
  tailleHorizontale := valLgX ();
  tailleVerticale := valLgY ()

let reprendreTailleGrille () =
  lgX !tailleHorizontale;
  lgY !tailleVerticale

(* Mémorisation de la position du crayon *)
let crayonBaisse = ref false

let memoriserPositionCrayon () =
  crayonBaisse := valBc ()

let reprendrePositionCrayon () =
  if !crayonBaisse then bc ()
  else lc ()

(* Numéro de la position courante du robot *)
let numero = ref 0

(* Marquer d'une croix la position courante du robot,
   la numéroter à l'est avec la valeur de numero qui
   est incrémenté, sans changer la position et
   l'orientation du robot *)
let numeroterE () =
  dc ();
  memoriserDirection (); memoriserTailleGrille ();
  memoriserPositionCrayon ();
  lg (float_of_int (valEc ()) +. 3.); pe (); lc (); av ();
  ecrire (string_of_int !numero);
  pdt (); av ();
  reprendreDirection (); reprendreTailleGrille ();
  reprendrePositionCrayon ();
  numero := !numero + 1

(* Marquer d'une croix la position courante du robot,
   la numéroter à l'ouest avec la valeur de numero
   qui est incrémenté, sans changer la position et
   l'orientation du robot *)
let numeroterW () =
  dc ();
  memoriserDirection (); memoriserTailleGrille ();
  memoriserPositionCrayon ();
  lg (float_of_int (valEc ()) +. 10.); pw (); lc ();
  av (); ecrire (string_of_int !numero);
  pdt (); av ();
  reprendreDirection (); reprendreTailleGrille ();
  reprendrePositionCrayon ();
  numero := !numero + 1

(* Mémorisation de la taille du crayon *)
let tailleCrayon = ref 0

let memoriserTailleCrayon () =
  tailleCrayon := valEc ()

let reprendreTailleCrayon () =
  ec !tailleCrayon

let () =
  (* Initialisation (le chien est centré verticalement
     dans la fenêtre) *)
  ce (); translater (0, -8); lg 18.; ec 2; dg ();
  policeTexte times; tailleTexte 9; numero := 0;
  numeroterE ();
  (* Profil arrière de la patte avant *)
  avf 2; numeroterE (); pqtd ();
  (* Ventre *)
  avf 3; numeroterE (); vg (); numeroterE ();
  (* Patte arrière *)
  pdt (); avf 3; numeroterE (); pqtg (); av ();
  numeroterE (); pqtg (); avf 4;
  (* Queue *)
  avf 2; numeroterE (); vd (); numeroterE (); pdt ();
  vg (); vd (); numeroterE ();
  (* Dos *)
  avf 3; numeroterE (); vd (); numeroterE ();
  (* Tête *)
  (* Oreille *)
  av (); av (); numeroterE (); pqtg (); av ();
  numeroterE (); pqtg (); av (); numeroterE ();
  (* Oeil *)
  lc (); av (); memoriserTailleCrayon (); ec 4; dp ();
  reprendreTailleCrayon (); pdt ();
  av (); bc ();
  pqtg (); av (); numeroterE (); pqtg (); av ();
  numeroterE ();
  (* Museau *)
  pqtd (); avf 2; numeroterE (); pqtg (); avf 2;
  numeroterE (); pqtg ();
  (* Gueule *)
  vg (); numeroterE (); pdt (); vd (); numeroterW ();
  pdt (); avf 2; numeroterE (); vd ();
  numeroterE ();
  (* Profil avant de la patte avant *)
  avf 3; numeroterW (); pqtg (); av (); numeroterW ();
  st ()
