open LibRobot

(* Faire tourner le robot sans fin. Le corps de la boucle
   comprend une commande du robot : on peut arrêter son
   exécution en tapant Échap )esc), § ou # dans la fenêtre
    du robot. *)

let () =
  lc ();
  while true do
    vd ()
  done;
  st ()
