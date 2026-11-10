open LibRobot

(* Dessiner une frise de pointes de diamants *)

(* Dessiner un rectangle, le robot partant du coin
   inférieur gauche et arrivant au coin inférieur
   droit, orienté vers le nord. *)
let rectangle () =
  av (); av (); pqtd (); av (); av (); av (); av ();
  pqtd (); av (); av (); pqtd (); av ();
  av (); av (); av ()

(* Dessiner une pointe de diamant, le robot partant du
   coin inférieur gauche et arrivant au coin inférieur
   droit, orienté vers le nord. *)
let pointeDeDiamant () =
  rectangle ();
  p3htd (); av (); pqtg (); av (); pdt (); av (); phtg ();
  av (); av (); phtg (); av ();
  pdt (); av ();
  pqtg (); av (); p3htg ()

(* Dessiner une frise de dix pointes de diamants
   juxtaposées *)
let frise () =
  for i = 1 to 10 do pointeDeDiamant () done

let () =
  ag (); frise (); st ()
