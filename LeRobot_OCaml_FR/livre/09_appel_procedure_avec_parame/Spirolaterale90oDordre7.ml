open LibRobot

(* Dessiner une courbe spirolatérale de Frank C. Odds à
   90 degrés d'ordre 7. *)

let () =
  for i = 1 to 4 do
    for j = 1 to 7 do avf j; pqtd () done
  done;
  st ()
