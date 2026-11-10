open LibRobot

(* Dessiner un carré avec des boucles "for" imbriquées *)

let () =
  (* Dessiner un carré *)
  for i = 1 to 4 do
    (* Dessiner un côté du carré et pivoter à droite *)
    for j = 1 to 4 do
      av ()
    done;
    pqtd ()
  done;
  st ()
