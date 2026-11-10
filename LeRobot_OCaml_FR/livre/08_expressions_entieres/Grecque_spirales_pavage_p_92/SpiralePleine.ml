open LibRobot

(* Dessiner une spirale pleine *)

let () =
  (* Dessiner le côté 'extérieur' de la spirale pleine *)
  for i = 1 to 10 do
    for j = 1 to 2 * i do av () done;
    pqtd ()
  done;
  (* Dessiner l'extrémité du grand bout *)
  av (); pqtd (); av ();
  (* Dessiner le côté 'intérieur' de la spirale pleine *)
  for i = 1 to 9 do
    for j = 1 to 20 - 2 * i do av () done;
    pqtg ()
  done;
  (* Dessiner l'extrémité du petit bout *)
  av (); pqtd (); av (); st ()
