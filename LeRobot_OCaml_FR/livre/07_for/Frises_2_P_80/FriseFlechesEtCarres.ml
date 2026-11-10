open LibRobot

(* Dessiner une frise de flèches et de carrés *)

let carre () =
  for j = 1 to 4 do av (); pqtd () done

let frise () =
  phtd ();
  for k = 1 to 7 do
    (* Dessiner la flèche gauche *)
    av (); pdt (); av (); pqtg (); av (); pdt (); av ();
    p3htd (); av (); av ();
    phtg (); carre (); phtd ();
    (* Traverser le losange d'ouest en est *)
    lc (); av (); av (); bc ();
    (* Dessiner la flèche droite *)
    av (); av (); p3htg (); av (); pdt (); av (); pqtd ();
    av (); pdt (); av ()
  done

let () =
  ag (); frise (); st ()
