(*********************************************************)
(**                                                     **)
(** "Premières leçons de programmation en Turbo Pascal" **)
(** Patrick, Laurent, Radhia et Thibault COUSOT         **)
(** Éditions McGraw-Hill, Paris, 1991.                  **)
(** Alphabet (en lettres majuscules), page 8.           **)
(**                                                     **)
(*********************************************************)

open LibRobot

let av5fois () =
  (* Avancer tout droit 5 fois avec le crayon levé *)
  begin
    lc (); av (); av (); av (); av (); av ()
  end

let l1 () =
  (* Se placer au début de la première ligne *)
  begin
    eh (); ag (); ps (); av5fois (); pn ()
  end

let l2 () =
  (* Se placer au début de la deuxième ligne *)
  begin
    eh (); ag (); ps (); av5fois (); av5fois (); pn ()
  end

let l3 () =
  (* Se placer au début de la troisième ligne *)
  begin
    eh (); ag (); ps (); av5fois (); av5fois (); av5fois (); pn ()
  end

let l4 () =
  (* Se placer au début de la quatrième ligne *)
  begin
    eh (); ag (); ps (); av5fois (); av5fois (); av5fois (); av5fois (); pn ()
  end

let a () =
  (* Dessiner la lettre A *)
  begin
    bc (); av (); av (); pqtd (); av (); av (); pdt (); av (); av (); pqtd (); av (); vd ();
    vd (); av (); av (); av (); lc (); pqtg (); av (); pqtg ()
  end

let b () =
  (* Dessiner la lettre B *)
  begin
    bc (); av (); av (); av (); av (); pqtd (); av (); vd (); vd (); av (); pdt (); av ();
    vd (); vd (); av (); pdt (); lc (); av (); av (); av (); pqtg ()
  end

let c () =
  (* Dessiner la lettre C *)
  begin
    lc (); pqtd (); av (); vg (); pdt (); bc (); vd (); vd (); av (); av (); vd (); vd ();
    lc (); av (); av (); av (); pqtg (); av (); pqtg ()
  end

let d () =
  (* Dessiner la lettre D *)
  begin
    bc (); av (); av (); av (); av (); pqtd (); av (); vd (); av (); av (); vd (); av ();
    lc (); pdt (); av (); av (); av (); pqtg ()
  end

let e () =
  (* Dessiner la lettre E *)
  begin
    bc (); pqtd (); av (); av (); pdt (); av (); av (); pqtd (); av (); av (); pqtd (); av ();
    pdt (); av (); pqtd (); av (); av (); pqtd (); av ();
    av (); lc (); pqtd (); av (); av (); av (); av (); pqtg (); av (); pqtg ()
  end

let f () =
  (* Dessiner la lettre F *)
  begin
    bc (); av (); av (); pqtd (); av (); pdt (); av (); pqtd (); av (); av (); pqtd (); av ();
    av (); lc (); pqtd (); av (); av (); av (); vg (); pqtg ()
  end

let g () =
  (* Dessiner la lettre G *)
  begin
    lc (); av (); av (); pqtd (); av (); bc (); av (); pqtd (); av (); vd (); vd (); av ();
    av (); vd (); vd (); lc (); av (); av (); vg (); pqtg ()
  end

let h () =
  (* Dessiner la lettre H *)
  begin
    bc (); av (); av (); pqtd (); av (); av (); pdt (); av (); av (); pqtd (); av (); av ();
    lc (); pqtd (); av (); av (); pqtd (); bc (); av (); av (); av (); av (); lc (); pqtg ();
    av (); pqtg ()
  end

let i () =
  (* Dessiner la lettre I *)
  begin
    bc (); pqtd (); av (); av (); pdt (); av (); pqtd (); av (); av (); av (); av (); pqtg ();
    av (); pdt (); av (); av (); lc (); pqtd (); av (); av (); av (); vg (); pqtg ()
  end

let j () =
  (* Dessiner la lettre J *)
  begin
    lc (); av (); av (); av (); av (); pqtd (); bc (); av (); av (); pqtd (); av (); av ();
    av (); vd (); vd (); lc (); pdt (); vg (); av (); av (); pqtg ()
  end

let k () =
  (* Dessiner la lettre K *)
  begin
    bc (); av (); av (); av (); av (); pdt (); av (); av (); pqtg (); vg (); vd (); pdt ();
    vg (); vd (); pdt (); vd (); vg (); lc (); av (); pqtg ()
  end

