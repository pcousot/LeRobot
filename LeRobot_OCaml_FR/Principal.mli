(*-----------------------------------------------------------------------*)
(* Robot : Fonctions utilisateur principales                             *)
(* -- interface --  Principal.mli                                        *)
(*-----------------------------------------------------------------------*)
(******************************* Grille **********************************)
(* Entree des valeurs                                                    *)

val lg   : float -> unit                      (* Longueur des cotes *)
                                                   (* d'un carreau grille*)

val lgX  : float -> unit                      (* Longueur abscisse  *)
                                                   (* d'un carreau grille*)

val lgY  : float -> unit                      (* Longueur ordonnee  *)
                                                   (* d'un carreau grille*)

val lgRT : float * float -> unit              (* Definition par les *)
                                                   (* coordonnees polaires*)
                                                   (* format (r,theta)   *)
(*-----------------------------------------------------------------------*)
(* Affichage                                                             *)

val dg : unit -> unit                         (* Dessine la grille. *)

(****************************** Robot ************************************)
(* Rotations absolues                                                    *)

val pn  : unit -> unit                        (* Nord               *)

val pne : unit -> unit                        (* Nord-est           *)

val pe  : unit -> unit                        (* Est                *)

val pse : unit -> unit                        (* Sud-est            *)

val ps  : unit -> unit                        (* Sud                *)

val psw : unit -> unit                        (* Sud-ouest          *)

val pw  : unit -> unit                        (* Ouest              *)

val pnw : unit -> unit                        (* Nord-ouest         *)

val pivoter : int -> unit                     (* pivoter vers...    *)

val rt : float -> unit                        (* rotation avec      *)
                                                   (* modif du repere.   *)
(*-----------------------------------------------------------------------*)
(* Operations de deplacements relatifs : rotations                       *)

val phtd  : unit -> unit                      (* Huitieme de tour   *)
                                                   (* a droite.          *)

val pqtd  : unit -> unit                      (* Quart de tour      *)
                                                   (* a droite.          *)

val p3htd : unit -> unit                      (* 3 huitiemes de tour*)
                                                   (* a droite.          *)

val phtg  : unit -> unit                      (* Huitieme de tour   *)
                                                   (* a gauche.          *)

val pqtg  : unit -> unit                      (* Quart de tour      *)
                                                   (* a gauche.          *)

val p3htg : unit -> unit                      (* 3 huitiemes de tour*)
                                                   (* a gauche.          *)

val pdt   : unit -> unit                      (* Demi-tour.         *)
(*-----------------------------------------------------------------------*)
(* Operations de deplacements relatifs : translations...                 *)

val av  : unit -> unit                        (* Avancer.           *)

val vd  : unit -> unit                        (* Virage a droite.   *)

val vg  : unit -> unit                        (* Virage a gauche.   *)

val avf : int -> unit                         (* Avancer n fois.    *)
(*-----------------------------------------------------------------------*)
(* Deplacements absolus                                                  *)

val trait : int -> int -> unit           (* Trait du crayon carre *)
val tracer : (int*int) -> unit                (* Place, en tracant  *)
                                                   (* le cas echeant, le *)
                                                   (* robot en (a,b).    *)

val translater : (int*int) -> unit            (* translate de dX dY *)
                                                   (* sans tracer.       *)

val tl : float -> unit                        (* translate de l pts *)
                                                   (* + modifie repere.  *)
(*-----------------------------------------------------------------------*)
(* Positionnement sur une grille munie d'un repere cartesien.            *)

val deplacer : int*int -> unit
(*-----------------------------------------------------------------------*)
(* Positionnement au centre et sur les bords                             *)

val ce : unit -> unit

val eh : unit -> unit

val eb : unit -> unit

val ad : unit -> unit

val ag : unit -> unit
(*-----------------------------------------------------------------------*)
(* Operations sur le crayon                                              *)

val bc : unit -> unit                        (* Baisser le crayon.  *)

val lc : unit -> unit                        (* Lever le crayon.    *)

val dc : unit -> unit                        (* Dessiner un +.      *)

val dp : unit -> unit                        (* Dessiner un point.  *)
(*-----------------------------------------------------------------------*)
(* Longueur du dernier trace                                             *)

val valLgTl : unit -> float
(*-----------------------------------------------------------------------*)
(* Mise au point du programme                                            *)

val cf : int -> unit                         (* init + couleur fond.*)

val valCf : unit -> int                      (* couleur de fond.    *)

val montrerRobot : unit -> unit              (* robot visible.      *)

val cacherRobot  : unit -> unit              (* robot invisible.    *)

val valVisible   : unit -> bool              (* robot visible ?     *)

val autoriserSorties : unit -> unit          (* sortie possible.    *)

val interdireSorties : unit -> unit          (* sortie impossible.  *)

val valAutoriserSorties : unit -> bool       (* sortie possible ?   *)
(*-----------------------------------------------------------------------*)
(* Arret et vitesse                                                      *)
val pp : unit -> unit                        (* mode pas a pas.     *)

val ex : unit -> unit                        (* execution normale.  *)

val vt : int -> unit                         (* selection vitesse.  *)

val valVt : unit -> int                      (* consultation vitesse*)

val marquerUnePause : unit -> unit           (* pause.              *)

val st : unit -> unit                        (* arret du programme. *)
(******************************** Divers *********************************)
(* *)val draw : bool -> unit
(* *)val coord : bool ref
(* *)val sauvegarde : bool ref
(* *)val empile_fun : (unit -> unit) -> unit
(* *)val empile_str : string -> unit
(* *)val depile : unit -> unit
(* *)exception Range_error of string
(* *)val avant_action : (unit -> unit) ref   (* appele au debut de wait *)
val wait : unit -> unit
val peindre : unit -> unit                    (* peinture.           *)

val undo : unit -> unit                       (* undo.               *)

(*-----------------------------------------------------------------------*)
