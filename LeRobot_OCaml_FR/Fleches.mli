(* Les touches fleches pour le robot (Graphics ne les voit pas).
   Les fleches sont rendues comme les caracteres du Macintosh :
   '\028' gauche, '\029' droite, '\030' haut, '\031' bas.             *)

val gauche : char
val droite : char
val haut : char
val bas : char

(* comme Graphics.wait_next_event [Mouse_motion; Key_pressed; Button_down],
   mais une fleche est aussi rendue comme une touche *)
val attendre : unit -> Graphics.status

(* deplacement (dx, dy) d'un carreau pour une fleche, (0, 0) sinon *)
val deplacement : char -> int * int
