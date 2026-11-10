(*-----------------------------------------------------------------------*)
(* Robot : definition, operations relatives, crayon et tests             *)
(* -- interface --  Robot.mli                                            *)
(*-----------------------------------------------------------------------*)

open Grille


(*-----------------------------------------------------------------------*)
(* Consultation de valeurs                                               *)

val valEc : unit -> int                             (* epaisseur crayon. *)
val valX  : unit -> float                           (* abscisse robot.   *)
val valY  : unit -> float                           (* ordonnee robot.   *)

(*-----------------------------------------------------------------------*)
(* Rotations absolues                                                    *)

(* *)val r_pn  : unit -> unit                            (* Nord *)
(* *)val r_pne : unit -> unit                            (* Nord-est *)
(* *)val r_pe  : unit -> unit                            (* Est *)
(* *)val r_pse : unit -> unit                            (* Sud-est *)
(* *)val r_ps  : unit -> unit                            (* Sud *)
(* *)val r_psw : unit -> unit                            (* Sud-ouest *)
(* *)val r_pw  : unit -> unit                            (* Ouest *)
(* *)val r_pnw : unit -> unit                            (* Nord-ouest *)
(* *)val r_pivoter : int -> unit

(*-----------------------------------------------------------------------*)
(* Operations de deplacements relatifs : rotations                       *)

(* *)val r_phtd  : (* grille -> *) unit -> unit       (* Huitieme de tour   *)
                                                 (* a droite.          *)
(* *)val r_pqtd  : (* grille -> *) unit -> unit       (* Quart de tour      *)
                                                 (* a droite.          *)
(* *)val r_p3htd : (* grille -> *) unit -> unit       (* 3 huitiemes de tour*)
                                                 (* a droite.          *)
(* *)val r_phtg  : (* grille -> *) unit -> unit       (* Huitieme de tour   *)
                                                 (* a gauche.          *)
(* *)val r_pqtg  : unit -> unit                       (* Quart de tour      *)
                                                 (* a gauche.          *)
(* *)val r_p3htg : unit -> unit                       (* 3 huitiemes de tour*)
                                                 (* a gauche.          *)
(* *)val r_pdt   : unit -> unit                       (* Demi-tour.         *)

(* Operations de deplacements relatifs : translations...                 *)
(* *)val r_translater : (float * float) -> unit
(* *)val r_av_effect  : unit -> unit                    (* Avancer.           *)
(* *)val vd_cardinaux  : unit -> int*int*int*int*int*int (*Virage a droite*)
(* *)val vd_non_cardinaux : int -> int*int*int*int*int*int (* ''''''''''' *)
(* *)val vg_cardinaux  : unit -> int*int*int*int*int*int (*Virage a gauche*)
(* *)val vg_non_cardinaux : int -> int*int*int*int*int*int (* ''''''''''' *)

(* deplacements absolus,                                                 *)
(* positionnement au centre et sur les bords du cadre...                 *)
(* *)val r_ce : float -> float -> unit
(* *)val r_th : float -> unit
(* *)val r_tv : float -> unit

(*-----------------------------------------------------------------------*)
(* Operations sur le crayon                                              *)

val valBc : unit -> bool                           (* teste le crayon.   *)

val r_bc : unit -> unit                            (* Baisser le crayon. *)
val r_lc : unit -> unit                            (* Lever le crayon.   *)

val ec : int -> unit                               (* epaisseur crayon.  *)
(*-----------------------------------------------------------------------*)
(* Consultation de l'orientation                                         *)

val valOrientation : unit -> int                  (* Valeur de l'orient.*)
                                                  (* 0=N, 1=NE, 2=E...  *)

(*-----------------------------------------------------------------------*)
(* Tests sur l'orientation du robot                                      *)

val tn  : unit -> bool                            (* Nord ?             *)

val tne : unit -> bool                            (* Nord-est ?         *)

val te  : unit -> bool                            (* Est ?              *)

val tse : unit -> bool                            (* Sud-est ?          *)

val ts  : unit -> bool                            (* Sud ?              *)

val tsw : unit -> bool                            (* Sud-ouest ?        *)

val tw  : unit -> bool                            (* Ouest ?            *)

val tnw : unit -> bool                            (* Nord-ouest ?       *)
(*-----------------------------------------------------------------------*)
(* test de bord de cadre                                                 *)

val pixel : float -> int                    (* position -> pixel (arrondi) *)
val arrondi : float -> int                  (* arrondi des tests de bord *)
val tb : unit -> bool                             (* true si av() sort.  *)

val tbvd : unit -> bool                           (* true si vd() sort.  *)
val tbvg : unit -> bool                           (* true si vg() sort.  *)
(****************************************)
(* *)type robot
(* *)val probot : robot ref

val lgTl : float ref
(****************************************)
