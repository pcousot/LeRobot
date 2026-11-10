open LibRobot

(* Pavage de triangles équilatéraux *)

let longueurCote = 13.
let angle = 60.
let nbLignes = 12
let nbColonnes = 12

let trianglePointeEnHaut () =
  pn (); phtd (); av (); pqtd (); av (); p3htd (); avf 2

let trianglePointeEnHautNoir () =
  trianglePointeEnHaut (); phtg (); peindre ()

let trianglePointeEnBas () =
  ps (); phtg (); av (); pqtg (); av (); p3htg (); avf 2

let trianglePointeEnBasNoir () =
  trianglePointeEnBas (); avf (-1); pqtd (); peindre ()

let pavage () =
  lgRT (longueurCote, angle);
  for j = 1 to nbColonnes do
    for i = 1 to nbLignes / 2 do
      if (i + j) mod 2 = 1 then begin
        eh (); ag (); translater (2 * j, - (2 * i));
        trianglePointeEnHautNoir ();
        eh (); ag (); translater (2 * j, - (2 * i));
        trianglePointeEnBas ()
      end else begin
        eh (); ag (); translater (2 * j, - (2 * i));
        trianglePointeEnHaut ();
        eh (); ag (); translater (2 * j, - (2 * i));
        trianglePointeEnBasNoir ()
      end
    done
  done

let () =
  pavage (); st ()
