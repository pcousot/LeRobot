open LibRobot

(* Dessiner un octogone décoré *)

let r = 24.

let octogone () =
  pqtd (); lgRT (2. *. r, 45.);
  for i = 1 to 8 do
    av (); rt 45.
  done

let rectangle_Inscrit () =
  for i = 1 to 2 do
    lg r; av (); lgRT (2. *. r, 45.); av (); lg r;
    av (); pqtd (); lgRT (2. *. r, 45.);
    av (); pqtd ()
  done

let trois_quarts_de_cercle () =
  phtg (); lg r; av (); phtd ();
  for i = 1 to 4 do
    ec 2; vd (); vd (); vd (); ec 1; pdt ();
    lgRT (2. *. r, 45.); av (); pdt ();
    lg r
  done

let () =
  octogone (); pqtg (); rectangle_Inscrit ();
  lg r; phtg (); av (); lgRT (2. *. r, 45.); phtd ();
  av ();
  pqtd ();
  rectangle_Inscrit (); trois_quarts_de_cercle ();
  st ()
