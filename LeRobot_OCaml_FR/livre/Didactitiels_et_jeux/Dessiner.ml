(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(**                                                     **)
(*********************************************************)

(* Traduction manuelle : en Turbo Pascal, interaction (X, Y, Ch, false,
   true, true, false, true) puis copier engendraient le programme
   Dessin_du_Robot.p. En OCaml, interaction (coordonnees, pivotements,
   dessin, finsouris, sauver) termine le dessin par la touche Entree
   et, si l'on repond y, l'enregistre dans le programme mon_dessin.ml
   (lance par  make mon_dessin). *)

open LibRobot

let () =
  message mementoCommandesClavier;
  interaction (false, true, true, false, true)
