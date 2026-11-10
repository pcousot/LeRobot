open LibRobot

(* Dessiner le développement d'un tétraèdre tronqué *)

let lgCote = 24.

let faceEtCoin () =
  (* Hexagone *)
  pqtd (); lgRT (lgCote, 60.); phtg ();
  for i = 1 to 6 do
    av (); rt 60.
  done;
  (* Triangle équilatéral *)
  pdt (); av (); pqtd (); av ()

let developpementDuTetraedreTronque () =
  for i = 1 to 2 do
    (* Face et coin en bas *)
    faceEtCoin (); lc (); p3htd (); avf 2; phtg (); av ();
    p3htd (); bc ();
    (* Face et coin en haut *)
    faceEtCoin (); lc (); av (); phtg (); avf 2; pqtg ();
    bc ()
  done

let () =
  developpementDuTetraedreTronque (); st ()
