open LibRobot

(* Dessiner une frise en or *)

let longueur = 31

let () =
  ag ();
  for i = 1 to longueur do
    if tn () || te () then
      vd ()
    else begin
      avf (-1); vg (); pqtg ()
    end
  done;
  st ()
