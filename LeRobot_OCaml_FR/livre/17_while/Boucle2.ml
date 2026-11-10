open LibRobot

(* Boucler sans fin. Le corps de la boucle ne comprend
   aucune commande du robot : on ne peut donc pas arrêter
   son exécution avec Échap (esc), § ou #. Il faut taper 
   Ctrl+C dans la fenêtre de terminal. *)

let () =
  lc ();
  while true do
    ()
  done
