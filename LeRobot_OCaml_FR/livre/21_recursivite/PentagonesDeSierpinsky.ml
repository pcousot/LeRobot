open LibRobot

(* Pentagones de Sierpinski d'ordres 1 à 4 *)

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

let rec troisPuissance n =
  if n <= 0 then 1
  else 3 * troisPuissance (n - 1)

let () =
  for i = 1 to 4 do
    cf blanc; eh (); pe ();
    lg (float_of_int (324 / troisPuissance i));
    pentagone i;
    marquerUnePause ()
  done;
  st ()
