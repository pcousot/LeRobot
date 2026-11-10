open LibRobot

(* Dessiner un alignement de piquets en dents de scie *)

let () =
  ag ();
  for i = 1 to 40 do
    for j = 1 to 2 do
      for k = 1 to (1 + ((i - 1) mod 5)) do
        av ()
      done;
      pdt ()
    done;
    pqtd (); av (); pqtg ()
  done;
  st ()
