open LibRobot

(* Dessiner une frise d'octogones *)

let nombreDOctogones = 15

let () =
  ag (); pqtd ();
  for i = 1 to 8 * nombreDOctogones do
    if te () then begin
      lc (); avf 2; bc ()
    end;
    av (); phtd ()
  done;
  st ()
