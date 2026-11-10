open LibRobot

(* Motif de R. S. Beard *)

let grilleInitiale = 3.   (* au moins 3 *)
let nbCouronnes = 4

let carreNoirDroit () =
  av (); pqtd (); av (); pqtd (); av (); pqtd (); av ();
  phtg (); peindre (); pdt (); av ()

let carreNoirOblique () =
  av (); pqtd (); av (); pqtd (); av (); pqtd (); av ();
  lc (); p3htd (); av (); peindre (); av (); bc ()

let couronne () =
  for i = 1 to 4 do
    carreNoirDroit ();
    lg (valLgX () /. sqrt 2.);
    carreNoirOblique ();
    lg (valLgX () *. sqrt 2.)
  done

let motif () =
  for i = 1 to nbCouronnes - 1 do
    couronne ();
    (* Placer le robot au coin inférieur gauche du carré
       supérieur gauche de la couronne suivante *)
    lc (); av (); pqtg ();
    lg (valLgX () *. tan (3. *. pi /. 8.));
    av (); pqtd (); bc ()
  done;
  couronne ()

let () =
  lg grilleInitiale; motif (); st ()
