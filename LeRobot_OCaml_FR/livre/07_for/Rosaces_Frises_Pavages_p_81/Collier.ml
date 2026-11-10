open LibRobot

(* Dessiner un collier *)

let () =
  for i = 1 to 4 do
    for j = 1 to 6 do vd () done;
    phtg ();
    for j = 1 to 6 do vg () done;
    phtg ()
  done;
  st ()
