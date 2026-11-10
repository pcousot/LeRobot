open LibRobot

(* Dessiner des carrés concentriques *)

let () =
  phtd ();
  (* Dessiner un point (carré de côté nul) *)
  dp ();
  for i = 1 to 10 do
    (* Placer le robot au point de départ du tracé du
       carré suivant. *)
    p3htg (); lc (); av (); p3htd (); bc ();
    (* Dessiner un carré, de longueur de côté i, le
       robot démarrant et retournant au coin inférieur
       gauche, orienté au NW. *)
    for j = 1 to 4 do
      (* Avancer de i positions. *)
      for k = 1 to i do av () done;
      pqtd ()
    done
  done;
  st ()
