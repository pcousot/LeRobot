open LibRobot

(* Dessiner un arbre binaire *)

(* Dessiner un arbre à l feuilles, la racine en haut,
   les feuilles en bas, en supposant que l >= 1,
   l'arbre étant réduit à un point quand l = 1. Avant
   et après le dessin, le robot doit être placé à la
   racine de l'arbre, orienté au nord avec son crayon
   baissé. *)
let rec arbre l =
  if l = 1 then
    (* Dessiner un arbre réduit à un seul point (sans
       changer la position et l'orientation du robot) *)
    dp ()
  else begin
    (* Le robot étant placé à la racine de l'arbre,
       orienté au nord avec son crayon baissé, dessiner
       la branche sud-ouest *)
    p3htg (); avf l;
    (* Orienter le robot au nord *)
    p3htd ();
    (* Dessiner le sous-arbre gauche ayant l / 2 >= 1
       feuilles, le robot étant placé à la racine du
       sous-arbre, orienté au nord avec son crayon
       baissé *)
    arbre (l / 2);
    (* Sachant que le robot est placé à la racine du
       sous-arbre gauche, orienté au nord et crayon
       baissé, revenir à la racine de l'arbre, sans
       rien dessiner *)
    lc (); phtd (); avf l;
    (* Le robot étant placé à la racine de l'arbre,
       orienté au nord-est avec son crayon levé,
       dessiner la branche sud-est *)
    bc (); pqtd (); avf l;
    (* Orienter le robot au nord *)
    p3htg ();
    (* Dessiner le sous-arbre droit ayant l - l / 2 >= 1
       feuilles, le robot étant placé à la racine du
       sous-arbre, orienté au nord avec son crayon
       baissé *)
    arbre (l - l / 2);
    (* Placer le robot à la racine de l'arbre, orienté
       au nord avec son crayon baissé *)
    lc (); phtg (); avf l; phtd (); bc ()
  end

let () =
  lgX 2.; lgY 3.; eh (); arbre 32; st ()
