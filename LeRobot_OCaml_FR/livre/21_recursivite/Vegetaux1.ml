open LibRobot

(* Végétaux fractals d'ordres 1 à 4 *)

let a = 26.  (* Angle des rameaux *)

(* Parcourir un arbre de taille n de haut en bas,
   l étant la longueur des rameaux *)
let rec retour l n =
  if n = 0 then tl l
  else begin
    retour l (n - 1);
    retour l (n - 1);
    retour l (n - 1)
  end

(* Dessiner un arbre de taille n, l étant la longueur
   des rameaux *)
let rec arbre l n =
  if n = 0 then tl l
  else begin
    arbre l (n - 1);
    rt (-. a);
    arbre l (n - 1); lc (); rt 180.; retour l (n - 1);
    rt 180.; bc ();
    rt a;
    arbre l (n - 1);
    rt a;
    arbre l (n - 1); lc (); rt 180.; retour l (n - 1);
    rt 180.; bc ();
    rt (-. a);
    arbre l (n - 1)
  end

let rec troisPuissance n =
  if n <= 0 then 1
  else 3 * troisPuissance (n - 1)

let () =
  for i = 1 to 4 do
    cf blanc; eb ();
    arbre (float_of_int (162 / troisPuissance i)) i;
    marquerUnePause ()
  done;
  st ()
