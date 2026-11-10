open LibRobot

(* Motif de carrés inscrits de Horemis *)

(* Dessiner un carré de côté m, incliné à 45 degrés,
   autour du carré précédent *)
let carre m =
  phtd (); avf (m / 2);
  for j = 1 to 4 do
    pqtd (); avf m
  done

(* Dessiner un carré de côté m et peindre les quatre
   triangles compris entre ce carré et le précédent *)
let carrePeint m =
  carre m; lc ();
  for j = 1 to 4 do
    phtg (); peindre (); p3htd (); avf m
  done;
  bc ()

let () =
  lg 5.;
  carre 1; carrePeint 2; carre 2; carrePeint 4;
  carre 4; carrePeint 8; carre 8; carrePeint 16;
  carre 16; carrePeint 32;
  st ()
