open LibRobot

(* Dessiner une croix dans un carré *)

let r = 60.  (* Rayon des arcs de la croix. *)

let carre () =
  for i = 1 to 4 do
    av (); pqtd ()
  done

let () =
  lgRT (2. *. r, 45.);
  carre ();
  lg (valLgX () -. r); av (); pqtd ();
  for i = 1 to 2 do
    lg r; vg (); p3htd ();
    lgRT (2. *. r, 45.); lg (valLgX () -. r); av ();
    p3htd ();
    lg r; vg (); p3htd ();
    lgRT (2. *. r, 45.); lg (valLgX () -. r); av ();
    lc (); phtd (); lg r; av (); pqtd ();
    lgRT (2. *. r, 45.);
    lg (valLgX () -. r); av (); pqtd (); bc ()
  done;
  st ()
