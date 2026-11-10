open LibRobot

(* Dessiner une frise en dents de scie *)

let nombreDeDents = 31

let () =
  ag (); phtd ();
  for i = 1 to 2 * nombreDeDents do
    av ();
    if tne () then p3htd ()
    else p3htg ()
  done;
  st ()
