(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Quelques dessins géométriques simples, page 6.      **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner la couleur 'Carreau' du jeu de cartes dans un carré *)
let () =
  vd (); pqtd (); pqtd (); vd (); pqtd (); pqtd (); vd (); pqtd (); pqtd (); vd ();
  pqtg (); av (); pqtg (); av (); av (); pqtg (); av (); av (); pqtg (); av (); av ();
  pqtg (); av ();
  st ()
