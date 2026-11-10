open LibRobot

(* Dessiner une hélice à quatre pales en couleur *)

let tailleGrille = 18
let epaisseurDuBord = 2

let demiCercleGauche r =
  lg (float_of_int r); vg (); vg ()

let demiCercleDroit r =
  lg (float_of_int r); vd (); vd ()

let pale c =
  (* Dessiner le pourtour de la pale *)
  ec epaisseurDuBord; cc noir;
  demiCercleGauche tailleGrille;
  demiCercleDroit tailleGrille;
  demiCercleDroit (2 * tailleGrille);
  (* Peindre l'intérieur de la pale *)
  pqtd (); lg (float_of_int tailleGrille);
  lc (); avf 3; cc c; peindre (); avf (-3); bc ()

let helice () =
  pale bleu; pale indigo; pale violet; pale rouge

let () =
  helice (); st ()
