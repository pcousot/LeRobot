open LibRobot

(* Mosaïque de l'Alhambra *)

let tailleGrille = 4
let tailleLigne = 7
let nombreDeLignes = 8  (* pair *)

let motif () =
  lg (float_of_int tailleGrille); av (); pqtd (); av ();
  lgX (float_of_int (2 * tailleGrille));
  lgY (float_of_int (3 * tailleGrille)); pqtg (); vd ();
  lc (); avf (-1); bc (); vd ();
  lg (float_of_int tailleGrille); pqtg (); av (); pqtd ();
  av (); pdt ()

let motifSuivant () =
  lc (); lg (float_of_int tailleGrille); pqtd (); avf 2;
  pqtg (); bc ()

let ligne () =
  for i = 1 to tailleLigne do
    motif (); motifSuivant ()
  done

let retourDebutDeLigneImpaire () =
  lc (); pqtg ();
  avf (4 * tailleLigne + 2 * (tailleLigne - 1)); pqtd ();
  bc ()

let retourDebutDeLignePaire () =
  lc (); pqtg ();
  avf (4 * tailleLigne + 2 * tailleLigne + 3); pqtd ();
  bc ()

let pavage () =
  for i = 1 to nombreDeLignes / 2 do
    ligne ();
    av (); pqtd (); av (); lc (); avf (-3); pqtg ();
    avf (-1); bc (); retourDebutDeLigneImpaire ();
    lc (); avf (-3); bc (); pqtd (); av (); pqtd ();
    av (); pqtg (); lc (); avf 2; pqtg (); bc ();
    ligne (); retourDebutDeLignePaire ();
    lc (); avf (-4); bc ()
  done

let cadre () =
  lc (); avf 4; bc ();
  avf (4 * nombreDeLignes); pqtd ();
  avf (4 * tailleLigne + 2 * (tailleLigne - 1) + 3);
  pqtd ();
  avf (4 * nombreDeLignes); pqtd ();
  avf (4 * tailleLigne + 2 * (tailleLigne - 1) + 3);
  pqtd ()

let coloriage () =
  lc (); avf 2; pqtd (); av ();
  for i = 1 to nombreDeLignes / 2 - 1 do
    for j = 1 to tailleLigne do peindre (); avf 6 done;
    peindre ();
    pqtg (); avf 8; pqtg (); avf (6 * tailleLigne); pdt ()
  done;
  for j = 1 to tailleLigne do peindre (); avf 6 done;
  peindre ()

let () =
  lc (); lg (float_of_int tailleGrille); ag (); eh ();
  avf (-4); bc ();
  pavage (); cadre (); coloriage ();
  st ()
