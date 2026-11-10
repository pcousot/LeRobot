open LibRobot

(* Dessiner des polygones réguliers de 3 à 11 côtés *)

let tailleQuadrillage = 24.

(* Dessiner un polygone régulier de n >= 1 côtés *)
let polygone n =
  for i = 1 to n do
    av (); rt (360. /. float_of_int n)
  done

let () =
  for i = 1 to 3 do
    for j = 1 to 3 do
      lg tailleQuadrillage;
      eh (); translater (0, - (i * i - i / 3 + 1));
      ag (); translater (4 * j, 0);
      pe ();
      polygone (3 * (i - 1) + j + 2)
    done
  done;
  st ()
