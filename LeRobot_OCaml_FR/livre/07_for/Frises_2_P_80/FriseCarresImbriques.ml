open LibRobot

(* Dessiner une frise de carrés imbriqués *)

let carre () =
  for j = 1 to 4 do av (); pqtd () done

let frise () =
  (* S'orienter au NE *)
  phtd ();
  for k = 1 to 41 do
    carre ();
    (* Avancer au milieu du carré *)
    lc (); phtd (); av (); bc ();
    (* S'orienter au NE *)
    phtg ()
  done

let () =
  ag (); frise (); st ()
