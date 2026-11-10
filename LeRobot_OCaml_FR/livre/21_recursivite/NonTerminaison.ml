open LibRobot

(* Un programme qui ne se termine pas *)

let rec boucler () =
  boucler (); st ()

let () =
  boucler (); st ()
