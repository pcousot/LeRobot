open LibRobot

(* Dessiner une flèche verticale *)

let plume () =
  av (); p3htg (); av (); lc (); p3htg (); av (); av ();
  p3htg (); bc (); av (); phtd ()

let empennage () =
  for i = 1 to 5 do
    plume ()
  done

let tige () =
  for i = 1 to 10 do
    av ()
  done

let pointe () =
  pqtg (); av (); p3htd (); av (); pqtd (); av ();
  p3htd (); av ()

let () =
  eb (); empennage (); tige (); pointe (); st ()
