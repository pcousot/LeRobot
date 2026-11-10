open LibRobot

(* Dessiner une loupe *)

(* Monter au point de départ, en bas à gauche du verre
   de la loupe *)
let rejoindreDepart () =
  lc (); av (); av (); av (); bc ()

let cinqPas () =
  av (); av (); av (); av (); av ()

let septPas () =
  cinqPas (); av (); av ()

(* Dessiner le bord intérieur du verre de la loupe *)
let bordInterieurDuVerre () =
  cinqPas (); vd (); cinqPas (); vd ();
  cinqPas (); vd (); cinqPas (); vd ()

(* Rejoindre le bord extérieur du support du verre *)
let rejoindreBordExterieur () =
  pqtg (); lc (); av (); pqtg (); av (); pdt (); bc ()

(* Dessiner le bord extérieur du support du verre *)
let bordExterieurDuVerre () =
  septPas (); vd (); septPas (); vd ();
  septPas (); vd (); septPas (); vd ()

(* Rejoindre le haut du manche, à gauche *)
let rejoindreHautDuManche () =
  pdt (); vg (); av (); av (); pqtd ()

(* Dessiner la première cannelure du manche *)
let premiereCannelure () =
  vg (); av (); vg ();
  lc (); pqtg (); av (); av (); av (); pqtg (); bc ()

(* Dessiner une cannelure suivante du manche *)
let cannelureSuivante () =
  av (); vg (); av (); vg (); av ();
  lc (); pqtg (); av (); av (); av (); pqtg (); av ();
  bc ()

(* Dessiner le manche cannelé de la loupe *)
let manche () =
  premiereCannelure ();
  cannelureSuivante (); cannelureSuivante ();
  cannelureSuivante (); cannelureSuivante ();
  cannelureSuivante (); cannelureSuivante ();
  cannelureSuivante (); cannelureSuivante ();
  cannelureSuivante (); cannelureSuivante ()

let () =
  rejoindreDepart ();
  bordInterieurDuVerre ();
  rejoindreBordExterieur ();
  bordExterieurDuVerre ();
  rejoindreHautDuManche ();
  manche ();
  st ()
