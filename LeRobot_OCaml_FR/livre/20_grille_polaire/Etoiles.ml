open LibRobot

(* Dessiner des étoiles de 2 à 10 branches *)

let tailleQuadrillage = 15.
let nmax = 10    (* Nombre maximum de branches, >= 2 *)
let alpha = 30.  (* 0 < alpha < ((n - 2) * 180) / n *)

(* Dessiner une étoile à n branches *)
let etoile n =
  for i = 1 to n do
    av (); pdt ();
    rt (2. *. float_of_int (n - 1) *. 180.
        /. float_of_int n -. alpha);
    av (); pdt (); rt alpha
  done

let () =
  lg tailleQuadrillage; ag ();
  for i = 2 to nmax do
    etoile i;
    lg tailleQuadrillage; translater (3, 0)
  done;
  st ()
