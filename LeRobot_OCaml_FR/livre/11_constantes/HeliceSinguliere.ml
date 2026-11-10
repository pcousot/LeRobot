open LibRobot

(* Dessiner une hélice singulière *)

let xbase = 13  (* Largeur de la grille de base *)
let ybase = 8   (* Hauteur de la grille de base *)
let nombreDeFeuilles = 8  (* Feuilles d'une pale *)
let nombreDePales = 4     (* Pales de l'hélice *)

let pale () =
  for i = 1 to nombreDeFeuilles do
    (* Dessiner un quart d'ellipse, de dimension
       (xbase * i, ybase * i), sans changer
       l'orientation initiale du robot *)
    lgX (float_of_int (xbase * i));
    lgY (float_of_int (ybase * i));
    av (); pqtg (); av (); pqtg (); vg (); pqtg ()
  done

let () =
  for j = 1 to nombreDePales do
    pale (); pqtd ()
  done;
  st ()
