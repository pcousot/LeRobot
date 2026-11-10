open LibRobot

(* Calcul de la taille de la fenêtre de déplacement du
   robot *)

let largeur = ref 0
let hauteur = ref 0

let largeurFenetreRobot () =
  lg 1.; lc (); ce (); ag (); pe (); largeur := 0;
  while not (tb ()) do
    largeur := !largeur + 1; av ()
  done

let hauteurFenetreRobot () =
  lg 1.; lc (); ce (); eb (); pn (); hauteur := 0;
  while not (tb ()) do
    hauteur := !hauteur + 1; av ()
  done

let () =
  largeurFenetreRobot (); hauteurFenetreRobot ();
  message ("(" ^ string_of_int !largeur ^ " x "
           ^ string_of_int !hauteur ^ ")");
  marquerUnePause ()
