open LibRobot

(* Dessiner une frise de parallélogrammes chaînés *)

let friseParallelogrammes () =
  for i = 1 to 14 do
    (* Parallélogramme *)
    phtd (); av (); phtd (); av (); p3htd (); av ();
    phtd (); av ();
    (* Rejoindre le coin NE *)
    p3htd (); av (); phtd (); av ();
    (* Lien avec le coin SW du parallélogramme suivant *)
    phtd (); av (); p3htg ()
  done

let () =
  ag (); friseParallelogrammes (); pdt ();
  friseParallelogrammes (); st ()
