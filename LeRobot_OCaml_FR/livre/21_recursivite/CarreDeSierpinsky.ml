open LibRobot

(* Carré de Sierpinski *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    pqtd ();
    lc (); segment (n - 1); bc ();
    segment (n - 1)
  end

let carre n =
  for i = 1 to 4 do
    segment n; pqtd ()
  done

let () =
  ag (); eb (); lg 2.; carre 4; st ()
