open LibRobot

(* Effet de av () avec des crayons de plus en plus
   épais *)

let () =
  lc (); avf 5; pqtd (); lgX 6.; avf (-1); lgX 12.;
  for i = 1 to 4 do
    lc (); pqtd (); avf i; pqtg (); bc ();
    ec (12 * i); av (); lc (); avf (-1)
  done;
  dg (); st ()
