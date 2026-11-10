open LibRobot

(* Dessiner des ellipses sur une grille rectangulaire *)

let () =
  (* Définir la taille de la grille 40 x 20. *)
  lgX 40.; lgY 20.;
  (* Dessiner huit ellipses en faisant pivoter leur
     grand axe d'un quart de tour autour du centre de
     la grille. *)
  for i = 1 to 8 do
    phtd (); vd (); vd (); vd (); vd ()
  done;
  st ()
