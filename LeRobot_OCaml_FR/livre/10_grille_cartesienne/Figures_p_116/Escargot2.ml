open LibRobot

(* Dessiner un escargot *)

let () =
  (* Monter au centre de la coquille *)
  lc (); avf 4; bc (); pqtd ();
  (* Coquille *)
  for i = 1 to 11 do
    vg (); lg (float_of_int (12 + (5 * i)))
  done;
  lg 12.; avf 4;
  (* Corps *)
  pqtd (); avf 9; vg (); vg (); avf 31; pdt (); phtd ();
  avf 2; phtg (); avf 14;
  (* Rejoindre l'antenne *)
  lc (); avf 10; bc (); avf 4;
  (* Antenne *)
  phtd (); av (); lg 2.; vg (); vg (); vg (); vg ();
  lg 12.; pdt (); av ();
  (* Oeil *)
  phtd (); lc (); av (); bc ();
  lg 2.; vg (); vg (); vg (); vg ();
  st ()
