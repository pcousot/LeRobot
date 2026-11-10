open LibRobot

(* Dessiner une toile d'araignée *)

let hexagone r =
  lgRT (float_of_int r, 60.);
  ce (); pw ();
  for i = 1 to 2 do
    lc (); av (); av (); bc (); p3htd (); av (); phtd ();
    av (); av (); phtd (); av (); ce ();
    pe ()
  done

let diagonales r =
  lgRT (float_of_int r, 60.);
  psw ();
  for i = 1 to 4 do
    av (); ce (); pqtd ()
  done;
  ce (); pw (); avf 2; ce (); pe (); avf 2

let toile () =
  for i = 1 to 8 do
    hexagone (5 * i);
    diagonales (5 * i)
  done

let () =
  toile (); st ()
