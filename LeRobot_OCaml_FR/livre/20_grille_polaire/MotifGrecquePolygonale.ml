open LibRobot

(* Dessiner le motif de la grecque polygonale *)

let fg = 6.    (* Facteur de grossissement *)

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

let () =
  pe (); motif (); st ()
