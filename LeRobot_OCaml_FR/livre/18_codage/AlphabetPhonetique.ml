open LibRobot

(* Écrire l'alphabet phonétique international *)

let tailleGrille = 3
let interligne = 3
let espaceEntreMots = 2

(* Passer à la ligne s'il n'y a plus la place pour écrire
   un mot de n lettres de l'alphabet dans un rectangle (2
   x 4) espacées de 1 sur la ligne courante. *)
let aLaLigne n =
  pe ();
  (* Essayer de sauter 3 espaces par lettre plus un à la
     fin du mot de n lettres. *)
  for i = 1 to 3 * n + 1 do
    if not (tb ()) then translater (1, 0)
  done;
  if tb () then begin
    (* Passer à la ligne, pas de place sur la ligne
       courante. *)
    ag (); translater (0, - (4 + interligne))
  end else
    (* Revenir en arrière pour écrire sur la ligne
       courante *)
    translater (- (3 * n + 1), 0)

(* Écrire les lettres de l'alphabet dans un rectangle (2 x
   4) *)
let ecrireA () =
  pn (); avf 2; pqtd (); avf 2; avf (-2); pqtg (); av ();
  vd (); vd (); avf 3;
  translater (1, 0)

let ecrireB () =
  pn (); avf 4; pqtd (); av (); vd (); vd (); av ();
  pdt (); av (); vd (); vd (); av ();
  translater (3, 0)

let ecrireC () =
  translater (2, 1); ps (); vd (); vd (); avf 2; vd ();
  vd (); translater (1, -3)

let ecrireD () =
  pn (); avf 4; pqtd (); av (); vd (); avf 2; vd ();
  av (); translater (3, 0)

let ecrireE () =
  pe (); avf 2; avf (-2); pqtg (); avf 2; pqtd (); av ();
  pdt (); av ();
  pqtd (); avf 2; pqtd (); av (); av ();
  translater (1, -4)

let ecrireF () =
  pn (); avf 2; pqtd (); av (); pdt (); av (); pqtd ();
  avf 2; pqtd (); avf 2;
  translater (1, -4)

let ecrireG () =
  translater (1, 2); pe (); av (); pqtd (); av (); vd ();
  vd (); avf 2; vd (); vd ();
  translater (1, -3)

let ecrireH () =
  pn (); avf 2; pqtd (); avf 2; avf (-2); pqtg (); avf 2;
  translater (2, -4);
  avf 4; translater (1, -4)

let ecrireI () =
  pe (); avf 2; pdt (); av (); pqtd (); avf 4; pqtg ();
  av (); pdt (); avf 2;
  translater (1, -4)

let ecrireJ () =
  translater (0, 4); pe (); avf 2; pqtd (); avf 3; vd ();
  vd ();
  translater (3, -1)

let ecrireK () =
  pn (); avf 4; translater (0, -2); pe (); vg (); vd ();
  translater (-2, -2);
  vd (); vg (); translater (1, 0)

let ecrireL () =
  pn (); avf 4; translater (0, -4); pe (); avf 2;
  translater (1, 0)

let ecrireM () =
  pn (); avf 4; pdt (); vg (); vg (); pdt (); avf 4;
  translater (1, 0)

let ecrireN () =
  pn (); avf 4; pqtd (); vd (); vg (); pqtg (); avf 2;
  pdt (); avf 4;
  translater (1, 0)

let ecrireO () =
  translater (1, 0); pw (); vd (); avf 2; vd (); vd ();
  avf 2; vd ();
  translater (2, 0)

let ecrireP () =
  pn (); avf 4; pqtd (); av (); vd (); vd (); av ();
  translater (3, -2); pdt ()

let ecrireQ () =
  translater (1, 1); ps (); vg (); translater (-1, 0);
  pw (); vd (); avf 2;
  vd (); vd (); avf 2; vd (); translater (2, 0)

let ecrireR () =
  pn (); avf 4; pqtd (); av (); vd (); vd (); av ();
  pdt (); av (); vd (); av ();
  translater (1, 0)

let ecrireS () =
  translater (0, 1); ps (); vg (); vg (); vg (); vd ();
  vd (); vd (); translater (1, -3)

let ecrireT () =
  translater (1, 0); pn (); avf 4; translater (-1, 0);
  pe (); avf 2;
  translater (1, -4)

let ecrireU () =
  translater (0, 4); ps (); avf 3; vg (); vg (); avf 3;
  translater (1, -4)

let ecrireV () =
  translater (0, 4); ps (); avf 3; pqtg (); vd (); pdt ();
  vd (); pqtg (); avf 3;
  translater (1, -4)

let ecrireW () =
  translater (0, 4); ps (); avf 4; pqtg (); vg (); avf 2;
  pdt (); avf 2; vg ();
  pqtg (); avf 4; translater (1, -4)

let ecrireX () =
  pn (); av (); vd (); vg (); av (); translater (-2, 0);
  ps (); av (); vg (); vd (); av ();
  translater (1, 0)

let ecrireY () =
  translater (0, 4); ps (); av (); vg (); vg (); av ();
  pdt (); avf 3; vd (); vd ();
  translater (3, -1)

