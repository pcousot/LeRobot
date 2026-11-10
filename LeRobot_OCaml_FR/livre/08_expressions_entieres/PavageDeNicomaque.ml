open LibRobot

(* Paver un carré à l'aide de couronnes successives
   constituées de carrés de tailles 1, 2, 3, ... en
   partant du centre. *)

let () =
  for i = 1 to 4 do
    (* Dessiner les 4 côtés de la i-ème couronne en les
       pavant avec des carrés de taille i. *)
    for j = 1 to 4 do
      (* Dessiner un côté de la i-ème couronne, pavé de
         i carrés de longueur de côté i, le robot
         partant du premier carré et arrivant au
         dernier carré dans le même coin et dans la
         même direction qu'au départ. *)
      (* Dessiner i - 1 carrés de la i-ème couronne *)
      for k = 1 to i - 1 do
        (* Dessiner un carré de longueur i, le robot
           partant et arrivant au même coin et dans la
           même direction. *)
        for l = 1 to 4 do
          for m = 1 to i do av () done;
          pqtd ()
        done;
        (* Avancer jusqu'au carré suivant de la i-ème
           couronne. *)
        pqtd ();
        for l = 1 to i do av () done;
        pqtg ()
      done;
      (* Dessiner le i-ème carré de longueur i de la
         i-ème couronne. *)
      for k = 1 to 4 do
        for l = 1 to i do av () done;
        pqtd ()
      done;
      (* Pivoter d'un quart de tour pour placer le
         robot au début du côté suivant de la i-ème
         couronne. *)
      pqtd ()
    done;
    (* Rejoindre le point de départ de la (i + 1)-ème
       couronne. *)
    pqtg ();
    for j = 1 to i do av () done;
    pqtd ();
    for j = 1 to i do av () done
  done;
  st ()
