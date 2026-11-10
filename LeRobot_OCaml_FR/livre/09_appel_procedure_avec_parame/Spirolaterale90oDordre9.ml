open LibRobot

(* Dessiner une courbe spirolatérale de Frank C. Odds
   à 90 degrés d'ordre 9. *)

let () =
  lc (); avf (-4); bc ();
  for i = 1 to 4 do
    for j = 1 to 9 do
      avf j; pqtd ()
    done
  done;
  st ()
