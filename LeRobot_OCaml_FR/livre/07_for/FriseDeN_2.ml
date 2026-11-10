open LibRobot

(* Dessiner une frise de N avec une boucle "for" *)

let () =
  ag ();
  for j = 1 to 16 do
    av (); av (); pdt (); vg (); vd (); pdt ()
  done;
  st ()
