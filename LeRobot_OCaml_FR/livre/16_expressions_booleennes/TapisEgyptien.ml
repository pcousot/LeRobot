open LibRobot

(* Dessiner un tapis égyptien *)

(* Taille de grille *)
let g = 4
(* h est impair. C'est la longueur du côté horizontal
   du tapis en nombre de "barres". *)
let h = 19
(* l est impair, l >= 3 et (h - 2 * l) / 2 >= 4.
   C'est la longueur du côté horizontal de la bande
   extrémité du tapis en nombre de "barres". *)
let l = 3
(* Côté du plus grand losange du centre, en nombre de
   motifs en C *)
let cote = (h - 2 * l) / 2 - 1
(* Hauteur du bord crénelé extérieur *)
let hauteur = cote * 6 + 5 + (7 * 2 + 2) + 2 * 3

(* Carreaux de x sur y fois g *)
let carreaux x y =
  lgX (float_of_int (x * g)); lgY (float_of_int (y * g))

(* Motif aux quatre coins *)

let octogoneCentral () =
  for i = 1 to 4 do
    carreaux 2 1; av (); phtd ();
    lg (float_of_int g); av (); phtd ()
  done;
  lc (); phtd (); avf 3; bc ();
  for i = 1 to 4 do
    pqtd (); av ()
  done;
  (* Peindre *)
  avf (-1); cc rouge; peindre (); cc noir; av ();
  pqtg ()

let triangleOuvertGauche () =
  lg (float_of_int g); avf 3; p3htg (); av ();
  lgX (float_of_int (2 * g)); av (); pqtg (); av ();
  p3htg (); avf 2;
  (* Peindre *)
  avf (-1); pqtd (); cc rouge; peindre (); cc noir;
  pqtd (); av (); phtg ();
  lg (float_of_int g); av (); phtd ()

let triangleOuvertGaucheMiroir () =
  lg (float_of_int g); avf 3; p3htd (); av ();
  lgX (float_of_int (2 * g)); av (); pqtd (); av ();
  p3htd (); avf 2;
  (* Peindre *)
  avf (-1); pqtg (); cc rouge; peindre (); cc noir;
  pqtg (); av (); phtd ();
  lg (float_of_int g); av (); phtg ()

let quartGauche () =
  triangleOuvertGauche (); av (); phtd ();
  carreaux 3 1; av (); p3htd ();
  triangleOuvertGauche ()

let quartGaucheMiroir () =
  triangleOuvertGaucheMiroir (); av (); phtg ();
  carreaux 3 1; av (); p3htg ();
  triangleOuvertGaucheMiroir ()

let motifExtremite () =
  for i = 1 to 2 do
    quartGauche ();
    lc (); pdt (); avf 4; pqtd (); avf 3; bc ();
    av (); pqtg ();
    quartGaucheMiroir (); av ();
    lc (); avf 4; pqtd (); avf 3; pqtg (); bc ()
  done;
  lc (); avf (-4); pqtg (); avf 2; p3htd (); bc ();
  octogoneCentral ()

(* Motif du centre *)

let carreau () =
  phtd (); lc (); av (); phtg (); bc ();
  for i = 1 to 4 do
    av (); pqtd ()
  done;
  lc (); p3htg (); av (); phtd (); bc ()

let extremite () =
  for i = 1 to 3 do
    av (); pqtg (); av (); pqtd (); av (); pqtd ();
    av (); pqtg (); av (); pqtd ()
  done;
  carreau ()

let motifEnC () =
  av (); pqtg (); av (); pqtd (); av (); pqtd ();
  av (); pqtg (); av (); pqtd (); avf 2; pqtd (); av ();
  pqtd (); av (); pqtg (); av (); pqtg (); avf 2;
  pqtg (); av (); pqtd (); av (); pqtg (); avf 2;
  pqtg (); av (); pqtd ()

let motifEnCInverse () =
  pqtd (); av (); pqtg (); avf 2; pqtg (); av ();
  pqtd (); av (); pqtg (); avf 2; pqtg ();
  av (); pqtg (); av (); pqtd (); av (); pqtd ();
  avf 2; pqtd (); av (); pqtg (); av (); pqtd ();
  av (); pqtd (); av (); pqtg (); av ()

