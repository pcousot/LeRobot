open LibRobot

(* Couronnes losangiques peintes une sur deux *)

let nbCarres = 7  (* Nombre de carrés (supposé impair) *)

let () =
  phtd ();
  (* Dessiner un point (carré de côté nul) *)
  dp ();
  for i = 1 to nbCarres do
    (* Placer le robot au point de départ du tracé du
       carré suivant *)
    p3htg (); lc (); av (); p3htd (); bc ();
    (* Dessiner un carré de côté i, le robot partant
       et revenant au coin inférieur gauche, orienté
       au nord-ouest *)
    for j = 1 to 4 do avf i; pqtd () done
  done;
  (* Peindre une couronne sur deux *)
  ce (); phtg (); lc ();
  for i = 1 to nbCarres / 2 do
    av (); peindre (); av ()
  done;
  (* Peindre la dernière couronne de rang impair *)
  av (); peindre ();
  st ()
