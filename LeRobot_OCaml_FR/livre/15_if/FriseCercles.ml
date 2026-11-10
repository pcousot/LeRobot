open LibRobot

(* Dessiner une frise de cercles *)

let nombreDeCercles = 19

let () =
  ag (); pqtd ();
  for i = 1 to 4 * nombreDeCercles do
    if te () then begin
      lc (); avf 2; bc ()
    end;
    vd ()
  done;
  st ()
