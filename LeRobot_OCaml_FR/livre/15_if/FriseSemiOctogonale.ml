open LibRobot

(* Dessiner une frise de demi-octogones *)

let nombreDeDemiOctogones = 10

let () =
  ag ();
  for i = 1 to 4 * nombreDeDemiOctogones do
    av (); phtd ();
    if ts () then begin
      av (); pdt ()
    end
  done;
  st ()
