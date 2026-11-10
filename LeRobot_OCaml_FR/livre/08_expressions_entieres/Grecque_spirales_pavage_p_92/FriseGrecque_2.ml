open LibRobot

(* Dessiner une frise grecque avec des boucles
   imbriquées *)

let () =
  ag ();
  for i = 1 to 8 do
    for j = 1 to 4 do av () done;
    pqtd ();
    for j = 1 to 4 do
      for k = 1 to 5 - j do av () done;
      pqtd ()
    done;
    av (); pqtg ();
    for j = 1 to 4 do
      for k = 1 to j do av () done;
      pqtg ()
    done
  done;
  st ()
