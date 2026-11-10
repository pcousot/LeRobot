open LibRobot

(* Dessiner une rosace de rectangles *)

let longueurGR = 108.  (* Longueur grand rectangle *)
let largeurGR = 61     (* Largeur grand rectangle,
                          longueur petit rectangle *)
let largeurPR = 16.    (* Largeur petit rectangle *)
let n = 6  (* 2 * n est le nombre de branches de l'étoile
              centrale *)

let rectangles () =
  lc (); tl (float_of_int (largeurGR / 2)); rt 90.; bc ();
  tl (longueurGR /. 2.); rt 90.;
  tl (float_of_int largeurGR); rt 90.;
  tl longueurGR; rt 90.;
  tl (float_of_int largeurGR); rt 90.;
  tl (longueurGR /. 2.);
  lc (); tl (largeurPR /. 2.); rt 90.; bc ();
  tl (float_of_int largeurGR); rt 90.;
  lc (); tl largeurPR; rt 90.; bc ();
  tl (float_of_int largeurGR); pdt ()

let () =
  for i = 1 to n do
    rectangles (); ce (); rt (180. /. float_of_int n)
  done;
  st ()
