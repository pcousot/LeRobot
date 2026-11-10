open LibRobot

(* Dessiner un carré en pointillé *)

(* Tracer un trait pointillé de n points,
   en supposant n > 1. *)
let traitPointille n =
  lg 8.; ec 2; lc ();
  for l = 1 to n - 1 do
    dp (); av ()
  done;
  dp (); bc ()

(* Tracer un carré pointillé avec p points par côté
   (p > 1). *)
let carre p =
  for c = 1 to 4 do
    traitPointille p; pqtd ()
  done

let () =
  carre 30; cacherRobot (); st ()
