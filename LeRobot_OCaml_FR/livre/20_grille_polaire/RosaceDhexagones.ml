open LibRobot

(* Dessiner une rosace d'hexagones *)

let l = 30.  (* Longueur d'un segment *)

let hexagone () =
  tl l;
  for i = 1 to 6 do
    rt 60.; av ()
  done

let rosace () =
  for i = 1 to 12 do
    hexagone (); rt 30.
  done

let () =
  rosace (); st ()
