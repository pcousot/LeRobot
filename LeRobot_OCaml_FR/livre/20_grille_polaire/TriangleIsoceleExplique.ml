open LibRobot

(* Figure expliquant le programme TriangleIsocele *)

let longueurCote = 50.
let angle = 70

let pointille n =
  for i = 1 to n do
    if i mod 2 = 1 then lc ();
    av ();
    if i mod 2 = 1 then bc ()
  done

(* Marquer l'angle et dessiner le carreau de x sur y
   pixels de la grille, en pointillés *)
let angleEtRepere x y =
  (* Marquer l'angle *)
  lgRT (10., float_of_int angle);
  pdt (); avf 2; pqtg (); vg ();
  lc (); pdt (); avf 2;
  ecrire (entierEnChaine angle ^ "°"); bc ();
  ce ();
  (* Dessiner le repère *)
  lg 2.;
  pointille x; pqtg (); pointille y; pqtg ();
  pointille x; pqtg (); pointille y; pqtg ()

let () =
  (* Dessiner le triangle *)
  lgRT (longueurCote, float_of_int angle);
  phtd (); av (); pqtd (); av (); p3htd (); avf 2;
  angleEtRepere (round (valLgX () /. 2.))
    (round (valLgY () /. 2.));
  st ()
