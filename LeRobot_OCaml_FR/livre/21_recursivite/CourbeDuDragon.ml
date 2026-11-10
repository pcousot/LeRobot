open LibRobot

(* Courbe du dragon d'ordre 12 *)

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

let () =
  lg 2.; pe (); segmentDroit 12; st ()
