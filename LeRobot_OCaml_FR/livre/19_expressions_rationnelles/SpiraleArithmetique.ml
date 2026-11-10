open LibRobot

(* Dessiner une spirale arithmétique *)

(* Tracer un arc de cercle de rayon l *)
let arc l =
  lg l; vd ()

let () =
  arc 100.; arc 66.666666667;
  arc 44.444444444; arc 29.62962963;
  arc 19.75308642; arc 13.16872428;
  arc 8.7791495199; arc 5.8527663466;
  arc 3.9018442311; arc 2.6012294874;
  arc 1.7341529916; arc 1.1561019944;
  st ()
