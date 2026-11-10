open LibRobot

(* Triangle de Sierpinski *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    segment (n - 1);
    rt (-120.);
    segment (n - 1);
    rt (-120.);
    segment (n - 1);
    rt (-120.);
    lc (); segment (n - 1); bc ();
    segment (n - 1)
  end

let triangle n =
  rt (-30.);
  for i = 1 to 3 do
    segment n; rt (-120.)
  done

let () =
  eb (); ag (); lg 3.; triangle 4; st ()
