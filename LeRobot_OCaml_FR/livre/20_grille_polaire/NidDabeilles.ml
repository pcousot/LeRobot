open LibRobot

(* Pavage du plan avec des hexagones *)

let lgLigne = 8
let nbLignes = 9

let hexagone () =
  for i = 1 to 5 do
    av (); rt (-60.)
  done;
  av (); translater (2, 0); rt (-60.)

let ligne l =
  for c = 1 to lgLigne do
    hexagone ()
  done;
  rt (-60.);
  if l mod 2 = 1 then translater (- (2 * lgLigne) + 1, -1)
  else translater (- (2 * lgLigne) - 1, -1);
  rt 60.; translater (0, -1)

let pavage () =
  for l = 1 to nbLignes do
    ligne l
  done

let () =
  eh (); ag (); translater (0, -2); pavage (); st ()
