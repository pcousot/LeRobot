open LibRobot

(* Dessiner le développement d'un petit
   rhombicuboctaèdre *)

let c = 20.

let triangleEquilateral () =
  lgRT (c, 60.); phtg (); av (); pqtg (); av (); p3htg ();
  avf 2; pqtg ()

let carre () =
  lg c;
  for i = 1 to 4 do
    av (); pqtd ()
  done

let carresEmpiles () =
  carre (); pqtd (); av (); pqtd (); carre (); av ();
  carre ()

let carreEtTrianglesEmpiles () =
  triangleEquilateral (); pdt (); carre (); lc ();
  phtd (); av (); phtg (); bc ();
  triangleEquilateral ()

let () =
  ag (); lc (); avf 2; bc ();
  for i = 1 to 4 do
    carresEmpiles (); carreEtTrianglesEmpiles ()
  done;
  lc (); lg c; av (); pqtg ();
  for i = 1 to 3 do
    lgRT (c, 60.); avf 2; lg c; av ()
  done;
  pqtd (); bc (); carre (); pdt (); avf 3; pqtg (); av ();
  pqtd (); carre ();
  st ()
