open LibRobot

(* Pentagone de Sierpinski *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    segment (n - 1);
    rt (-72.);
    segment (n - 1);
    rt (-72.);
    segment (n - 1);
    rt (-72.);
    segment (n - 1);
    rt (-72.);
    segment (n - 1);
    rt (-72.);
    lc (); segment (n - 1); bc ();
    segment (n - 1)
  end

let pentagone n =
  for i = 1 to 5 do
    segment (n - 1);
    rt (-72.)
  done

let () =
  pe (); eh (); lg 4.; pentagone 4; st ()
