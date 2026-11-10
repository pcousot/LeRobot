open LibRobot

(* Flocon de Von Koch *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    pqtg ();
    segment (n - 1);
    phtd ();
    segment (n - 1);
    phtd ();
    segment (n - 1);
    phtd ();
    segment (n - 1);
    phtd ();
    segment (n - 1);
    pqtg ();
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
  lc (); avf 4; pqtd (); bc ()

let () =
  rejoindreDepart ();
  lg 1.;
  carre 3;
  st ()
