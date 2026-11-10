open LibRobot

(* Dessiner une spirale trapézoïdale *)

let () =
  av (); pqtd ();
  for i = 1 to 9 do
    (* Dessiner le côté supérieur *)
    av ();
    (* Dessiner un côté droit *)
    phtd ();
    for j = 1 to (2 * i) do av () done;
    (* Dessiner le côté inférieur *)
    p3htd ();
    for j = 1 to ((4 * i) + 2) do av () done;
    (* Dessiner un côté gauche *)
    p3htd ();
    for j = 1 to ((2 * i) + 1) do av () done;
    phtd ()
  done;
  st ()
