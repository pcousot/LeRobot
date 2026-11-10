(*-----------------------------------------------------------------------*)
(* Robot : Description de la grille                                      *)
(* -- interface --  Grille.mli                                           *)
(*-----------------------------------------------------------------------*)

type grille

(*-----------------------------------------------------------------------*)
(* Consultation des valeurs                                              *)

val valLgX : unit -> float                         (* Largeur du cote.   *)

val valLgY : unit -> float                         (* hauteur du cote.   *)

val valLgR : unit -> float                         (* long. de diagonale.*)

val valLgT : unit -> float                         (* angle de diagonale.*)


(*-----------------------------------------------------------------------*)
(* Entree des valeurs                                                    *)

val g_lg   : float -> unit                         (* Longueur des cotes *)
                                                   (* d'un carreau grille*)

val g_lgX  : float -> unit                         (* Longueur abscisse  *)
                                                   (* d'un carreau grille*)

val g_lgY  : float -> unit                         (* Longueur ordonnee  *)
                                                   (* d'un carreau grille*)

val g_lgRT : float * float -> unit                 (* Definition par les *)
                                                   (* coordonnees polaires*)
                                                   (* format (r,theta)   *)


(*-----------------------------------------------------------------------*)
(* Grille initiale                                                       *)

val pgrille : grille ref
