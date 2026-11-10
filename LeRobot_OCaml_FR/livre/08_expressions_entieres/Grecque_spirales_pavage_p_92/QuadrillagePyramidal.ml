open LibRobot

(* Dessiner un quadrillage pyramidal *)

let () =
  (* Dessiner 16 lignes de carrés juxtaposés
     horizontalement *)
  eh (); pqtd ();
  for i = 1 to 16 do
    (* Dessiner une ligne de ((2 * i) - 1) carrés
       juxtaposés horizontalement, en partant en haut à
       gauche et en arrivant en haut à droite, le robot
       étant dans les deux cas orienté vers l'est. *)
    for j = 1 to 2 * i - 1 do
      (* Dessiner un carré, en partant du coin
         supérieur gauche et en arrivant au coin
         supérieur droit, le robot étant dans les deux
         cas orienté vers l'est. *)
      for k = 1 to 4 do av (); pqtd () done;
      av ()
    done;
    (* Revenir, sans dessiner, au début de la ligne
       suivante, le robot étant orienté vers l'est au
       départ et à l'arrivée. *)
    lc (); pdt ();
    for j = 1 to 2 * i do av () done;
    pqtg (); av (); pqtg (); bc ()
  done;
  st ()
