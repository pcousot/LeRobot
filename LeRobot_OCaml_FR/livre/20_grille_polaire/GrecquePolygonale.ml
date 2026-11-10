open LibRobot

(* Dessiner une grecque polygonale *)

let fg = 2.    (* Facteur de grossissement *)
let n = 10     (* Nombre de côtés *)

let motif () =
  (* Partie gauche *)
  tl (13. *. fg); rt 90.; tl (8. *. fg); rt 90.;
  tl (6. *. fg); rt 90.; tl (4. *. fg); rt 90.;
  tl (2. *. fg); rt 90.; tl (2. *. fg); rt (-90.);
  tl (2. *. fg); rt (-90.); tl (4. *. fg); rt (-90.);
  tl (6. *. fg); rt (-90.); tl (8. *. fg); rt (-90.);
  tl (18. *. fg); rt (-90.);
  (* Partie symétrique droite *)
  tl (8. *. fg); rt (-90.); tl (6. *. fg); rt (-90.);
  tl (4. *. fg); rt (-90.); tl (2. *. fg); rt (-90.);
  tl (2. *. fg); rt 90.; tl (2. *. fg); rt 90.;
  tl (4. *. fg); rt 90.; tl (6. *. fg); rt 90.;
  tl (8. *. fg); rt 90.;
  tl (13. *. fg)

let grecque () =
  for i = 1 to n do
    motif (); rt (360. /. float_of_int n)
  done

let () =
  grecque (); st ()
