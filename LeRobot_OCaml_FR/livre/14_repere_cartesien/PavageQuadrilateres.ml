open LibRobot

(* Pavage de quadrilatères produits par un motif
   inscrit dans un carré (6 x 6) *)

let tailleGrilleX = 6.
let tailleGrilleY = 6.
let motifX = 6  (* Largeur du motif *)
let motifY = 6  (* Hauteur du motif *)

(* Dessiner un motif dans un carré (motifX x motifY),
   le robot partant et arrivant au centre du motif,
   orienté vers le nord. *)
let motif () =
  for i = 1 to 4 do
    lc (); pqtg (); av (); bc ();
    p3htd (); av (); av (); pqtg (); av (); pdt (); av ();
    phtg (); av (); av (); pdt (); av (); pqtd (); av ();
    pqtd (); av ();
    lc (); p3htd (); av (); av (); av (); bc ();
    phtd ()
  done

(* Paver avec y lignes de x motifs *)
let pavage x y =
  (* Décentrer le dessin à gauche de la moitié de la
     longueur d'une ligne et vers le haut de la
     moitié de la hauteur du pavage. *)
  translater (- (motifX * (x / 2)), motifY * (y / 2));
  (* Dessiner (y - 1) lignes de x motifs (avec
     translation en bas à gauche de la ligne
     suivante). *)
  for i = 1 to y - 1 do
    (* Dessiner une ligne de x motifs (sans
       translation à droite après le dernier motif
       de la ligne). *)
    for j = 1 to x - 1 do
      motif ();
      (* Passer au motif suivant à droite dans la
         même ligne. *)
      translater (motifX, 0)
    done;
    motif ();
    (* Passer au début de la ligne suivante. *)
    translater (- (motifX * (x - 1)), - motifY)
  done;
  (* Dessiner la dernière ligne de x motifs (sans
     translation en bas à gauche de la ligne
     suivante). *)
  for j = 1 to x - 1 do
    motif ();
    translater (motifX, 0)
  done;
  motif ()

let () =
  lgX tailleGrilleX; lgY tailleGrilleY;
  pavage 10 6;
  st ()
