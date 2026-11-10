open LibRobot

(* Dessiner une chenille *)

let tailleGrille = 6
let nombreDAnneaux = 7

(* Décentrer à gauche de la moitié de la longueur
   de la chenille *)
let aGauche n =
  lg (float_of_int (2 * tailleGrille));
  lc (); pqtg (); avf n; pqtd (); bc ()

(* Dessiner le dos de la chenille comportant n
   anneaux de rayon égal à (2 * tailleGrille) *)
let dos n =
  lg (float_of_int (2 * tailleGrille));
  for i = 1 to n do
    vd (); vd (); pdt ()
  done;
  pdt (); vd ()

(* Dessiner une patte de la chenille de longueur
   tailleGrille *)
let patte () =
  lg (float_of_int tailleGrille);
  pqtg (); av (); pdt (); av (); pqtg ()

(* Dessiner p pattes de la chenille espacées de
   (2 * tailleGrille) *)
let pattes p =
  patte ();
  for i = 1 to p - 1 do
    lg (float_of_int (2 * tailleGrille)); av ();
    patte ()
  done

(* Dessiner la tête de la chenille *)
let tete () =
  lg (float_of_int tailleGrille); vd (); vd ();
  (* Oeil *)
  lc (); lg (float_of_int (2 * tailleGrille)); av ();
  pqtg (); bc (); dc (); cc jaune; peindre ()

(* Dessiner une chenille de n anneaux et (2 * n)
   pattes *)
let chenille n =
  aGauche n; dos n; pattes (2 * n); tete ()

let () =
  chenille nombreDAnneaux; st ()
