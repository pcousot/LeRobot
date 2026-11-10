open LibRobot

(* Dessiner des tuyaux d'orgue *)

let () =
  pqtd ();
  for i = 1 to 10 do
    av (); pqtg ();
    for j = 1 to i do av () done;
    pqtd (); av (); pqtd ();
    for j = 1 to i do av () done;
    pqtg ()
  done;
  st ()
