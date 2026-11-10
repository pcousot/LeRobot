(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Quadrilatères, page 9.                              **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner un triangle, un trapèze, un parallélogramme, un rectangle et un carré *)
let () =
  ag (); pqtg ();
  (* Figure suivante *)
  lc (); pdt (); av (); av (); av (); av (); av (); bc ();
  (* Trapèze *)
  phtg (); av (); av (); phtd (); av (); av (); phtd (); av (); av (); p3htd (); av ();
  av (); av (); av (); av (); av ();
  (* Figure suivante *)
  lc (); pdt (); av (); av (); av (); av (); av (); av (); av (); bc ();
  (* Parallélogramme *)
  phtg (); av (); av (); phtd (); av (); av (); av (); p3htd (); av (); av (); phtd ();
  av (); av (); av ();
  (* Figure suivante *)
  lc (); pdt (); av (); av (); av (); av (); av (); av (); bc ();
  (* Rectangle *)
  av (); av (); av (); pqtg (); av (); av (); pqtg (); av (); av (); av (); pqtg (); av ();
  av (); pqtd ();
  (* Figure suivante *)
  lc (); pdt (); av (); av (); av (); av (); bc ();
  (* Rectangle *)
  av (); av (); pqtg (); av (); av (); pqtg (); av (); av (); pqtg (); av (); av ();
  pqtd ();
  st ()
