open LibRobot

(* Dessiner un carré peint de chacune des huit couleurs
   des crayons du robot, avec le nom de la couleur *)

let n = 3  (* Taille d'un carré *)

(* Dessiner un carré sous le nom de la couleur *)
let carre () =
  cc noir; translater (0, - (n + 1));
  avf n; pqtd (); avf n; pqtd (); avf n; pqtd (); avf n

(* Peindre le carré et passer au suivant *)
let peindreCarre () =
  phtg (); peindre (); p3htd (); translater (n + 1, n + 1)

let () =
  ag ();
  cc noir; ecrire "blanc"; carre ();
  cc blanc; peindreCarre ();
  cc jaune; ecrire "jaune"; carre ();
  cc jaune; peindreCarre ();
  cc bleu; ecrire "bleu"; carre ();
  cc bleu; peindreCarre ();
  cc violet; ecrire "violet"; carre ();
  cc violet; peindreCarre ();
  cc vert; ecrire "vert"; carre ();
  cc vert; peindreCarre ();
  cc rouge; ecrire "rouge"; carre ();
  cc rouge; peindreCarre ();
  cc indigo; ecrire "indigo"; carre ();
  cc indigo; peindreCarre ();
  cc noir; ecrire "noir"; carre ();
  cc noir; peindreCarre ();
  st ()
