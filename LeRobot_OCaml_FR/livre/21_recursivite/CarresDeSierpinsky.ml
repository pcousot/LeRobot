open LibRobot

(* Carrés de Sierpinski d'ordres 1 à 4 *)

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

let rec troisPuissance n =
  if n <= 0 then 1
  else 3 * troisPuissance (n - 1)

let () =
  for i = 1 to 4 do
    cf blanc; ag (); eb ();
    lg (float_of_int (162 / troisPuissance i)); carre i;
    marquerUnePause ()
  done
