open LibRobot

(* Dessiner un escargot *)

let () =
  (* Monter au centre de la coquille *)
  lc (); avf 4; bc (); pqtd ();
  (* Coquille *)
  vg (); lg 17.; vg (); lg 22.; vg (); lg 27.; vg ();
  lg 32.; vg ();
  lg 37.; vg (); lg 42.; vg (); lg 47.; vg (); lg 52.;
  vg (); lg 57.; vg (); lg 62.;
  vg (); lg 12.; avf 4;
  (* Corps *)
  pqtd (); avf 9; vg (); vg (); avf 31; pdt (); phtd ();
  avf 2; phtg (); avf 14;
  (* Rejoindre l'antenne *)
  lc (); avf 10; bc (); avf 4;
  (* Antenne *)
  phtd (); av (); lg 2.; vg (); vg (); vg (); vg ();
  lg 12.; pdt (); av ();
  (* Oeil *)
  phtd (); lc (); av (); bc (); lg 2.; vg (); vg ();
  vg (); vg (); st ()
