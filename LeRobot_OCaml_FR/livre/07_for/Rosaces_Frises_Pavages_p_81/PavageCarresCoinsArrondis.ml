open LibRobot

(* Dessiner un pavage de carrés aux coins arrondis *)

(* Dessiner une rangée de pavés *)
let rangee () =
  for i = 1 to 20 do
    (* Dessiner un pavé *)
    bc ();
    for j = 1 to 4 do
      (* Dessiner un coté du pavé *)
      av (); vd ()
    done;
    (* Rejoindre le début du pavé suivant *)
    lc (); pqtd (); av (); av (); pqtg ()
  done

(* Rejoindre le début de la rangée suivante de pavés *)
let retour () =
  pdt (); av (); pqtd ();
  for i = 1 to 40 do av () done;
  pqtg (); av (); pdt ()

(* Dessiner 10 rangées de pavés *)
let pavage () =
  for i = 1 to 10 do rangee (); retour () done

let () =
  (* Placer le robot en haut à gauche de l'écran *)
  eh (); ag (); lc (); pdt (); av (); av (); pdt ();
  bc (); pavage (); st ()
