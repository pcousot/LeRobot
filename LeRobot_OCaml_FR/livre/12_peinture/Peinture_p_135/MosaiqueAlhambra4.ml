open LibRobot

(* Mosaïque de l'Alhambra en couleur *)

let nombreDeLignes = 3
let nombreDeColonnes = 7

let motif1 () =
  phtd (); av (); p3htd (); avf 2; p3htg (); av ();
  p3htg (); av ();
  (* Peindre *)
  phtd (); cc indigo; peindre (); cc noir; phtg ();
  av (); avf (-1); p3htg ();
  cc jaune; peindre (); cc noir; p3htd ();
  (* Continuer *)
  av ()

let motif2 () =
  for i = 1 to 2 do
    av (); p3htd (); av (); phtg (); av (); pqtd ();
    av (); phtg (); av (); p3htd (); av (); pqtg ()
  done;
  cc violet; peindre (); cc noir

let () =
  eh (); ag (); lc (); avf (-2); bc ();
  for j = 1 to nombreDeLignes do
    for i = 1 to nombreDeColonnes do
      motif1 ();
      (* Motif2 suivant *)
      lc (); avf (-2); pqtd (); av (); bc ();
      motif2 ();
      (* Motif1 suivant *)
      lc (); avf (-1); pqtd (); avf 2; pqtg (); bc ()
    done;
    (* Ligne paire suivante *)
    lc (); pdt (); avf 2; bc ();
    for i = 1 to nombreDeColonnes do
      motif1 ();
      (* Motif1 suivant *)
      lc (); pdt (); avf 4; pqtg (); bc ()
    done;
    (* Ligne impaire suivante *)
    lc (); avf 2; pdt (); bc ()
  done;
  st ()
