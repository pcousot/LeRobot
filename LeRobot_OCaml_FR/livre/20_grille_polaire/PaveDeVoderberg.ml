open LibRobot

(* Dessiner un pavé de Voderberg *)

let tailleQuadrillage = 90.
let theta = 15.

(* Dessiner un pavé de Voderberg en commençant par la
   pointe. *)
let pave () =
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (11. *. theta);
  av (); pdt (); rt (7. *. theta);
  av (); pdt (); rt (4. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt (); rt (13. *. theta);
  av (); pdt ()

let () =
  eb (); ag (); lg tailleQuadrillage; rt (-20.); pave ();
  st ()
