open LibRobot

(* Dessiner une frise de carrés *)

let carre () =
  for j = 1 to 4 do av (); pqtd () done

let frise () =
  for i = 1 to 41 do
    carre (); av ()
  done

let () =
  ag (); pqtd (); frise (); st ()
