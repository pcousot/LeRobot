open LibRobot

(* Courbe de Peano *)

let rec segmentX n =
  if n > 0 then begin
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    pqtd ();
    av ();
    pqtd ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    pqtg ();
    av ();
    pqtg ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1)
  end

and segmentY n =
  if n > 0 then begin
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    pqtg ();
    av ();
    pqtg ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    pqtd ();
    av ();
    pqtd ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1)
  end

let () =
  ag (); eb (); lg 10.;
  segmentX 3;
  st ()
