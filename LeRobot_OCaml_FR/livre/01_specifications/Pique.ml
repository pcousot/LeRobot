(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Quelques dessins géométriques simples, page 6.      **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner la couleur 'Pique' du jeu de cartes *)
let () =
  pqtd (); vg (); pqtg ();
  av (); vd (); vd (); vg (); pdt (); vg (); vd (); vd (); av ();
  pqtg (); vg (); pdt (); av (); av ();
  st ()