let ecrireZ () =
  translater (0, 4); pe (); avf 2; pqtd (); av (); vd ();
  vg (); av (); pqtg (); avf 2;
  translater (1, 0)

(* Un espace supplémentaire entre chaque mot *)
let espace () =
  translater (espaceEntreMots, 0)

(* Code international de l'alphabet par lecture phonétique
   ALFA *)
let a () =
  aLaLigne 4; ecrireA (); ecrireL (); ecrireF ();
  ecrireA (); espace ()

(* BRAVO *)
let b () =
  aLaLigne 5; ecrireB (); ecrireR (); ecrireA ();
  ecrireV (); ecrireO (); espace ()

(* CHARLIE *)
let c () =
  aLaLigne 7; ecrireC (); ecrireH (); ecrireA ();
  ecrireR (); ecrireL (); ecrireI ();
  ecrireE (); espace ()

(* DELTA *)
let d () =
  aLaLigne 5; ecrireD (); ecrireE (); ecrireL ();
  ecrireT (); ecrireA (); espace ()

(* ECHO *)
let e () =
  aLaLigne 4; ecrireE (); ecrireC (); ecrireH ();
  ecrireO (); espace ()

(* FOXTROT *)
let f () =
  aLaLigne 7; ecrireF (); ecrireO (); ecrireX ();
  ecrireT (); ecrireR (); ecrireO ();
  ecrireT (); espace ()

(* GOLF *)
let g () =
  aLaLigne 4; ecrireG (); ecrireO (); ecrireL ();
  ecrireF (); espace ()

(* HOTEL *)
let h () =
  aLaLigne 5; ecrireH (); ecrireO (); ecrireT ();
  ecrireE (); ecrireL (); espace ()

(* INDIA *)
let i () =
  aLaLigne 5; ecrireI (); ecrireN (); ecrireD ();
  ecrireI (); ecrireA (); espace ()

(* JULIET *)
let j () =
  aLaLigne 6; ecrireJ (); ecrireU (); ecrireL ();
  ecrireI (); ecrireE (); ecrireT ();
  espace ()

(* KILO *)
let k () =
  aLaLigne 4; ecrireK (); ecrireI (); ecrireL ();
  ecrireO (); espace ()

(* LIMA *)
let l () =
  aLaLigne 4; ecrireL (); ecrireI (); ecrireM ();
  ecrireA (); espace ()

(* MIKE *)
let m () =
  aLaLigne 4; ecrireM (); ecrireI (); ecrireK ();
  ecrireE (); espace ()

(* NOVEMBER *)
let n () =
  aLaLigne 8; ecrireN (); ecrireO (); ecrireV ();
  ecrireE (); ecrireM ();
  ecrireB (); ecrireE (); ecrireR (); espace ()

(* OSCAR *)
let o () =
  aLaLigne 5; ecrireO (); ecrireS (); ecrireC ();
  ecrireA (); ecrireR (); espace ()

(* PAPA *)
let p () =
  aLaLigne 4; ecrireP (); ecrireA (); ecrireP ();
  ecrireA (); espace ()

(* QUEBEC *)
let q () =
  aLaLigne 6; ecrireQ (); ecrireU (); ecrireE ();
  ecrireB (); ecrireE (); ecrireC ();
  espace ()

(* ROMEO *)
let r () =
  aLaLigne 5; ecrireR (); ecrireO (); ecrireM ();
  ecrireE (); ecrireO (); espace ()

(* SIERRA *)
let s () =
  aLaLigne 6; ecrireS (); ecrireI (); ecrireE ();
  ecrireR (); ecrireR (); ecrireA ();
  espace ()

(* TANGO *)
let t () =
  aLaLigne 5; ecrireT (); ecrireA (); ecrireN ();
  ecrireG (); ecrireO (); espace ()

(* UNIFORM *)
let u () =
  aLaLigne 7; ecrireU (); ecrireN (); ecrireI ();
  ecrireF (); ecrireO (); ecrireR ();
  ecrireM (); espace ()

(* VICTOR *)
let v () =
  aLaLigne 6; ecrireV (); ecrireI (); ecrireC ();
  ecrireT (); ecrireO (); ecrireR ();
  espace ()

(* WHISKEY *)
let w () =
  aLaLigne 7; ecrireW (); ecrireH (); ecrireI ();
  ecrireS (); ecrireK (); ecrireE ();
  ecrireY (); espace ()

(* XRAY *)
let x () =
  aLaLigne 4; ecrireX (); ecrireR (); ecrireA ();
  ecrireY (); espace ()

(* YANKEE *)
let y () =
  aLaLigne 6; ecrireY (); ecrireA (); ecrireN ();
  ecrireK (); ecrireE (); ecrireE ();
  espace ()

(* ZULU *)
let z () =
  aLaLigne 4; ecrireZ (); ecrireU (); ecrireL ();
  ecrireU (); espace ()

let () =
  lg (float_of_int tailleGrille); eh (); ag ();
  translater (0, - (4 + interligne));
  a (); b (); c (); d (); e (); f (); g (); h (); i ();
  j (); k (); l (); m (); n (); o ();
  p (); q (); r (); s (); t (); u (); v ();
  w (); x (); y (); z (); st ()
