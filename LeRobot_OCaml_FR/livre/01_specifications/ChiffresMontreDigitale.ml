(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Chiffres digitaux, page 8.                          **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner les chiffres 0 à 9, le robot partant en bas à *)
(* gauche  du  chiffre et terminant dans la même position *)
(* pour le chiffre suivant : *)
let c0 () =
  (* Dessiner le chiffre 0 *)
  begin
    bc (); av (); av (); pqtd (); av (); pqtd (); av (); av (); pqtd (); av ();
    lc (); pdt (); av (); av (); pqtg ()
  end

let c1 () =
  (* Dessiner le chiffre 1 *)
  begin
    bc (); av (); av (); lc (); pqtd (); av (); pqtd (); av (); av (); pdt ()
  end

let c2 () =
  (* Dessiner le chiffre 2 *)
  begin
    lc (); av (); av (); pqtd (); bc (); av (); pqtd (); av (); pqtd (); av (); pqtg ();
    av ();
    pqtg (); av (); lc (); av (); pqtg ()
  end

let c3 () =
  (* Dessiner le chiffre 3 *)
  begin
    lc (); av (); av (); pqtd (); bc (); av (); pqtd (); av (); pqtd (); av (); pdt (); av ();
    pqtd (); av (); pqtd (); av (); lc (); pdt (); av (); av (); pqtg ()
  end

let c4 () =
  (* Dessiner le chiffre 4 *)
  begin
    lc (); av (); av (); pdt (); bc (); av (); pqtg (); av (); pqtg (); av (); pdt (); av ();
    av ();
    lc (); pqtg (); av (); pqtg ()
  end

let c5 () =
  (* Dessiner le chiffre 5 *)
  begin
    bc (); pqtd (); av (); pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd (); av ();
    lc (); av (); pqtd (); av (); av (); pdt ()
  end

let c6 () =
  (* Dessiner le chiffre 6 *)
  begin
    bc (); av (); pqtd (); av (); pqtd (); av (); pqtd (); av (); pqtd (); av (); av ();
    pqtd ();
    av (); lc (); av (); pqtd (); av (); av (); pdt ()
  end

let c7 () =
  (* Dessiner le chiffre 7 *)
  begin
    lc (); av (); av (); pqtd (); bc (); av (); pqtd (); av (); av (); pqtd ();
    lc (); pdt (); av (); pqtg ()
  end

let c8 () =
  (* Dessiner le chiffre 8 *)
  begin
    bc (); av (); pqtd (); av (); pdt (); av (); pqtd (); av (); pqtd (); av (); pqtd ();
    av ();
    av (); pqtd (); av (); lc (); pdt (); av (); av (); pqtg ()
  end

let c9 () =
  (* Dessiner le chiffre 9 *)
  begin
    lc (); av (); bc (); pqtd (); av (); pdt (); av (); pqtd (); av (); pqtd (); av ();
    pqtd ();
    av (); av (); pqtd (); av (); lc (); pdt (); av (); av (); pqtg ()
  end

let () =
  (*ChiffresMontreDigitale*)
  ag (); c0 (); c1 (); c2 (); c3 (); c4 (); c5 (); c6 (); c7 (); c8 (); c9 ();
  st ()
  (*ChiffresMontreDigitale*)
