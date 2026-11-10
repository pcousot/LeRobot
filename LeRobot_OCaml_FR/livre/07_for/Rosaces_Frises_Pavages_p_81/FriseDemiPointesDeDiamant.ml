open LibRobot

(* Dessiner une frise de demi-pointes de diamant *)

let motifGauche () =
  av (); av (); av (); p3htd (); av (); phtd (); av ();
  av (); pqtd (); av (); pdt (); av (); pqtg ()

let motifDroit () =
  av (); av (); phtd (); av (); p3htd (); av (); av ();
  av (); pqtd (); av (); pdt (); av (); pqtg ()

let traitHorizontal () =
  for i = 1 to 2 do
    for j = 1 to 40 do av () done;
    pdt ()
  done

let () =
  ag ();
  for j = 1 to 20 do
    motifGauche (); motifDroit ()
  done;
  lc (); pdt (); av (); pqtd (); bc ();
  traitHorizontal ();
  lc (); pqtd (); av (); av (); av (); av (); pqtg ();
  bc (); traitHorizontal ();
  lc (); pqtd (); av (); pqtg (); bc ();
  traitHorizontal (); st ()
