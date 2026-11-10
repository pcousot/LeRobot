open LibRobot

(* Figure du livre : calcul de 1 + 2 + ... + 10 avec
   un rectangle de 10 x 11 dont la moitié est pavée *)

let nmax = 10

let carre () =
  av (); pqtd (); av (); pqtd (); av (); pqtd (); av ();
  pqtd (); av ()

let () =
  eb (); ag (); lc (); av (); pqtd (); av (); pqtg ();
  bc ();
  for i = 1 to nmax do
    for j = 1 to i do carre () done;
    translater (1, - i)
  done;
  (* Carre extérieur *)
  avf (nmax + 1); pqtg ();
  avf nmax; pqtg ();
  avf (nmax + 1); pqtg ();
  avf nmax; pqtg (); lc ();
  avf (nmax + 1); pqtg ();
  avf nmax; pqtg ();
  p3htd (); cc jaune; peindre (); st ()
