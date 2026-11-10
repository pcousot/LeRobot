open LibRobot

(* Dessiner une rosace de carrés *)

let l = 30.  (* Longueur d'un segment *)

let carre () =
  tl l; rt 90.; av (); rt 90.; av (); rt 90.; av ();
  rt 90.; av ()

let rosace () =
  for i = 1 to 6 do
    rt 30.; tl l; rt 30.; carre ()
  done

let () =
  rosace (); st ()
