open LibRobot

(* Dessiner une spirale en losanges *)

let () =
  phtd ();
  for i = 1 to 10 do
    for j = 1 to 2 do
      for k = 1 to i do av () done;
      pqtd ()
    done
  done;
  st ()
