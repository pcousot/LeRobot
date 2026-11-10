open LibRobot

(* Dessiner une arabesque *)

let demiMotif () =
  (* Quart de motif *)
  phtg (); avf 2; phtd (); avf 2; phtg (); av ();
  (* Demi-carré central *)
  p3htd (); lc (); avf 2; pqtd (); bc (); av (); pqtg ();
  av (); lc (); pqtg (); avf 2; pqtg ();
  bc (); av (); pqtg (); av (); pqtd (); lc (); avf 2;
  p3htd (); bc ();
  (* Quart de motif *)
  av (); phtg (); avf 2; phtd (); avf 2; phtg ()

let motif () =
  demiMotif ();
  vg (); pdt (); vg (); demiMotif ()

let ovalCentral () =
  ce (); lc (); pn (); av (); av (); bc (); pqtd ();
  vd (); avf 2; vd (); vd (); avf 2; vd ()

let quartMotifCentral () =
  vd (); av (); pqtg (); vd (); pqtg (); vd (); pqtg ();
  av (); vd ()

let () =
  ec 2;
  (* Motif extérieur *)
  for j = 1 to 4 do
    lc (); ce (); pqtg (); avf 11; pqtd (); avf 6;
    pqtd (); bc ();
    motif (); pdt (); motif ()
  done;
  (* Motif central *)
  for j = 1 to 4 do
    lc (); ce (); pqtd (); avf 5; pqtd (); bc ();
    quartMotifCentral ()
  done;
  ovalCentral ();
  ce (); pqtg (); st ()
