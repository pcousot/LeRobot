(*-----------------------------------------------------------------------*)
(* Robot : Description des dessins                                       *)
(* -- interface --  Dessin.mli                                           *)
(*-----------------------------------------------------------------------*)

open Graphics

val blanc : color

val gris : color

val rouge  : color

val bleu : color

val vert : color

val violet : color

val noir : color

val indigo : color

val jaune  : color

val echelleRobot : int   (* facteur d'agrandissement du robot *)

val robN   : image
val robNt  : image
val robS   : image
val robSt  : image
val robE   : image
val robEt  : image
val robO   : image
val robOt  : image
val robNE  : image
val robNEt : image
val robNO  : image
val robNOt : image
val robSE  : image
val robSEt : image
val robSO  : image
val robSOt : image

val cdef   : unit -> unit

val current_color : unit -> color
val show_color : unit -> unit
val show_ret : bool -> unit
val cc : int -> unit

val valCc : unit -> int


