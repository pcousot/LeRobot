open LibRobot

(* Motif de S. Horemis, 'Optical and geometrical
   patterns and designs', Dover, New York, 1970. *)

let n = 6
let deuxPuissanceN = 64.   (* 2 à la puissance n *)

let () =
  eb (); ag (); lg deuxPuissanceN;
  for i = 1 to n do
    for j = 1 to 4 do
      avf 4; pqtd ()
    done;
    avf 2; phtd ();
    for j = 1 to 4 do
      avf 2; avf (-1); pqtd (); peindre (); pqtg ();
      av (); pqtd ()
    done;
    av (); phtd ();
    lg (valLgX () /. 2.)
  done;
  st ()
