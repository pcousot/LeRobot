open LibRobot

(* Pavage à la Escher du disque *)

let nc = 8   (* Nombre de cercles concentriques *)
let nr = 18  (* Nombre de rayons sur 180 degrés
                (diviseur de 180) *)
let dc = 10  (* Distance entre deux cercles, comptée en
                pixels *)

let () =
  lg (float_of_int (dc * nc));
  (* Tracer les rayons *)
  for i = 1 to 2 * nr do
    ce (); rt (float_of_int (180 / nr)); av ()
  done;
  (* Tracer les cercles concentriques *)
  for i = 1 to nc do
    ce (); pn ();
    lg (float_of_int ((nc + 1 - i) * dc));
    av ();
    pqtg (); vg (); vg (); vg (); vg ()
  done;
  lc ();
  (* Peintre *)
  for i = 1 to nc do
    ce (); pn ();
    lg (float_of_int ((nc + 1 - i) * dc) -. 3.);
    if i mod 2 = 1 then rt (float_of_int (180 / nr));
    for j = 1 to nr do
      ce (); rt (float_of_int (180 / nr)); av (); pqtg ();
      peindre (); pqtd ();
      ce (); rt (float_of_int (180 / nr))
    done
  done;
  st ()
