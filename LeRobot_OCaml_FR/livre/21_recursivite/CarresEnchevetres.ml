open LibRobot

(* Carrés enchevêtrés *)

let rec carres l =
  if l > 2. then begin
    (* Dessiner un carré de côté l en partant du centre *)
    lg (l /. 2.); lc (); av (); pqtd ();
    bc (); av (); pqtd (); avf 2; pqtd (); avf 2; pqtd ();
    avf 2; pqtd (); av (); pqtd ();
    lc (); av (); pdt ();
    (* Imbriquer quatre carrés *)
    for i = 1 to 4 do
      lg (l /. 3.); lc (); av ();
      carres (l /. 3.);
      lg (l /. 3.); lc (); avf (-1);
      pqtd ()
    done
  end

let () =
  carres 170.; st ()
