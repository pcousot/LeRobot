(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Moyens de transport, page 10.                       **)
(**                                                     **)
(*********************************************************)

open LibRobot

(* Dessiner un camion *)
let t () =
  (* Dessiner la lettre "T" *)
  begin
    lc (); pqtd (); av (); pqtg (); bc (); av (); av (); pqtg (); av (); pdt (); av (); av ();
    lc (); pqtd (); av (); av (); pqtg (); av (); pqtg (); bc ()
  end

let r () =
  (* Dessiner la lettre "R" *)
  begin
    av (); av (); pqtd (); av (); pqtd (); av (); pqtd (); av (); pqtg (); vg (); lc ();
    av (); bc (); pqtg ()
  end

let a () =
  (* Dessiner la lettre "A" *)
  begin
    av (); av (); pqtd (); av (); pqtd (); av (); pqtd (); av (); pdt (); av (); pqtd ();
    av (); lc (); pqtg (); av (); pqtg (); bc ()
  end

let n () =
  (* Dessiner la lettre "N" *)
  begin
    av (); av (); pdt (); vg (); pqtg (); av (); pdt (); av (); av (); lc (); pqtg (); av ();
    pqtg (); bc ()
  end

let s () =
  (* Dessiner la lettre "S" *)
  begin
    pqtd (); av (); pqtg (); av (); pqtg (); av (); pqtd (); av (); pqtd (); av (); lc ();
    pqtd (); av (); av (); pqtg (); av (); pqtg (); bc ()
  end

let p () =
  (* Dessiner la lettre "P" *)
  begin
    av (); av (); pqtd (); av (); pqtd (); av (); pqtd (); av (); lc (); pqtg (); av ();
    pqtg (); av (); av (); pqtg (); bc ()
  end

let o () =
  (* Dessiner la lettre "O" *)
  begin
    av (); av (); pqtd (); av (); pqtd (); av (); av (); pqtd (); av (); lc (); pdt (); av ();
    av (); pqtg (); bc ()
  end

let transport () =
  (* Dessiner le mot "TRANSPORT" *)
  begin
    t (); r (); a (); n (); s (); p (); o (); r (); t ()
  end

let () =
  (*Camion*)
  (* Monter en haut de la page *)
  lc (); av (); av (); av (); av (); av (); av (); av (); av (); av (); bc ();
  (* Dessiner le toit du camion *)
  pqtg (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  av (); av (); av (); pqtd ();
  vd (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  av (); av (); av (); av (); av (); av (); av (); av (); av (); vd ();
  pqtd (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  (* Dessiner l'arrière du camion *)
  pqtg (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  pqtd (); av (); pdt (); av (); av (); av (); av ();
  (* Dessiner les roues arrières du camion *)
  pqtg (); av (); vd (); av (); av (); av (); av (); av (); vd (); av (); lc (); pqtd ();
  av (); av (); av (); av (); av (); av (); pqtd (); bc ();
  vd (); vd (); vd (); vd (); pqtd (); lc (); av (); av (); av (); pqtg (); bc (); vd ();
  vd (); vd (); vd (); lc (); vd (); vd (); pqtg (); av (); bc ();
  (* Dessiner le dessous du camion *)
  av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  av (); pqtg (); av (); vd (); pqtg ();
  (* Dessiner la portière de la cabine du camion *)
  av (); av (); av (); av (); av (); av (); av (); pqtd (); av (); av (); vd (); av ();
  av (); pqtd (); av (); av (); av (); pdt ();
  av (); av (); av (); pqtd (); av (); av (); av (); av (); av (); av (); pdt ();
  (* Dessiner la roue avant du camion *)
  av (); vg (); av (); av (); lc (); pqtg (); av (); av (); pdt (); bc (); vd (); vd ();
  vd (); vd (); lc (); av (); av (); bc (); pqtd (); av (); av (); vd (); av ();
  (* Dessiner la cabine du camion *)
  pqtg (); av (); av (); pdt (); av (); pqtd (); av (); av (); pqtd (); av (); pqtg ();
  av (); pqtg (); av (); pqtd (); av (); av (); av (); av (); av (); av (); vg (); av ();
  av ();
  av (); pqtd (); av (); av (); pqtd (); av (); pqtd (); av (); av (); pqtd (); av ();
  av (); av (); pqtg (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  av ();
  (* Faire le tour de la caisse du camion *)
  pdt (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  pqtg (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  av ();
  av (); av (); av (); av (); av (); av (); av (); av (); av (); av ();
  (* Rejoindre la première lettre sans dessiner *)
  lc (); pqtg (); av (); av (); av (); av (); pqtg (); av (); pqtg ();
  (* Ecrire "transport" sur la caisse du camion *)
  transport ();
  st ()
  (*Camion*)
