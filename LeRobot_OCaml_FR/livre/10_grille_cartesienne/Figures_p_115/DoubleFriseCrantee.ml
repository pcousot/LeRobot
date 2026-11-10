open LibRobot

(* Dessiner une double frise crantée *)

let cran () =
  pqtg (); av (); pqtd (); av (); pqtd (); av (); pqtg ()

let grandeBarre () =
  avf 3; cran (); avf 3

let petiteBarre () =
  avf 2; cran (); avf 2

let descente () =
  pqtd (); avf 2; pqtg ()

let montee () =
  pqtg (); avf 2; pqtd ()

let frise () =
  for j = 1 to 13 do
    grandeBarre (); descente (); petiteBarre (); montee ()
  done

let () =
  lg 3.;
  (* Frise supérieure (de gauche à droite *)
  ag (); pqtd (); frise ();
  (* Frise inférieure (de droite à gauche *)
  lc (); av (); ps (); avf 3; pqtd ();
  bc (); frise (); st ()
