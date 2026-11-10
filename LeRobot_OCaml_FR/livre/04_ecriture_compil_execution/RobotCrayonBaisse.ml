(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Exercice 11, page 45.                               **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner le robot, crayon baissé *)
let () =
  (* Bas du pied *)
  pqtd (); av (); av (); av (); av (); av (); pqtg ();
  (* Coté droit du pied *)
  av (); pqtg (); av (); pqtd (); av (); av (); pqtd ();
  av (); av (); pqtg ();
  (* Coté droit de la pointe *)
  av (); pqtg (); av (); pqtd (); av ();
  pqtg (); av (); pqtd (); av (); pqtg (); av (); pqtd (); av (); pqtg ();
  (* Pointe *)
  av ();
  (* Coté gauche de la pointe *)
  pqtg (); av (); pqtd (); av (); pqtg (); av ();
  pqtd (); av (); pqtg (); av (); pqtd (); av (); pqtg (); av ();
  (* Coté gauche du pied *)
  pqtg (); av (); av (); pqtd (); av (); av (); pqtd ();
  av (); pqtg (); av ();
  st ()
