open LibRobot

(* Dessiner un canardeau sortant de son oeuf *)

let g = 6   (* Taille de la grille *)

let tete () =
  (* Haut gauche du crâne *)
  lgX (float_of_int (3 * g)); lgY (float_of_int (6 * g));
  vd ();
  (* Duvets *)
  pqtg (); lgX (float_of_int (2 * g));
  lgY (float_of_int (4 * g)); vg (); pdt (); lc ();
  av (); pqtd (); av (); bc (); pdt (); vd ();
  lc (); pdt (); av (); pqtg (); av (); bc ();
  lgX (float_of_int g);
  lgY (float_of_int (6 * g)); pdt (); vd ();
  (* Haut droit du crâne *)
  lc (); pdt (); av (); pqtg (); av (); bc (); pqtg ();
  lgX (float_of_int (3 * g));
  lgY (float_of_int (6 * g)); vd (); lg (float_of_int g);
  (* Contour des yeux *)
  lc (); phtd (); av (); p3htd (); bc ();
  lgY (float_of_int (3 * g)); vg (); vg ();
  lg (float_of_int g); av (); pdt (); av ();
  lgY (float_of_int (3 * g)); vg (); vg (); p3htg ();
  (* Oeil droit *)
  lgY (float_of_int g); lc (); av (); bc (); ec 2; dp ();
  (* Oeil gauche *)
  lc (); phtd (); avf 2; bc (); dp (); ec 1;
  (* Se placer pour dessiner les joues *)
  lc (); phtd (); av (); pqtg (); bc ()

let joues () =
  lg (float_of_int (5 * g)); vd ();
  lg (float_of_int (3 * g)); vd ();
  lg (float_of_int (5 * g)); vd ();
  lgX (float_of_int (4 * g)); lgY (float_of_int g);
  vg (); lg (float_of_int (5 * g)); vd ();
  lg (float_of_int (3 * g)); vd ();
  lg (float_of_int (5 * g)); vd ();
  lgX (float_of_int (2 * g));
  lgY (float_of_int g); phtd (); vg (); vg ();
  lg (float_of_int g);
  (* Se placer pour dessiner la bouche *)
  lc (); p3htd (); av (); bc ()

let bouche () =
  (* Commissure droite des lèvres *)
  vd (); vg (); pdt (); vd (); pqtg ();
  (* Lèvres *)
  lg (float_of_int (2 * g)); vg (); lgY (float_of_int g);
  vd (); lg (float_of_int (2 * g)); vg ();
  (* Commissure gauche des lèvres *)
  pqtd (); lg (float_of_int g); vd (); pdt (); vg ();
  vd ();
  (* Se placer pour dessiner le cou *)
  lc (); p3htg (); avf 2; pqtd (); bc ()

let cou () =
  (* Côté gauche *)
  lgY (float_of_int (8 * g)); av (); pdt (); av ();
  (* Côté droit *)
  lc (); pqtd (); lgX (float_of_int (2 * g)); av ();
  bc (); pqtd (); av (); lg (float_of_int g)

let coquillePleine () =
  (* Bord supérieur droit *)
  phtg (); av (); pqtg (); lgY (float_of_int (2 * g));
  for i = 1 to 3 do av (); pqtd (); av (); pqtg () done;
  p3htd ();
  (* Fond *)
  lgX (float_of_int (8 * g)); lgY (float_of_int (14 * g));
  vd (); vd ();
  (* Bord supérieur gauche *)
  phtd (); lgX (float_of_int g);
  lgY (float_of_int (2 * g));
  for i = 1 to 3 do av (); pqtd (); av (); pqtg () done;
  (* Milieu *)
  lg (float_of_int (2 * g)); av (); pqtd (); av ();
  lg (float_of_int g);
  (* Se placer pour dessiner la coquille vide *)
  lc (); phtg (); avf 10; pqtd (); avf 3; phtg (); bc ()

let coquilleVide () =
  (* Bord supérieur gauche *)
  lgX (float_of_int g); lgY (float_of_int (2 * g));
  for i = 1 to 3 do av (); pqtg (); av (); pqtd () done;
  (* Milieu *)
  lg (float_of_int (2 * g)); av (); pqtg (); av ();
  (* Bord supérieur droit *)
  pqtd (); lgX (float_of_int g);
  lgY (float_of_int (2 * g));
  for i = 1 to 3 do av (); pqtg (); av (); pqtd () done;
  phtd ();
  (* Fond *)
  lgX (float_of_int (8 * g)); lgY (float_of_int (11 * g));
  vd (); vd (); lg (float_of_int g)

let () =
  lg (float_of_int g); lc (); avf 10; bc ();
  tete (); joues (); bouche (); cou (); coquillePleine ();
  coquilleVide (); st ()