(* n = côté en nombre de motifs en C *)
let losange n =
  for j = 1 to 2 do
    av ();
    for i = 1 to n do
      motifEnC ()
    done;
    extremite ();
    for i = 1 to n do
      motifEnCInverse ()
    done
  done

let centre () =
  lgX (float_of_int (g + 1));
  for i = 0 to cote / 2 do
    losange (cote - 2 * i);
    if i mod 3 = 0 then
      cc rouge
    else if i mod 3 = 2 then
      cc blanc;
    pqtd (); peindre (); cc noir; pqtg ();
    lc (); pqtd (); avf 6; pqtg (); bc ()
  done;
  if (cote / 2 + 1) mod 3 = 0 then
    cc rouge
  else if (cote / 2 + 1) mod 3 = 2 then
    cc blanc;
  lc (); pqtg (); avf 6; peindre (); cc noir; pqtd ();
  bc ();
  lgX (float_of_int g)

(* Bord du tapis *)

let cran () =
  pqtg (); av (); pqtd (); av (); pqtd (); av (); pqtg ()

let grandeBarre () =
  avf 3; cran (); avf 3

let petiteBarre () =
  avf 2; cran (); avf 2

let descente () =
  pqtd (); avf 2; pqtg ()

let montee () =
  pqtg (); avf 2; pqtd ()

let coteExterieur () =
  for i = 1 to h / 2 do
    grandeBarre (); descente (); petiteBarre (); montee ()
  done;
  grandeBarre ()

(* n = nombre de barres *)
let coteInterieur n =
  for i = 1 to n / 2 do
    petiteBarre (); montee (); grandeBarre (); descente ()
  done;
  petiteBarre ()

let rectangleExterieur () =
  for i = 1 to 2 do
    avf (hauteur + 10);
    pqtd (); avf (h / 2 * 12 + 7 + 10); pqtd ()
  done

let rectangleCranteExterieur () =
  pn ();
  avf hauteur;
  pqtd (); coteExterieur (); pqtd ();
  avf hauteur;
  pqtd (); coteExterieur (); pqtd ()

let rectangleCranteInterieurExtremite () =
  pe ();
  coteInterieur l; pqtg ();
  avf (hauteur - 2);
  pqtg (); coteInterieur l; pqtg ();
  avf (hauteur - 2);
  pqtg ()

let rectangleCranteInterieurCentral () =
  pe ();
  lc (); montee (); av (); bc ();
  avf 2; cran (); avf 3; descente ();
  coteInterieur (h - 2 * l - 2);
  montee (); avf 3; cran (); avf 2; pqtg ();
  avf (hauteur - 6);
  pqtg (); avf 2; cran (); avf 3; descente ();
  coteInterieur (h - 2 * l - 2);
  montee (); avf 3; cran (); avf 2; pqtg ();
  avf (hauteur - 6);
  pqtg ()

let bord () =
  rectangleExterieur ();
  lc (); avf 5; pqtd (); avf 5; pqtg (); bc ();
  rectangleCranteExterieur ();
  cc rouge; peindre (); cc noir;
  lc (); av (); pqtd (); av (); bc ()

(* Intérieur du tapis *)

let rectangleExtremite () =
  rectangleCranteInterieurExtremite ();
  lc (); avf ((l - 1) / 2 * 12 / 2 + 2); pqtg ();
  avf (12 + 6); bc ();
  motifExtremite (); lc ();
  avf (7 + (hauteur - 2 - 2 * 21) + 3);
  pdt (); bc (); motifExtremite (); lc ();
  avf (7 + (hauteur - 2 - 21)); pqtg ();
  avf ((l - 1) / 2 * 12 / 2 + 3);
  phtd (); peindre (); phtg (); bc ()

let rectangleCentral () =
  rectangleCranteInterieurCentral ();
  lc (); avf ((h - 2 * l) / 2 * 6 + 2); pqtg ();
  avf (cote * 6 + 5 + 7); pqtd (); bc ();
  centre ();
  lc (); avf ((h - 2 * l) / 2 * 6 + 2 + 2); pqtd ();
  avf (cote * 6 + 5 + 7 - cote / 2 * 6 + 2); bc ()

let () =
  lg (float_of_int g); ag (); eb ();
  bord ();
  rectangleExtremite ();
  rectangleCentral ();
  rectangleExtremite ();
  st ()
