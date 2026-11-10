open LibRobot

(* Dessiner une paire de lunettes *)

let verre () =
  vd (); avf 5; vd (); avf 2; vd (); avf 5; vd (); avf 2;
  vd (); avf 5; vd (); pdt ()

let pont () =
  vd (); vd (); pdt ()

let branche () =
  phtd (); avf 7; phtd (); vd (); avf 3; vd (); pdt ();
  vg (); avf 3; vg (); phtg (); avf 7; p3htd ()

let () =
  lg 6.; branche (); verre (); pont (); verre ();
  branche (); st ()
