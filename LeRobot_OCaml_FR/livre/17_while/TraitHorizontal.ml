open LibRobot

(* Tracer un trait horizontal au milieu de l'écran *)

let () =
  ag (); pe ();
  while not (tb ()) do
    av ()
  done;
  st ()
