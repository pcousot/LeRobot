open LibRobot

(* Triangles de Sierpinski d'ordres 1 à 4 *)

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

let rec troisPuissance n =
  if n <= 0 then 1
  else 3 * troisPuissance (n - 1)

let () =
  for i = 1 to 4 do
    cf blanc; ag (); eb ();
    lg (float_of_int (162 / troisPuissance i));
    triangle i;
    marquerUnePause ()
  done;
  st ()
