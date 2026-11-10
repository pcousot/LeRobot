open LibRobot

(* Courbes de Hilbert d'ordres 1 à 6 *)

let rec segmentG n =
  if n > 0 then begin
    pqtg ();
    segmentD (n - 1);
    av ();
    pqtd ();
    segmentG (n - 1);
    av ();
    segmentG (n - 1);
    pqtd ();
    av ();
    segmentD (n - 1);
    pqtg ()
  end

and segmentD n =
  if n > 0 then begin
    pqtd ();
    segmentG (n - 1);
    av ();
    pqtg ();
    segmentD (n - 1);
    av ();
    segmentD (n - 1);
    pqtg ();
    av ();
    segmentG (n - 1);
    pqtd ()
  end

let rec deuxPuissance n =
  if n <= 0 then 1
  else 2 * deuxPuissance (n - 1)

let () =
  for i = 1 to 6 do
    message ("Courbe de Hilbert d'ordre "
             ^ entierEnChaine i);
    cf blanc; eb (); ag ();
    lg (float_of_int (256 / deuxPuissance i)); segmentD i;
    marquerUnePause ()
  done;
  st ()
