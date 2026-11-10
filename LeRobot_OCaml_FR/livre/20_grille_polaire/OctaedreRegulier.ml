open LibRobot

(* Dessiner le développement d'un octaèdre régulier *)

let cote = 25.

let triangle () =
  lgRT (cote, 60.); phtd (); av (); pqtd (); av ();
  p3htd (); av (); av ();
  pdt (); av (); av (); pqtg ()

let () =
  (* Triangle en bas à gauche *)
  pdt (); triangle (); pdt ();
  (* Rangée de trois triangles pointes en haut *)
  for i = 1 to 3 do
    triangle ()
  done;
  (* Compléter les trois triangles pointes en bas *)
  phtd (); av (); p3htg (); avf 6;
  (* Triangle en haut à droite *)
  pdt (); avf 4; pqtg (); triangle ();
  st ()
