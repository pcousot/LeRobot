open LibRobot

(* Dessiner une frise de losanges *)

(* Dessiner une dent de scie /\ *)
let dent () =
  av (); av (); pqtd (); av (); av (); pqtg ()

(* Dessiner une frise en dents de scie /\/\/\/\... *)
let scie () =
  for i = 1 to 10 do dent () done

(* Dessiner la frise de losanges *)
let frise () =
  (* Déplacement à gauche du cadre, orientation au NE *)
  ag (); phtd ();
  (* Dessiner la frise de losanges par moitiés *)
  for j = 1 to 2 do
    scie ();
    (* Dessiner l'extrémité *)
    phtg (); av (); av (); p3htg ()
  done

let () =
  frise (); st ()
