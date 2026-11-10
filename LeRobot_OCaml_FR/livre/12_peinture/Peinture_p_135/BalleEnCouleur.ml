open LibRobot

(* Dessiner et peindre une balle en couleur *)

let epaisseurBord = 3
let demiRayon = 30

let quartDeFigure () =
  lg (float_of_int demiRayon); vg (); vg ();
  lg (float_of_int (2 * demiRayon)); vg (); ce (); pdt ()

(* Placer le robot dans la zone à peindre et peindre *)
let peindreQuartDeFigure () =
  lg (float_of_int (demiRayon / 2));
  lc (); ce (); pqtd (); av (); bc (); peindre ()

let () =
  ec epaisseurBord;
  for i = 1 to 4 do quartDeFigure () done;
  for i = 1 to 2 do
    cc bleu; peindreQuartDeFigure ();
    cc violet; peindreQuartDeFigure ()
  done;
  st ()
