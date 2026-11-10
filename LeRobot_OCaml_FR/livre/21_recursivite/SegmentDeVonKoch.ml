open LibRobot

(* Dessiner une courbe de Von Koch *)

let rec segment n =
  if n = 0 then
    av ()
  else begin
    segment (n - 1);
    phtg ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    phtg ();
    segment (n - 1)
  end

let () =
  lg 6.; ag (); pe (); segment 3; st ()
