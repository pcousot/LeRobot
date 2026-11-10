open LibRobot

(* Pavage de croix biseautées inscrites dans un
   carré (6 x 6) *)

let tailleGrilleX = 6.
let tailleGrilleY = 6.

(* Dessiner un motif dans un carré (6 x 6), le robot
   partant et arrivant au centre du motif, orienté
   vers le nord. *)
let motif6x6 () =
  for i = 1 to 4 do
    phtd (); av (); phtd (); av (); av (); p3htd ();
    av (); pqtg (); av (); p3htd (); av (); av ();
    phtd (); av (); phtg ()
  done

(* Paver avec y lignes de x motifs (6 x 6) *)
let pavage x y =
  (* Décentrer le dessin à gauche de la moitié de la
     longueur d'une ligne et vers le haut de la
     moitié de la hauteur du pavage. *)
  translater (- (6 * (x / 2)), 6 * (y / 2));
  (* Dessiner (y - 1) lignes de x motifs (avec
     translation en bas à gauche de la ligne
     suivante). *)
  for i = 1 to y - 1 do
    (* Dessiner une ligne de x motifs (sans
       translation à droite après le dernier motif
       de la ligne). *)
    for j = 1 to x - 1 do
      motif6x6 ();
      (* Passer au motif suivant à droite dans la
         même ligne. *)
      translater (6, 0)
    done;
    motif6x6 ();
    (* Passer au début de la ligne suivante. *)
    translater (- (6 * (x - 1)), -6)
  done;
  (* Dessiner la dernière ligne de x motifs (sans
     translation en bas à gauche de la ligne
     suivante). *)
  for j = 1 to x - 1 do
    motif6x6 ();
    translater (6, 0)
  done;
  motif6x6 ()

let () =
  lgX tailleGrilleX; lgY tailleGrilleY;
  pavage 4 4;
  st ()
