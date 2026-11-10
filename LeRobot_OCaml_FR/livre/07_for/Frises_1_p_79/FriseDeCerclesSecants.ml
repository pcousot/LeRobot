open LibRobot

(* Dessiner une frise de cercles sécants *)

let () =
  ag ();
  (* Tracer une frise de cercles sécants *)
  for i = 1 to 40 do
    (* Tracer un cercle, en partant du point le plus à
       l'ouest, avec le robot orienté au nord *)
    vd (); vd (); vd (); vd ();
    (* Déplacer le robot au centre du cercle, orienté
       vers le nord *)
    lc (); pqtd (); av (); pqtg (); bc ()
  done;
  st ()
