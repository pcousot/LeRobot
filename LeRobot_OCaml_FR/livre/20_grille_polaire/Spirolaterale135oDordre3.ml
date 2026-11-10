open LibRobot

(* Dessiner une spirolatérale d'ordre 3 à 135 degrés *)

let () =
  lg 20.;
  for i = 1 to 8 do
    rt 135.;
    av (); rt (-135.);
    av (); av (); rt (-135.);
    av (); av (); av ()
  done;
  st ()
