open LibRobot

(* Végétal fractal *)

let l = 1.  (* Longueur des rameaux *)
let a = 45.  (* Angle des rameaux *)

(* Parcourir un arbre de taille n de haut en bas *)
let rec retour n =
  if n = 0 then tl l
  else begin
    retour (n - 1);
    retour (n - 1);
    retour (n - 1)
  end

let rec arbre n =
  if n = 0 then tl l
  else begin
    arbre (n - 1);
    arbre (n - 1);
    rt (-. a);
    arbre (n - 1); lc (); rt 180.; retour (n - 1);
    rt 180.; bc ();
    rt (2. *. a);
    arbre (n - 1); lc (); rt 180.; retour (n - 1);
    rt 180.; bc ();
    rt (-. a);
    arbre (n - 1)
  end

let () =
  eb (); arbre 5; st ()
