open LibRobot

(* Mosaïque de l'Alhambra *)

let tailleLigne = 7
let nombreDeLignes = 6

(* Au départ et à l'arrivée du dessin du motif, le
   robot est au pied du motif, orienté au nord *)
let motif () =
  vd (); pqtg (); vg (); vg (); pqtg (); vd (); pdt ();
  lc (); av (); peindre (); avf (-1); bc ()

(* Déplacer le robot du pied d'un motif au suivant,
   le robot étant orienté au nord *)
let motifSuivant () =
  lc (); pqtd (); avf 2; pqtg (); bc ()

(* Ligne de pavés *)
let ligne () =
  for i = 1 to tailleLigne - 1 do
    motif (); motifSuivant ()
  done;
  motif ()

(* Revenir au début de la ligne suivante *)
let aLaLigne () =
  lc (); pqtd (); avf (- (2 * (tailleLigne - 1)));
  pqtg (); avf (-2); bc ()

let pavage () =
  for i = 1 to nombreDeLignes - 1 do
    ligne (); aLaLigne ()
  done;
  ligne ()

let () =
  lc (); ag (); eh (); pqtd (); av (); pqtd (); avf 2;
  pdt (); bc ();
  pavage (); st ()
