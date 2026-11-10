open LibRobot

(* Dessiner des stries sur les côtés d'un octogone *)

let () =
  lc (); avf 5; bc (); lg 4.;
  for i = 1 to 8 do
    (* Dessiner 10 stries de longueurs 2, 4, ..., 20. *)
    for j = 1 to 10 do
      (* Dessiner une strie de longueur (2 * j) centrée
         sur un côté de l'octogone. *)
      avf j; avf (-2 * j); avf j;
      (* Passer à la strie suivante (sans tracer le côté
         de l'octogone). *)
      lc (); pqtd (); av (); pqtg (); bc ()
    done;
    (* Tourner le robot perpendiculairement au côté
       suivant. *)
    phtd ()
  done;
  st ()
