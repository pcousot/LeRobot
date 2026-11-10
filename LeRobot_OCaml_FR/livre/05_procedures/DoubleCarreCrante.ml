open LibRobot

(* Dessiner un double carré cranté *)

let neufPas () =
  av (); av (); av (); av (); av (); av (); av (); av ();
  av ()

(* Aller sans dessiner en bas à gauche du dessin *)
let enBasAGauche () =
  lc (); pdt (); neufPas (); pqtd ();
  neufPas (); av (); pqtd (); bc ()

let cran () =
  pqtg (); av (); pqtd (); av (); pqtd (); av (); pqtg ()

let grandeBarre () =
  av (); av (); av (); cran (); av (); av (); av ()

let petiteBarre () =
  av (); av (); cran (); av (); av ()

let descendre () =
  pqtd (); av (); av (); pqtg ()

let monter () =
  pqtg (); av (); av (); pqtd ()

let coteExterieur () =
  grandeBarre (); descendre (); petiteBarre ();
  monter (); grandeBarre ()

let coteInterieur () =
  petiteBarre (); monter (); grandeBarre ();
  descendre (); petiteBarre ()

let () =
  enBasAGauche ();
  coteExterieur (); pqtd (); coteExterieur (); pqtd ();
  coteExterieur (); pqtd (); coteExterieur (); pqtd ();
  lc (); av (); pqtd (); av (); bc ();
  coteInterieur (); pqtg (); coteInterieur (); pqtg ();
  coteInterieur (); pqtg (); coteInterieur (); pqtg ();
  st ()
