open LibRobot

(* Dessiner une rosace d'octogone et de carrés *)

let () =
  for i = 1 to 8 do
    av (); av (); phtg ();
    for j = 1 to 4 do av (); pqtd () done;
    p3htg (); av (); p3htg ()
  done;
  st ()
