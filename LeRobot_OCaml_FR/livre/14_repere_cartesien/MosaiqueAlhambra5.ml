open LibRobot

(* Mosaïque de l'Alhambra *)

let tailleGrilleX = 6
let tailleGrilleY = 6
let nombreDeMotifsParLigne = 4
let nombreDeLignes = 4
let largeurMotif = 6
let hauteurMotif = 8
let espaceEntreMotifs = 2  (* > 1 *)

(* Distances entre deux motifs voisins *)
let pasX = largeurMotif + espaceEntreMotifs
let pasY = hauteurMotif + espaceEntreMotifs

let motif () =
  vg (); pqtd (); av (); pqtg (); av ();
  lgY (float_of_int (2 * tailleGrilleY)); pqtd (); vg ();
  lgY (float_of_int tailleGrilleY); pqtd (); vd ();
  pqtg (); av (); pqtd (); av (); pqtg ();
  lgY (float_of_int (2 * tailleGrilleY)); vd (); vd ();
  lgY (float_of_int tailleGrilleY); pqtg ();
  av (); pqtd (); av (); pqtg (); vd (); pqtd ();
  lgY (float_of_int (2 * tailleGrilleY)); vg ();
  pqtd (); lgY (float_of_int tailleGrilleY);
  av (); pqtg (); av (); pqtd (); vg (); pdt ()

let ligne () =
  for i = 1 to nombreDeMotifsParLigne do
    motif (); translater (pasX, 0)
  done

let pavage () =
  for j = 1 to nombreDeLignes do
    deplacer
      (- ((nombreDeMotifsParLigne + j mod 2) * pasX / 2),
       - (pasY * (j - nombreDeLignes / 2) / 2));
    ligne ()
  done

let cadre () =
  translater
    (- (pasX / 2 * (1 / nombreDeLignes))
     - largeurMotif / 2 * ((nombreDeLignes + 1) mod 2)
     + espaceEntreMotifs / 2 * (nombreDeLignes mod 2),
     - espaceEntreMotifs);
  for i = 1 to 2 do
    avf ((nombreDeLignes + 1) / 2 * pasY
         + (hauteurMotif - espaceEntreMotifs) / 2
           * ((nombreDeLignes + 1) mod 2)
         + ((nombreDeLignes + 1) mod 2 + 1)
           * espaceEntreMotifs);
    pqtg ();
    avf (- (pasX / 2 * (1 / nombreDeLignes))
         + nombreDeMotifsParLigne * pasX
         + pasX / 2 + espaceEntreMotifs);
    pqtg ()
  done

let () =
  lgX (float_of_int tailleGrilleX);
  lgY (float_of_int tailleGrilleY);
  pavage (); cadre (); p3htd (); peindre ();
  st ()
