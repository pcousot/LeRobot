open LibRobot

(* Spirale de Baravelle *)

let n = 7
let deuxPuissanceN = 128.

let spirale () =
  for i = 1 to n do
    av (); p3htd (); av (); p3htd (); av (); pqtd ();
    av (); phtd ();
    lg (valLgX () /. 2.);
    av (); p3htd (); av (); av (); p3htd (); av ();
    pqtd (); av (); phtd ()
  done

let carre () =
  avf 2; pqtd (); avf 2; pqtd (); avf 2; pqtd (); avf 2;
  pqtd ()

(* Placer le robot au coin inférieur gauche du cadre,
   sur une grille de côté deuxPuissanceN *)
let coin () =
  lg 1.; eb (); ag (); lg deuxPuissanceN

let () =
  coin (); carre (); spirale ();
  coin (); pn (); avf 2; pqtd (); avf 2; pqtd ();
  spirale ();
  coin (); pn (); avf 2; phtg (); peindre ();
  coin (); pe (); avf 2; phtd (); peindre ();
  st ()
