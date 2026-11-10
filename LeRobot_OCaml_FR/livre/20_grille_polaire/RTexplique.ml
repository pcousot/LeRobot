open LibRobot

(* Figure expliquant la commande rt : le carreau de la
   grille après des rotations successives de 15 degrés *)

let longueurCote = 30.
let n = 24
let dx = 70
let dy = 40
let nbH = 5
let bordX = 40
let plusY = 10

let pointille n =
  lc ();
  for i = 1 to n do
    if i mod 2 = 1 then dp ();
    av ()
  done;
  dp (); bc ()

(* Placer le robot à la position du i-ème schéma *)
let position i =
  lg 1.; eh (); ag (); translater (bordX, 0);
  translater (dx * (i mod nbH), - (dy * (i / nbH + 1)));
  if i / nbH = 2 then translater (0, plusY);
  if i / nbH = 4 then translater (0, - plusY)

(* Dessiner le carreau (0, 0) - (1, 1) de x sur y pixels
   dans le i-ème schéma, puis y placer le robot à
   l'extrémité du segment, dans l'orientation o *)
let carreau i x y o =
  position i; lg 1.; pe ();
  pointille (round x); pqtg ();
  pointille (round y); pqtg ();
  pointille (round x); pqtg ();
  pointille (round y); pqtg ();
  lgX x; lgY y;
  match o with
  | 0 -> pn (); deplacer (0, 1)
  | 1 -> pne (); deplacer (1, 1)
  | 2 -> pe (); deplacer (1, 0)
  | 3 -> pse (); deplacer (1, -1)
  | 4 -> ps (); deplacer (0, -1)
  | 5 -> psw (); deplacer (-1, -1)
  | 6 -> pw (); deplacer (-1, 0)
  | _ -> pnw (); deplacer (-1, 1)

let repere i =
  carreau i (valLgX ()) (valLgY ()) (valOrientation ())

let () =
  message "lg 30.; pe (); av ()";
  position 0; lg longueurCote; pe (); av (); repere 0;
  for i = 1 to n do
    message ("lg 30.; pe (); rt "
             ^ entierEnChaine (i * (360 / n))
             ^ ".; av ()");
    position i; lg longueurCote; pe ();
    rt (float_of_int (i * (360 / n)));
    av (); repere i
  done;
  st ()
