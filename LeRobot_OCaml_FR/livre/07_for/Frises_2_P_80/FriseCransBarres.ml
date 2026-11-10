open LibRobot

(* Dessiner une frise de crans barrés *)

let motifDroit () =
  av (); av (); pqtd (); av (); pqtg (); av (); pdt ();
  av ();
  av (); pdt (); av (); pqtd (); av (); pqtd (); av ();
  av ()

let motifGauche () =
  av (); av (); pqtg (); av (); pqtg (); av (); pdt ();
  av ();
  av (); pdt (); av (); pqtd (); av (); pqtg (); av ();
  av ()

let frise () =
  for i = 1 to 10 do motifDroit (); motifGauche () done

let () =
  ag (); frise (); st ()
