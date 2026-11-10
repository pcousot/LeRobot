open LibRobot

(* Courbes de Von Koch d'ordres 0 à 5 *)

let rec segment n =
  if n = 0 then av ()
  else begin
    segment (n - 1);
    phtg ();
    segment (n - 1);
    pqtd ();
    segment (n - 1);
    phtg ();
    segment (n - 1)
  end

let rec quatrePuissance n =
  if n <= 0 then 1
  else 4 * quatrePuissance (n - 1)

let grille i =
  lg (500. /. float_of_int (quatrePuissance (i - 1)))

let () =
  for i = 1 to 6 do
    cf blanc; eb (); ag (); pe (); grille i;
    segment (i - 1); marquerUnePause ()
  done
