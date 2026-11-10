open LibRobot

(* Courbes du dragon d'ordres 1, 2, 4, ..., 12 *)

let rec segmentDroit n =
  if n = 0 then av ()
  else if n > 0 then begin
    segmentDroit (n - 1);
    pqtg ();
    segmentGauche (n - 1)
  end

and segmentGauche n =
  if n = 0 then av ()
  else if n > 0 then begin
    segmentDroit (n - 1);
    pqtd ();
    segmentGauche (n - 1)
  end

let grille i =
  message ("Courbe du dragon d'ordre "
           ^ entierEnChaine i);
  if i <= 6 then lg 12.
  else if i <= 8 then lg 6.
  else if i <= 10 then lg 3.
  else lg 2.

let () =
  pe (); grille 1; segmentDroit 1; marquerUnePause ();
  for i = 1 to 6 do
    cf blanc; pe (); grille (2 * i); segmentDroit (2 * i);
    marquerUnePause ()
  done;
  st ()
