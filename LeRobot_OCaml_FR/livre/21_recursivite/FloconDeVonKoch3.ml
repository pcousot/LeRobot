open LibRobot

(* Flocon de Von Koch *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    pqtg ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    segment (n - 1);
    pqtg ();
    segment (n - 1);
    pqtg ();
    segment (n - 1);
    pqtd ();
    segment (n - 1)
  end

let carre n =
  segment n;
  pqtd ();
  segment n;
  pqtd ();
  segment n;
  pqtd ();
  segment n

let rejoindreDepart () =
  lc (); phtd (); avf 5; p3htd (); bc ()

let () =
  rejoindreDepart ();
  lg 2.;
  carre 3;
  st ()
