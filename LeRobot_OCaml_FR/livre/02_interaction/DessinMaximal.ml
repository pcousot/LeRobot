(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Trajectoiures du Robot, page 15.                    **)
(**                                                     **)
(*********************************************************)

open LibRobot

let enHaut () =
  begin
    lg 1.; eh (); lg 51.
  end

let aGauche () =
  begin
    lg 1.; ag (); lg 51.
  end

let aLaLigne () =
  begin
    lc (); aGauche (); ps (); av (); pe (); bc ()
  end

let croix () =
  for i = 1 to 8 do
    phtd ();
    av (); pdt (); av (); pdt ();
    vg (); pdt (); vd (); pdt ();
    vd (); pdt (); vg (); pdt ()
  done

let () =
  enHaut (); aGauche ();
  for l = 1 to 4 do
    aLaLigne ();
    for c = 1 to 8 do av (); croix () done
  done;
  st ()
