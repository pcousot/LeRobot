open LibRobot

(* Figure expliquant la commande lgRT *)

let r = 90
let t = 30

let pointille n =
  for i = 1 to n do
    if i mod 2 = 1 then lc ();
    av ();
    if i mod 2 = 1 then bc ()
  done

(* Marquer la diagonale, l'angle et le carreau de x sur
   y pixels de la grille *)
let marquer x y =
  (* Marquer la diagonale avec R *)
  lc (); ce ();
  lgRT (float_of_int r /. 2., float_of_int t);
  pne (); av (); pw (); lg 12.;
  avf 4;
  ecrire ("R = " ^ entierEnChaine r);
  (* Marquer l'angle avec T *)
  lgRT (10., float_of_int t);
  ce (); pe (); avf 2; pqtg (); bc (); vg ();
  lc (); pdt (); avf 2;
  ecrire ("T = " ^ entierEnChaine t ^ "°"); bc ();
  ce ();
  (* Dessiner le repère *)
  ce (); pe (); lg 2.;
  pointille (round (x /. 2.)); pqtg ();
  pointille (round (y /. 2.));
  (* Marquer le repère *)
  lc (); lgX (float_of_int (round (x /. 2.)));
  lgY (float_of_int (round (y /. 2.)));
  ce (); pe (); avf 2; pn (); av ();
  ecrire (" Y = " ^ entierEnChaine (round y));
  ce (); pe (); av (); ps (); lg 12.; av ();
  ecrire ("X = " ^ entierEnChaine (round x));
  (* Mettre le robot dans la position initiale *)
  ce (); pn (); bc ()

let () =
  (* Dessiner la diagonale *)
  lgRT (float_of_int r, float_of_int t); dg ();
  pne (); av ();
  marquer (valLgX ()) (valLgY ());
  (* Explication *)
  message
    "lgRT (R, T) définit la même grille que lgX X; lgY Y";
  marquerUnePause ()
