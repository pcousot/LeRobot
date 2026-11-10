open LibRobot

(* Dessiner une serpentine pyramidale *)

let tailleGrille = 6
let hauteur = 28

let () =
  lg (float_of_int tailleGrille); eh (); pqtd ();
  for i = 1 to hauteur do
    avf i;
    if i mod 2 = 1 then begin
      pqtd (); av (); pqtd ()
    end else begin
      pqtg (); av (); pqtg ()
    end
  done;
  st ()
