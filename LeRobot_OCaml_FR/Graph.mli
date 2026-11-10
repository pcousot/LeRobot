open Graphics

val init_pict : unit -> unit

val pict : image ref
val pict_x : int ref
val pict_y : int ref
val pict_ok : bool ref

val hBar : int                (* hauteur de la barre du bas            *)
val epBord : int              (* epaisseur du bord haut de la barre    *)
val yTexteBar : int           (* ordonnee du texte dans la barre       *)

val my_clear_bar : bool ->  unit
val draw_bar_border : unit -> unit
val my_draw_bar : unit -> unit

val testbornes : int -> int -> bool

val binfx : int ref
val binfy : int ref
val bsupx : int ref
val bsupy : int ref

val centrex : int ref
val centrey : int ref

val xshow : int ref
val yshow : int ref

val valM : string ref
val mementoCommandesClavier : string
