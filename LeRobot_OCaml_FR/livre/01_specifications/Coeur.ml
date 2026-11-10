(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Quelques dessins géométriques simples, page 6.      **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner la couleur 'Coeur' *)
let () =
  vd (); vd (); vd (); vg (); pdt (); vg (); vd (); vd (); vd (); st ()
