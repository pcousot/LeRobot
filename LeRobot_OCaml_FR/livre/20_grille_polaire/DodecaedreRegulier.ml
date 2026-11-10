open LibRobot

(* Dessiner le développement d'un dodécaèdre régulier *)

let cote = 18.

let pentagone () =
  lgX cote; pqtd (); av (); lgRT (cote, 72.); phtg ();
  av ();
  lgRT (cote, 36.); pqtg (); av ();
  pqtg (); av (); lgRT (cote, 72.); pqtg (); av ()

(* (* le livre part du bord du bas (eb), mais le second
   patron descend sous le point de depart : le robot
   sortait de la fenetre et le programme s'arretait. On
   part 5 pas plus haut. *) *)
let () =
  eb (); lc (); avf 5; bc ();
  for i = 1 to 2 do
    pentagone ();
    lc (); lg cote; phtg (); av (); lgRT (cote, 72.);
    avf 2;
    pqtg (); bc (); pentagone ();
    lc (); pdt (); av (); lgRT (cote, 36.); pqtd ();
    av (); phtg (); bc ();
    pentagone ();
    lc (); pdt (); av (); phtg (); lgX cote; av ();
    pqtd (); bc ();
    pentagone ();
    lc (); pqtd (); av (); lgX cote; phtd (); av ();
    pqtd (); bc ();
    pentagone ();
    lc (); pdt (); av (); lgX cote; phtg (); av ();
    lgRT (cote, 36.); p3htd (); av ();
    lgRT (cote, 72.); pqtg ();
    av (); p3htg (); bc ()
  done;
  st ()
