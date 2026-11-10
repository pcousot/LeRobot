open LibRobot

(* Dessiner une rosace de carrés et de cercles *)

let () =
  for f = 1 to 4 do
    (* Dessiner un carré *)
    for c = 1 to 4 do pqtd (); av (); av () done;
    (* Dessiner un cercle *)
    for c = 1 to 4 do vd () done;
    (* Pivoter à gauche *)
    pqtg ()
  done;
  st ()