let l () =
  (* Dessiner la lettre L *)
  begin
    bc (); av (); av (); av (); av (); pdt (); av (); av (); av (); av (); pqtg (); av ();
    av (); lc (); av (); pqtg ()
  end

let m () =
  (* Dessiner la lettre M *)
  begin
    bc (); av (); av (); av (); av (); pdt (); vg (); vg (); pdt (); av (); av (); av ();
    av (); lc (); pqtg (); av (); pqtg ()
  end

let n () =
  (* Dessiner la lettre N *)
  begin
    bc (); av (); av (); av (); av (); pqtd (); vd (); vg (); pqtg (); av (); av (); pdt ();
    av (); av (); av (); av (); lc (); pqtg (); av (); pqtg ()
  end

let o () =
  (* Dessiner la lettre O *)
  begin
    lc (); pqtd (); av (); pdt (); bc (); vd (); av (); av (); vd (); vd (); av (); av ();
    vd (); lc (); pdt (); av (); av (); pqtg ()
  end

let p () =
  (* Dessiner la lettre P *)
  begin
    bc (); av (); av (); av (); av (); pqtd (); av (); vd (); vd (); av (); lc (); pdt ();
    av (); av (); av (); pqtd (); av (); av (); pdt ()
  end

let q () =
  (* Dessiner la lettre Q *)
  begin
    lc (); pqtd (); av (); pqtg (); av (); pdt (); bc (); vg (); pdt (); lc (); av (); bc ();
    vd (); av (); av (); vd (); vd (); av (); av (); vd (); lc (); pdt (); av (); av ();
    pqtg ()
  end

let r () =
  (* Dessiner la lettre R *)
  begin
    bc (); av (); av (); av (); av (); pqtd (); av (); vd (); vd (); av (); pdt (); av ();
    vd (); av (); lc (); pqtg (); av (); pqtg ()
  end

let s () =
  (* Dessiner la lettre S *)
  begin
    lc (); av (); pdt (); bc (); vg (); vg (); vg (); vd (); vd (); vd (); lc (); av ();
    av (); vg (); pqtg ()
  end

let t () =
  (* Dessiner la lettre T *)
  begin
    lc (); pqtd (); av (); pqtg (); bc (); av (); av (); av (); av (); pqtg (); av (); pdt ();
    av (); av (); lc (); pqtd (); av (); av (); av (); vg (); pqtg ()
  end

let u () =
  (* Dessiner la lettre U *)
  begin
    lc (); av (); bc (); av (); av (); av (); pdt (); av (); av (); av (); vg (); vg ();
    av (); av (); av (); lc (); pdt (); av (); av (); av (); vg (); pqtg ()
  end

let v () =
  (* Dessiner la lettre V *)
  begin
    lc (); av (); bc (); av (); av (); av (); pdt (); av (); av (); av (); pqtg (); vd ();
    pdt (); vd (); pqtg (); av (); av (); av (); pdt (); av (); av (); av (); lc (); vg ();
    pqtg ()
  end

let w () =
  (* Dessiner la lettre W *)
  begin
    bc (); av (); av (); av (); av (); pdt (); av (); av (); av (); av (); pqtg (); vg ();
    av (); av (); pdt (); av (); av (); vg (); pqtg (); av (); av (); av ();
    av (); pdt (); av (); av (); av (); av (); lc (); pqtg (); av (); pqtg ()
  end

let x () =
  (* Dessiner la lettre X *)
  begin
    bc (); av (); vd (); vg (); av (); lc (); pqtg (); av (); av (); pqtg (); bc (); av ();
    vg (); vd (); av (); lc (); pqtg (); av (); pqtg ()
  end

let y () =
  (* Dessiner la lettre Y *)
  begin
    lc (); av (); pdt (); bc (); vg (); vg (); av (); av (); av (); pdt (); av (); vd ();
    vd (); av (); lc (); pqtd (); av (); av (); av (); pqtd (); av (); av (); av (); av ();
    pdt ()
  end

let z () =
  (* Dessiner la lettre Z *)
  begin
    bc (); pqtd (); av (); av (); pdt (); av (); av (); pqtd (); av (); vd (); vg (); av ();
    pqtg (); av (); av (); lc (); pdt (); av (); av (); pqtd (); av (); av (); av (); vg ();
    pqtg ()
  end

let () =
  (*Alphabet*)
  l1 (); a (); b (); c (); d (); e (); f (); g ();
  l2 (); h (); i (); j (); k (); l (); m (); n ();
  l3 (); o (); p (); q (); r (); s (); t (); u ();
  l4 (); v (); w (); x (); y (); z ();
  st ()
  (*Alphabet*)
