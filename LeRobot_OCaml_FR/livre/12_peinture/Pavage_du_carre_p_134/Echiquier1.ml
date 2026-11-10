open LibRobot

(* Dessiner un échiquier 8 x 8 *)

(* Dessiner un carré blanc de côté 2 en partant du
   coin inférieur gauche et en arrivant au coin
   inférieur droit, le robot gardant son orientation
   (nord ou sud) *)
let carreBlanc () =
  for i = 1 to 4 do avf 2; pqtd () done;
  pqtd (); avf 2; pqtg ()

(* Dessiner un carré noir de côté 2 en partant du
   coin inférieur gauche et en arrivant au coin
   inférieur droit, le robot gardant son orientation
   (nord ou sud) *)
let carreNoir () =
  carreBlanc ();
  (* Mettre le robot dans le carré blanc et peindre
     en noir *)
  lc (); phtg (); av (); peindre ();
  (* Retourner au coin inférieur droit *)
  pdt (); av (); p3htg (); bc ()

let () =
  avf 6;
  for i = 1 to 4 do
    (* Dessiner une ligne impaire de huit carrés
       alternativement blancs et noirs *)
    for j = 1 to 4 do
      carreBlanc (); carreNoir ()
    done;
    (* Retourner le robot pour dessiner une ligne
       paire de droite à gauche *)
    pdt ();
    (* Dessiner une ligne paire de huit carrés
       alternativement blancs et noirs *)
    for j = 1 to 4 do
      carreBlanc (); carreNoir ()
    done;
    (* Descendre le robot pour dessiner une ligne
       impaire de gauche à droite *)
    lc (); avf 4; pdt (); bc ()
  done;
  st ()
