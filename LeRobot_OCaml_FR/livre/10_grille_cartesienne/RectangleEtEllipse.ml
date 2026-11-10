open LibRobot

(* Dessiner un rectangle et une ellipse juxtaposés. *)

let () =
  (* Taille de la grille *)
  lgX 40.; lgY 20.; ag ();
  (* Grille *)
  dg ();
  (* Rectangle *)
  av (); pqtd (); av (); pqtd (); av (); pqtd (); av ();
  pqtd ();
  (* Décalage à droite. *)
  lc (); pqtd (); av (); av (); pqtg (); bc ();
  (* Ellipse *)
  vd (); vd (); vd (); vd ();
  st ()
