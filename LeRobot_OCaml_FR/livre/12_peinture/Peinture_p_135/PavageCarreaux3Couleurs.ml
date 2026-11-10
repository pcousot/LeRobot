open LibRobot

(* Carrelage en trois couleurs *)

let nombreDeLignes = 10  (* pair *)
let longueurLigne = 10   (* pair *)

(* Le robot étant orienté à l'est, au coin inférieur
   gauche, dessiner un carré en noir et revenir au
   point de départ, orienté au sud. *)
let carre () =
  cc noir;
  av (); pqtg (); av (); pqtg (); av (); pqtg (); av ()

(* Le robot étant en bas à gauche du carré, orienté
   au sud, peindre le carré de la couleur du crayon,
   puis placer le robot en bas à gauche du carré
   suivant, tourné vers l'est. *)
let peindreCarre () =
  phtd (); peindre (); p3htg (); cc noir; av ()

(* Dessiner une ligne de petits carreaux bleus et
   rouges *)
let ligneImpaire () =
  for i = 1 to longueurLigne / 2 do
    carre (); cc bleu; peindreCarre ();
    carre (); cc rouge; peindreCarre ()
  done

(* Dessiner une ligne de petits carreaux blancs et
   indigos *)
let lignePaire () =
  for i = 1 to longueurLigne / 2 do
    carre (); cc blanc; peindreCarre ();
    carre (); cc indigo; peindreCarre ()
  done

let aLaLigne () =
  avf (- longueurLigne); lc (); pqtd (); av (); pqtg ();
  bc ()

let pavage () =
  for i = 1 to nombreDeLignes / 2 do
    ligneImpaire (); aLaLigne ();
    lignePaire (); aLaLigne ()
  done

let () =
  ag (); eh (); avf (-1); pqtd ();
  pavage (); st ()
