open LibRobot

(* Dessiner une frise de doubles crans *)

(* Dessiner le motif 'n_' *)
let cran () =
  av (); pqtd (); av (); pqtd (); av (); pqtg (); av ();
  pqtg ()

let friseCrantee () =
  for j = 1 to 20 do cran () done

let () =
  ag ();
  for i = 1 to 2 do
    friseCrantee ();
    (* Extrémité droite *)
    av (); pqtd (); av (); pqtd (); av (); av ()
  done;
  st ()
