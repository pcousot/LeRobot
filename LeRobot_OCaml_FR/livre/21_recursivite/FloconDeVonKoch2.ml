open LibRobot

(* Flocon de Von Koch *)

let l = 3.

let rec segment n =
  if n = 0 then av ()
  else if tw () || te () then begin
    lg l;
    segment (n - 1);
    lgRT (l, 60.);
    phtg ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    lg l;
    phtg ();
    segment (n - 1)
  end else if tne () || tsw () then begin
    lgRT (l, 60.);
    segment (n - 1);
    pqtg ();
    segment (n - 1);
    lg l;
    p3htd ();
    segment (n - 1);
    lgRT (l, 60.);
    phtg ();
    segment (n - 1)
  end else if tnw () || tse () then begin
    lgRT (l, 60.);
    segment (n - 1);
    lg l;
    phtg ();
    segment (n - 1);
    lgRT (l, 60.);
    p3htd ();
    segment (n - 1);
    pqtg ();
    segment (n - 1)
  end else biiip ()

let triangle n =
  pqtd ();
  lg l;
  segment n;
  lgRT (l, 60.);
  p3htg ();
  segment n;
  pqtg ();
  segment n

let () =
  eb (); ag (); triangle 4; st ()
