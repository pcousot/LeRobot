(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Moyens de transport, page 10.                       **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner un péniche *)
let tailleCarreauGrille = 11
let nombreDeHublots = 8

let porte () =
  (* Dessiner la porte de la cabine en partant et en terminant au coin *)
  (* inférieur droit, robot orienté vers l'ouest *)
  begin
    pqtd (); avf 6; pqtg (); avf 3; pqtg (); avf 3; lc (); pqtg (); av (); dc (); pdt ();
    av (); pqtg ();
    bc (); avf 3; pqtg (); avf 3; pdt ()
  end

let fenetre () =
  (* Dessiner la fenêtre de la cabine en partant et en terminant du point *)
  (* du  toit  au  dessus  du  coin supérieur gauche de la fenêtre, robot *)
  (* orienté vers l'est *)
  begin
    pqtd (); lc (); av (); bc (); avf 3; pqtg (); avf 2; pqtg (); avf 3; pqtg (); avf 2;
    lc ();
    pqtd (); av (); pqtd (); bc ()
  end

let cabine () =
  (* Dessiner la cabine en partant du coin inférieur droit, robot orienté *)
  (* vers  l'ouest  et  en  terminant  avec le robot vers l'ouest au coin *)
  (* inférieur gauche*)
  begin
    av (); porte (); avf 7; pqtd (); avf 8; pqtg (); avf 2; pdt (); avf 3; fenetre ();
    avf 7; pqtd (); avf 8; pqtd (); avf 8
  end

let hublot () =
  begin
    lc (); pqtd (); av (); bc (); pqtd (); vg (); vg (); vg (); vg (); lc (); pqtd (); av ();
    pqtd (); bc ()
  end

let dessus n =
  (* Dessus de la péniche avec N hublots *)
  begin
    avf (3 * n + 4); pqtd (); avf 3; vd ();
    for h = 1 to n do avf 2; hublot (); av () done;
    vd (); avf 3; pqtd (); avf (3 * n + 5)
  end

let coque n =
  (* Dessiner la coque d'une péniche de N hublots, en partant du coin *)
  (* supérieur gauche *)
  begin
    pqtd (); av (); pdt (); avf 6; vg (); avf (3 * n + 16); vg (); avf 6
  end

let () =
  lg (float_of_int tailleCarreauGrille); ad (); lc (); pqtg (); av (); bc (); avf 3;
  cabine ();
  dessus nombreDeHublots; coque nombreDeHublots; st ()
