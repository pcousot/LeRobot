open LibRobot

(* Dessiner une frise de vaguelettes *)

let longueur = 15

let () =
  ag ();
  for i = 1 to 2 * longueur do
    if tn () then begin
      vd (); pqtd ()
    end
    else if ts () then begin
      vg (); pqtg ()
    end
    else if te () then pqtd ()
    else pqtg ();
    av ()
  done;
  st ()
