open LibRobot

(* Dessiner une frise de X penchés *)

let () =
  ag ();
  for l = 1 to 20 do
    (* Le robot étant tourné vers le nord, dessiner un
       X penché *)
    (* Branche NW-SE *)
    pqtd (); av (); phtd (); av (); av (); phtg (); av ();
    (* Revenir au centre du X *)
    pdt (); av (); phtd (); av ();
    (* Demi-branche SW *)
    pqtg (); av (); p3htg (); av ();
    (* Revenir au centre du X *)
    pdt (); av (); p3htd (); av ();
    (* Demi-branche NE *)
    av (); p3htg (); av ();
    (* Retourner le robot vers le nord *)
    pqtd ()
  done;
  st ()
