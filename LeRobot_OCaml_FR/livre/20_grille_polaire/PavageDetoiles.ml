open LibRobot

(* Pavage du plan avec des étoiles et des hexagones *)

let tailleQuadrillage = 9.
let lgLigne = 6
let nbLignes = 6
let n = 8        (* Nombre de branches de l'étoile,
                    supposé multiple de 4 *)
let alpha = 30.  (* 0 < alpha < ((n - 2) * 180) / n *)

let quartDetoile () =
  for i = 1 to n / 4 do
    av (); pdt ();
    rt (2. *. float_of_int (n - 1) *. 180.
        /. float_of_int n -. alpha);
    av (); pdt (); rt alpha
  done

let etoile () =
  for i = 1 to 4 do
    quartDetoile ()
  done

let etoileSuivanteEst () =
  lc ();
  for i = 1 to 2 do
    quartDetoile ()
  done;
  pdt (); bc ()

let etoileSuivanteSud () =
  lc ();
  for j = 1 to 2 do
    pdt (); quartDetoile ()
  done;
  bc ()

let ligne () =
  lg 1.; ag (); lg tailleQuadrillage; pe ();
  rt (alpha /. 2.);
  for c = 1 to lgLigne do
    etoile (); etoileSuivanteEst ()
  done;
  etoileSuivanteSud ()

let enHaut () =
  lc (); lg 1.; eh (); lg tailleQuadrillage; ps ();
  rt (alpha /. 2.);
  quartDetoile (); bc ()

let pavage () =
  enHaut ();
  for l = 1 to nbLignes do
    ligne ()
  done

let () =
  pavage (); st ()
