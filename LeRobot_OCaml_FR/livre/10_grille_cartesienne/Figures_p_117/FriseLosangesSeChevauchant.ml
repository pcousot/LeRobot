open LibRobot

(* Dessiner une frise de losanges se chevauchant *)

let losange () =
  lgX 10.; lgY 30.;
  for j = 1 to 4 do av (); pqtd () done

let frise () =
  ag ();
  (* S'orienter au NE *)
  phtd ();
  for k = 1 to 48 do
    losange ();
    (* Avancer au milieu du losange *)
    phtd (); lc (); av (); bc ();
    (* S'orienter au NE *)
    phtg ()
  done

let () =
  frise (); st ()
