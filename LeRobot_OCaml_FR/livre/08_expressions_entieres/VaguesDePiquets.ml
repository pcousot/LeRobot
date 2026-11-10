open LibRobot

(* Dessiner un alignement de piquets en vagues *)

let () =
  ag ();
  for i = 1 to 8 do
    for j = 1 to 5 do
      for k = 1 to 2 do
        for l = 1 to
          (((6 - j) * ((i + 1) mod 2)) + (j * (i mod 2)))
        do
          av ()
        done;
        pdt ()
      done;
      pqtd (); av (); pqtg ()
    done
  done;
  st ()
