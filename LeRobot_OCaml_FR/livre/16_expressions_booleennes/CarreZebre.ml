open LibRobot

(* Dessiner un carré zébré *)

let () =
  lg 3.;
  for i = 1 to 4 do
    for j = 1 to 9 do
      avf (3 * j); pqtd (); avf (3 * j); p3htd ();
      avf (3 * j); p3htd ();
      if j mod 2 = 1 then begin
        lc (); avf (3 * j - 1); pqtd (); av ();
        peindre (); pdt (); av (); pqtg ();
        avf (3 * j - 1); pdt (); bc ()
      end;
      phtd (); avf (3 * j); p3htd (); avf (3 * j);
      pqtd (); avf (3 * j);
      if not (j mod 2 = 1) then begin
        lc (); p3htd (); avf (3 * j - 1); p3htd ();
        av (); peindre (); pdt ();
        av (); p3htg (); avf (3 * j - 1); phtd (); bc ()
      end;
      pqtd ()
    done;
    pqtd ()
  done;
  st ()
