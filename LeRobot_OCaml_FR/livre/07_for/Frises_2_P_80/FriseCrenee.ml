open LibRobot

(* Dessiner une frise crénelée *)

(* Le robot étant orienté à l'est, dessiner un motif
   créné *)
let motifCrene () =
  av (); pqtd (); av (); av (); pqtg (); av (); pqtd ();
  vg ();
  vg (); pqtd (); av (); pqtg (); av (); av (); pqtd ();
  av ()

(* Le robot étant orienté au nord, dessiner une frise
   de 7 motifs crénés *)
let frise () =
  pqtd ();
  for i = 1 to 7 do motifCrene () done

let () =
  ag (); frise (); st ()
