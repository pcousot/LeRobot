open LibRobot

(* Dessiner une pyramide de 5 étages. *)

let () =
  (* Orienter le robot à l'ouest. *)
  pqtg ();
  for i = 1 to 5 do
    (* Partant du coin inférieur gauche d'un étage avec le
       robot orienté à l'ouest, dessiner le coin inférieur
       gauche de l'étage inférieur et pivoter à l'est. *)
    av (); pqtg (); av (); pqtg ();
    (* Dessiner le i-ème étage rectangulaire. *)
    (* Côté inférieur *)
    for j = 1 to ((2 * i) - 1) do
      av ()
    done;
    (* Extrémité droite *)
    pqtg (); av (); pqtg ();
    (* Côté supérieur *)
    for j = 1 to ((2 * i) - 1) do
      av ()
    done;
    (* Redescendre au coin inférieur gauche et orienter
       le robot à l'ouest. *)
    pqtg (); av (); pqtd ()
  done;
  st ()
