open LibRobot

(* Courbe de Hilbert d'ordre 6 *)

let rec segmentG n =
  if n > 0 then begin
    pqtg ();
    segmentD (n - 1);
    av ();
    pqtd ();
    segmentG (n - 1);
    av ();
    segmentG (n - 1);
    pqtd ();
    av ();
    segmentD (n - 1);
    pqtg ()
  end

and segmentD n =
  if n > 0 then begin
    pqtd ();
    segmentG (n - 1);
    av ();
    pqtg ();
    segmentD (n - 1);
    av ();
    segmentD (n - 1);
    pqtg ();
    av ();
    segmentG (n - 1);
    pqtd ()
  end

let rejoindreDepart () =
  lc (); phtd (); avf 8; p3htd (); bc ()

let () =
  rejoindreDepart ();
  lg 3.;
  segmentD 6;
  st ()
