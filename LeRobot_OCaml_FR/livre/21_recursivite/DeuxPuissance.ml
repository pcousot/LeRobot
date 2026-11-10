open LibRobot

(* Calculer 2 à la puissance 16 et dessiner le
   résultat avec le robot *)

let rec deuxPuissance n =
  if n = 0 then 1
  else 2 * deuxPuissance (n - 1)

(* Dessiner le chiffre c, le robot partant en bas à
   gauche et terminant dans la même position *)
let chiffre c =
  bc (); pn ();
  match c with
  | 0 ->
    av (); av (); pqtd (); av (); pqtd (); av (); av ();
    pqtd (); av (); pqtd ()
  | 1 ->
    lc (); pqtd (); av (); pqtg (); av (); av ();
    pdt (); bc (); av (); av (); lc (); pqtd ();
    av (); pqtd ()
  | 2 ->
    lc (); av (); av (); pqtd (); bc (); av (); pqtd ();
    av (); pqtd (); av (); pqtg ();
    av (); pqtg (); av (); pdt (); av (); pqtd ()
  | 3 ->
    lc (); av (); av (); pqtd (); bc (); av (); pqtd ();
    av (); pqtd (); av (); pdt (); av ();
    pqtd (); av (); pqtd (); av (); pqtd ()
  | 4 ->
    lc (); av (); av (); pdt (); bc (); av (); pqtg ();
    av (); pqtg (); av (); pdt (); av ();
    av (); lc (); pqtd (); av (); pqtd ()
  | 5 ->
    pqtd (); av (); pqtg (); av (); pqtg (); av ();
    pqtd (); av (); pqtd (); av (); lc ();
    pqtd (); av (); av (); pqtd (); av (); pqtd ()
  | 6 ->
    av (); pqtd (); av (); pqtd (); av (); pqtd ();
    av (); pqtd (); av (); av (); pqtd ();
    av (); lc (); pqtd (); av (); av (); pqtd (); av ();
    pqtd ()
  | 7 ->
    lc (); av (); av (); pqtd (); bc (); av (); pqtd ();
    av (); av (); pqtd (); lc (); av ();
    pqtd ()
  | 8 ->
    av (); pqtd (); av (); pdt (); av (); pqtd ();
    av (); pqtd (); av (); pqtd (); av ();
    av (); pqtd (); av (); pqtd ()
  | 9 ->
    lc (); av (); bc (); pqtd (); av (); pdt (); av ();
    pqtd (); av (); pqtd (); av ();
    pqtd (); av (); av (); pqtd (); av (); pqtd ()
  | _ -> ()

(* Laisser un espace entre deux nombres *)
let esp () =
  lc (); pe (); av (); av ()

(* Dessiner un signe - *)
let moins () =
  pn (); lc (); av (); pqtd (); bc (); av (); lc ();
  pqtd (); av (); pqtd (); av (); pqtd ()

(* Dessiner le nombre n *)
let rec nombre n =
  if 0 <= n && n <= 9 then
    chiffre n
  else if n < 0 then begin
    moins (); esp (); nombre (-n)
  end else begin
    nombre (n / 10); esp ();
    nombre (n mod 10)
  end

let () =
  ag (); nombre (deuxPuissance 16); st ()
