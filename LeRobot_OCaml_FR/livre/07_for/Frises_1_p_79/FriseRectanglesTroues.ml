open LibRobot

(* Dessiner une frise de rectangles troués *)

let () =
  (* Rejoindre le bord ouest *)
  ag (); lc (); pqtd (); av (); pdt (); bc ();
  for u = 1 to 6 do
    (* Dessiner un rectangle troué au nord *)
    av (); pqtg (); av (); av (); pqtg (); av (); av ();
    av (); pqtg (); av (); av ();
    pqtg (); av ();
    (* Traverser au sud-est *)
    lc (); p3htg (); av (); av (); p3htd (); bc ();
    (* Dessiner un rectangle troué au sud *)
    av (); pqtd (); av (); av (); pqtd (); av (); av ();
    av (); pqtd (); av (); av ();
    pqtd (); av ();
    (* Traverser au nord-est *)
    lc (); p3htd (); av (); av (); p3htg (); bc ()
  done;
  (* Dessiner un rectangle troué au nord *)
  av (); pqtg (); av (); av (); pqtg (); av (); av ();
  av (); pqtg (); av (); av ();
  pqtg (); av ();
  (* Traverser au sud-est *)
  lc (); p3htg (); av (); av (); p3htd (); bc ();
  (* Dessiner un rectangle troué au sud *)
  av (); pqtd (); av (); av (); pqtd (); av (); av ();
  av (); pqtd (); av (); av ();
  pqtd (); av (); st ()
