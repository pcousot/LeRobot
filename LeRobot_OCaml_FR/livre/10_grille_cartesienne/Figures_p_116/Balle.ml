open LibRobot

(* Dessiner une balle *)

let () =
  (* Dessiner une balle *)
  for i = 1 to 4 do
    (* Dessiner un quart de la balle *)
    (* Demi-cercle intérieur *)
    lg 30.; vg (); vg ();
    (* Quart de cercle du bord *)
    lg 60.; vg ();
    (* Remettre le robot au centre pour le quart
       suivant *)
    ce ()
  done;
  st ()
