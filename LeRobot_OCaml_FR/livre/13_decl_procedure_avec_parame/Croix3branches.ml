open LibRobot

(* Croix à trois branches transversales *)

(* Dessiner une branche de longueur i *)
let branche i =
  av (); pqtd (); avf i; pqtg (); av (); pqtg (); avf i;
  pqtd ()

let moitieDeCroixDroite () =
  for i = 1 to 3 do
    branche (4 - i)
  done

let moitieDeCroixGauche () =
  for i = 1 to 3 do
    branche i
  done

let () =
  moitieDeCroixDroite ();
  (* Haut *)
  av (); pqtg (); av (); pqtg ();
  moitieDeCroixGauche ();
  (* Bas *)
  avf 2; pqtg (); av (); pqtg (); av ();
  st ()
