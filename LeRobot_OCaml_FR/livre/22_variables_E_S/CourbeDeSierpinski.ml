open LibRobot

(* Courbe de Sierpinski d'ordre 5 *)

let tailleGrille = 1.
let ordre = 5

let rec a k =
  if k > 0 then begin
    a (k - 1); pivoter sudEst; av ();
    b (k - 1); pivoter est; avf 2;
    d (k - 1); pivoter nordEst; av ();
    a (k - 1)
  end

and b k =
  if k > 0 then begin
    b (k - 1); pivoter sudOuest; av ();
    c (k - 1); pivoter sud; avf 2;
    a (k - 1); pivoter sudEst; av ();
    b (k - 1)
  end

and c k =
  if k > 0 then begin
    c (k - 1); pivoter nordOuest; av ();
    d (k - 1); pivoter ouest; avf 2;
    b (k - 1); pivoter sudOuest; av ();
    c (k - 1)
  end

and d k =
  if k > 0 then begin
    d (k - 1); pivoter nordEst; av ();
    a (k - 1); pivoter nord; avf 2;
    c (k - 1); pivoter nordOuest; av ();
    d (k - 1)
  end

let courbeSierpinski i =
  a i; pivoter sudEst; av ();
  b i; pivoter sudOuest; av ();
  c i; pivoter nordOuest; av ();
  d i; pivoter nordEst; av ()

let () =
  eh (); ag (); lg tailleGrille; pe (); lc (); av ();
  bc (); pn ();
  courbeSierpinski ordre; st ()
