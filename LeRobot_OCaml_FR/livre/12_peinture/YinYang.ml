open LibRobot

(* Dessiner le symbole chinois du Yin Yang *)

let tailleQuadrillage = 3

let cercle () =
  vd (); vd (); vd (); vd ()

let () =
  (* Demi cercle inférieur *)
  lg (float_of_int (6 * tailleQuadrillage));
  pqtd (); vg (); vg ();
  (* Demi cercle supérieur *)
  lg (float_of_int (6 * tailleQuadrillage));
  vd (); vd ();
  (* Cercle du pourtour *)
  lg (float_of_int (12 * tailleQuadrillage));
  cercle ();
  (* Petit cercle blanc *)
  lg (float_of_int (2 * tailleQuadrillage));
  lc (); pqtd (); avf 2; pqtg (); bc (); cercle ();
  (* Peindre la zone noire *)
  lc (); pqtd (); avf 4; peindre ();
  (* Petit cercle noir *)
  avf 2; pqtg (); bc (); cercle (); pqtg (); peindre ();
  st ()
