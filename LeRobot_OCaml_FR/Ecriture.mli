(*-----------------------------------------------------------------------*)
(* Robot : Ecriture et lecture  dans la fenetre graphique                *)
(* -- interface --  Ecriture.mli                                         *)
(*-----------------------------------------------------------------------*)

(* ecriture dans la fenetre du robot.                                    *)

val entierEnChaine : int -> string

val reelEnChaine : float -> string

val booleenEnChaine : bool -> string

val concat : string list -> string

val ecrire : string -> unit

val policeTexte : string -> unit

val tailleTexte : int -> unit

(*
val styleTexte :
*)

val valPoliceTexte : unit -> string

val valTailleTexte : unit -> int

(*
val val StyleTexte :
*)

(*-----------------------------------------------------------------------*)
(* ecriture dans la barre de messages                                    *)

val effacerMessage : unit -> unit

val message : string -> unit

val valMessage : unit -> string
(*-----------------------------------------------------------------------*)
(* lecture d'un caractere                                                *)

(*### modif de la spec ###*)
val lireCar : unit -> char
