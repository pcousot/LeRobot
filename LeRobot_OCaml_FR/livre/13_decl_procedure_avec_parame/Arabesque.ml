open LibRobot

(* Dessin d'une arabesque *)

let tailleGrille = 10
let epaisseurGrosTraits = 3

(* Sauter en avant de n positions sur la grille *)
let sauter n =
  lc (); avf n; bc ()

(* Tracer un cercle de rayon r centré sur le robot
   avec l'épaisseur de crayon epaisseur *)
let cercle r epaisseur =
  lg (float_of_int (r * tailleGrille)); ec epaisseur;
  lc (); av (); pqtg (); bc ();
  vg (); vg (); vg (); vg ();
  lc (); pqtg (); av (); pdt (); bc ();
  lg (float_of_int tailleGrille); ec epaisseurGrosTraits

(* Quart d'une étoile à huit branches circonscrite
   aux huit petits cercles *)
let quartDEtoile () =
  av (); phtd (); av (); pqtg (); av (); phtd (); av ()

(* Moitié d'une étoile à huit branches circonscrite
   aux huit petits cercles *)
let demiEtoile () =
  quartDEtoile (); pqtg (); quartDEtoile ()

(* Cercle inscrit dans un huitième de motif en
   direction S, W, N, E *)
let petitCerclePair () =
  phtg (); sauter 3; cercle 2 1; pdt (); sauter 3;
  p3htg ()

(* Huitième de motif en direction S, W, N, E *)
let etoilePaire () =
  phtd (); av (); petitCerclePair (); demiEtoile ();
  av (); phtg (); av (); pdt (); lc (); av ();
  avf 3; pdt (); bc (); av ();
  phtg (); av (); demiEtoile (); av (); p3htd ();
  avf 2

(* Cercle inscrit dans un huitième de motif en
   direction SW, NW, NE, SE *)
let petitCercleImpair () =
  phtg (); sauter 2; phtg (); cercle 2 1; phtd ();
  pdt (); sauter 2; p3htg ()

(* Huitième de motif en direction SW, NW, NE, SE *)
let etoileImpaire () =
  phtd (); av (); petitCercleImpair (); demiEtoile ();
  av (); p3htd (); lc (); av (); p3htd (); bc ();
  av (); demiEtoile (); av (); p3htd (); av ()

(* Motif composé de 2 étoiles (S, SW) ou (W, NW) ou
   (N, NE) ou (E, SE) *)
let motif () =
  etoilePaire ();
  avf 3; phtd (); avf 4; pqtd ();
  etoileImpaire ();
  avf 3; phtd (); avf 5; pqtd ()

let () =
  lg (float_of_int tailleGrille);
  eb (); pn (); lc (); avf 2; bc ();
  ec epaisseurGrosTraits;
  (* Petit octogone et son motif intérieur *)
  for i = 1 to 4 do
    motif ()
  done;
  (* Rejoindre le centre des cercles concentriques *)
  pqtd (); av (); pqtg (); sauter 11;
  (* Cercles concentriques *)
  cercle 3 1;
  st ()
