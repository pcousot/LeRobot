open LibRobot

(* Dessiner un cristal à huit branches *)

let branche () =
  phtg (); avf 5; pqtd (); phtg (); av (); pqtd (); av ();
  phtd (); avf 5; pqtg ()

let cristal () =
  for j = 1 to 8 do branche () done

let () =
  lg 4.; cristal (); st ()
