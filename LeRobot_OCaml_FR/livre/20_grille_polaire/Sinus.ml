open LibRobot

(* Tracer la courbe y = sin x, x entre -2 pi et 2 pi *)

(* Tracer un trait tout droit jusqu'au bord. *)
let axe () =
  while not (tb ()) do
    av ()
  done

(* Tracer 4 axes dans les directions N, E, S et W. *)
let axes () =
  for i = 1 to 4 do
    ce (); pqtd (); axe ()
  done

(* Graduer l'axe des X aux points coupés par la courbe
   y = sin x. *)
let graduationX x =
  if abs_float (sin x) <= 0.00001 then
    ecrire (reelEnChaine x)

(* Graduer l'axe des Y. *)
let graduationY () =
  deplacer (0, 1); dc (); ecrire " 1";
  deplacer (0, -1); dc (); ecrire " -1"

let () =
  axes (); lgX 40.; lgY 80.; graduationY ();
  deplacerReel (-. (2. *. pi), sin (-. (2. *. pi)));
  graduationX (-. (2. *. pi));
  for x = -359 to 360 do
    tracerReel (float_of_int x *. pi /. 180.,
                sin (float_of_int x *. pi /. 180.));
    graduationX (float_of_int x *. pi /. 180.)
  done;
  st ()
