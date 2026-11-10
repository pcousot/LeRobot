open LibRobot

(* Flocon de Von Koch *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    phtg ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    phtg ();
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
  lc (); phtd (); avf 6; p3htd (); bc ()

let () =
  rejoindreDepart ();
  lg 3.;
  carre 3;
  st ()
