open LibRobot

(* Dessiner des canards *)

(* Dessiner un canard sur une
   grille de taille l sans changer
   la grille originelle *)
let canard l =
  (* Mémoriser les dimensions de la grille originelle *)
  let lX = valLgX () and lY = valLgY () in
  (* Dessiner un canard avec une grille de taille l *)
  lg l;
  (* Ligne de flottaison *) avf 19;
  (* Queue *) lgX (3. *. l); lgY (7. *. l); phtg ();
  av (); pdt (); lgX (4. *. l); lgY (2. *. l); av ();
  (* Dos *) lgX (6. *. l); lgY (3. *. l); p3htd (); vg ();
  lgX (4. *. l); lgY l; vg (); pdt ();
  (* Tête *) lg l; avf 2; lg (3. *. l); vg (); vg ();
  (* Oeil *) lc (); pqtg (); av (); dc (); pdt (); av ();
  pqtg (); bc ();
  (* Bec *) lgX (2. *. l); lgY l; av (); phtd (); av ();
  pqtg (); av ();
  (* Poitrail *) lgX (2. *. l); lgY (6. *. l); av ();
  phtg ();
  (* Placer le robot à l'arrière du canard *)
  lg l; avf 18;
  (* Restituer la grille originelle *)
  lgX lX; lgY lY

let () =
  lg 6.; pe (); canard 3.; av (); canard 2.; av ();
  canard 1.; av (); canard 1.; st ()
