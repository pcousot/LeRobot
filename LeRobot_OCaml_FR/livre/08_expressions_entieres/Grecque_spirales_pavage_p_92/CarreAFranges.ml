open LibRobot

(* Dessiner un carré à franges *)

let () =
  (* Monter *)
  lc ();
  for i = 1 to 3 do av () done;
  bc ();
  (* Dessiner le carré à franges *)
  for i = 1 to 4 do
    (* Dessiner un côté du carré avec 5 franges de
       longueurs i + 1, i + 2, ..., i + 5. *)
    for j = 1 to 5 do
      (* Dessiner une frange de longueur (i + j). *)
      for k = 1 to i + j do av () done;
      pdt ();
      for k = 1 to i + j do av () done;
      (* Passer à la frange suivante. *)
      pqtg (); av (); pqtg ()
    done;
    (* Tourner le robot perpendiculairement au côté
       suivant. *)
    pqtd ()
  done;
  st ()
