open LibRobot

(* Dessiner un carré avec des procédures *)

(* Dessiner un côté du carré et pivoter à droite *)
let cote () =
  for j = 1 to 4 do
    av ()
  done;
  pqtd ()

(* Dessiner un carré *)
let carre () =
  for i = 1 to 4 do
    cote ()
  done

let () =
  carre (); st ()
