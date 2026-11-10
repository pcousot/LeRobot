open LibRobot

(* Dessiner le développement d'un grand
   rhombicuboctaèdre *)

let c = 12.

let carre () =
  lg c;
  for i = 1 to 4 do
    av (); pqtd ()
  done

let hexagone () =
  pqtd ();
  for i = 1 to 2 do
    lg c; av (); lgRT (c, 60.); phtg (); av (); pqtg ();
    av ();
    phtg ()
  done;
  pqtg ()

let octogone () =
  pqtd ();
  for i = 1 to 4 do
    lg c; av (); lgRT (c, 45.); phtg (); av (); phtg ()
  done;
  pqtg ()

(* Dessiner un carré avec un hexagone au dessus et au
   dessous *)
let carreEtHexagonesEmpiles () =
  hexagone (); pqtd (); lg c; av (); pqtd (); carre ();
  av (); hexagone ()

(* Dessiner un octogone avec un carré au dessus et au
   dessous *)
let octogoneEtCarresEmpiles () =
  carre (); pqtd (); av (); pqtd (); octogone (); lc ();
  av (); lg c; av ();
  lgRT (c, 45.);
  av (); bc (); carre ()

let () =
  ag (); lc (); avf 2; pqtd (); avf 2; pqtg (); bc ();
  for i = 1 to 4 do
    octogoneEtCarresEmpiles (); lc (); p3htg ();
    lgRT (c, 45.); av (); phtg ();
    lg c;
    av (); bc (); carreEtHexagonesEmpiles (); lc ();
    pdt (); lg c; av ();
    lgRT (c, 45.);
    phtd (); av (); phtg (); bc ()
  done;
  lc (); lg c; av (); pqtg ();
  for i = 1 to 6 do
    lgRT (c, 45.); av (); lg c; av ()
  done;
  pqtd (); bc (); octogone (); lc (); pdt (); avf 2; lg c;
  avf 3; pqtg ();
  av (); pqtd ();
  bc (); octogone ();
  st ()
