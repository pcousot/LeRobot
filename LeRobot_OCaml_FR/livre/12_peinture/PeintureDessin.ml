open LibRobot

(* Étapes de la peinture d'un dessin : dessiner le
   pourtour du Yin Yang et peindre la zone de droite *)

let tailleQuadrillage = 24

let () =
  lg (float_of_int tailleQuadrillage);
  (* Demi cercle inférieur *)
  pqtd (); vg (); vg ();
  (* Demi cercle supérieur *)
  vd (); vd ();
  (* Cercle du pourtour *)
  lg (float_of_int (2 * tailleQuadrillage));
  vd (); vd (); vd (); vd ();
  (* Peindre *)
  pqtg (); peindre ();
  st ()
