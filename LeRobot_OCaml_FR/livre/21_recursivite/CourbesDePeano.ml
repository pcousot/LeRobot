open LibRobot

(* Courbes de Peano *)

let rec segmentX n =
  if n > 0 then begin
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    pqtd ();
    av ();
    pqtd ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    pqtg ();
    av ();
    pqtg ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1)
  end

and segmentY n =
  if n > 0 then begin
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    pqtg ();
    av ();
    pqtg ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    pqtd ();
    av ();
    pqtd ();
    segmentY (n - 1);
    av ();
    segmentX (n - 1);
    av ();
    segmentY (n - 1)
  end

let rec quatrePuissance n =
  if n <= 0 then 1
  else 4 * quatrePuissance (n - 1)

let () =
  for i = 1 to 4 do
    message ("Courbe de Peano d'ordre "
             ^ entierEnChaine i);
    cf blanc; ag (); eb ();
    lg (512. /. float_of_int (quatrePuissance i));
    segmentX i;
    marquerUnePause ()
  done;
  st ()
