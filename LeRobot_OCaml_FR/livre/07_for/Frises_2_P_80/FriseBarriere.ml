open LibRobot

(* Dessiner une frise en forme de barrière *)

(* Dessiner le motif de la barrière en forme de n *)
let n () =
  av (); av (); pqtd (); av (); av (); pqtd (); av ();
  av (); pdt ()

(* Dessiner une barrière *)
let barriere () =
  for i = 1 to 20 do n () done

let () =
  ag (); barriere (); st ()
