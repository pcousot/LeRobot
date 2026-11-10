(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Lettre H majuscule en relief, page 9.               **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner la lettre H majuscule *)
let () =
  (* Debut branche en bas à gauche *)
  av (); av (); av (); av (); av ();
  (* Branche en haut à gauche *)
  av (); av (); av (); av (); av ();
  pqtd (); av (); av (); phtg (); av (); phtg (); pqtg (); av (); av (); phtg (); av ();
  phtg (); pqtg (); av (); av ();
  pqtd (); av (); av (); av (); av (); pqtg (); av (); av (); pqtg (); pqtg (); av ();
  av (); pqtd (); phtd (); av ();
  phtg (); av (); av (); av (); av (); pqtd (); pqtd (); av (); av (); av (); av ();
  (* Haut du pont *)
  pqtg (); av (); pqtd (); av ();
  (* Branche droite *)
  pqtg (); pqtg (); av (); av (); av (); av (); phtd (); av (); phtd (); av (); av ();
  pqtd (); phtd (); av ();
  phtd (); av (); av (); pqtd (); pqtd (); av (); av (); pqtd (); av (); av (); av ();
  av (); av (); av (); av (); av (); av (); av ();
  pqtg (); phtg (); av (); phtg (); av (); av (); av (); av (); av (); av (); av (); av ();
  av (); av (); pqtg (); phtg ();
  av (); phtg (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  pqtd (); av (); av (); pqtd (); av ();
  av (); av (); av ();
  (* Bas du pont *)
  pqtg (); av (); av (); pqtg ();
  (* Fin branche en bas à gauche *)
  av (); av (); av (); av (); pqtd (); av (); av (); pqtd (); pqtd ();
  av (); av (); phtg (); av (); phtg (); av (); av (); av (); st ()
