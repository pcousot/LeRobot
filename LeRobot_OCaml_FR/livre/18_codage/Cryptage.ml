open LibRobot

(* Coder un message avec un code secret *)

let tailleGrille = 6

(* Mise en page *)
let aLaLigne () =
  ag (); translater (0, -4)

let finDeMot () =
  translater (2, 0)

(* Dessin des lettres et des chiffres *)
let lettreA () =
  pn (); translater (2, 0); avf 2; translater (0, -1);
  vg (); vg (); vg (); vg ();
  translater (1, -1)

let lettreB () =
  pn (); avf 3; translater (0, -2); vd (); vd (); vd ();
  vd (); translater (3, -1)

let lettreC () =
  translater (2, 0); pw (); av (); vd (); vd (); vd ();
  translater (1, -1)

let lettreD () =
  pn (); translater (2, 0); avf 3; translater (0, -2);
  vg (); vg (); vg (); vg ();
  translater (1, -1)

let lettreE () =
  translater (2, 0); pw (); av (); vd (); vd (); vd ();
  pqtd (); av (); av ();
  translater (3, -1)

let lettreF () =
  pn (); avf 2; vd (); vd (); translater (-2, -1); pe ();
  av (); translater (2, -1)

let lettreG () =
  pn (); translater (2, 1); av (); translater (0, -1);
  vg (); vg (); vg (); vg (); pdt ();
  av (); vd (); translater (2, 1)

let lettreH () =
  pn (); avf 3; translater (0, -2); vd (); vd (); av ();
  translater (1, 0)

let lettreI () =
  pn (); avf 2; translater (0, 1); dp ();
  translater (1, -3)

let lettreJ () =
  translater (1, 3); ps (); dp (); translater (0, -1);
  avf 2; vd ();
  translater (2, 1)

let lettreK () =
  pn (); avf 3; translater (0, -2); pne (); av ();
  translater (-1, -1); pse ();
  av (); translater (1, 0)

let lettreL () =
  pn (); avf 3; translater (1, -3)

let lettreM () =
  pn (); avf 2; translater (0, -1); vd (); vd (); av ();
  translater (0, 1); pn ();
  vd (); vd (); av (); translater (1, 0)

let lettreN () =
  pn (); avf 2; translater (0, -1); vd (); vd (); av ();
  translater (1, 0)

let lettreO () =
  pn (); translater (0, 1); vd (); vd (); vd (); vd ();
  translater (3, -1)

let lettreP () =
  translater (0, -1); pn (); avf 3; translater (0, -1);
  vd (); vd (); vd (); vd ();
  translater (3, -1)

let lettreQ () =
  translater (2, -1); pn (); avf 3; translater (0, -1);
  vg (); vg (); vg (); vg ();
  translater (1, -1)

let lettreR () =
  pn (); avf 2; translater (0, -1); vd (); vd ();
  translater (1, -1)

let lettreS () =
  pe (); av (); phtg (); vg (); pw (); av (); pnw ();
  vd (); phtd (); av ();
  translater (1, -2)

let lettreT () =
  translater (0, 3); ps (); av (); pe (); av ();
  translater (-1, 0); ps (); av (); vg ();
  vg (); translater (1, -1)

let lettreU () =
  translater (0, 2); ps (); av (); vg (); vg ();
  translater (0, -1); avf 2;
  translater (1, -2)

let lettreV () =
  translater (1, 0); pnw (); av (); pn (); av ();
  translater (1, -2); pne (); av (); pn ();
  av (); translater (1, -2)

let lettreW () =
  translater (1, 0); pnw (); av (); pn (); av ();
  translater (1, -2); pne (); av (); pn ();
  av (); translater (0, -1); pse (); av (); pne (); av ();
  pn (); av (); translater (1, -2)

let lettreX () =
  pne (); avf 2; translater (0, -2); pnw (); avf 2;
  translater (3, -2)

let lettreY () =
  translater (0, 2); ps (); av (); vg (); vg (); av ();
  pdt (); avf 2; vd ();
  translater (2, 1)

let lettreZ () =
  translater (0, 2); pe (); avf 2; psw (); avf 2; pe ();
  avf 2;
  translater (1, 0)

let chiffre0 () =
  translater (1, 0); pw (); vd (); av (); vd (); vd ();
  av (); vd (); translater (2, 0)

let chiffre1 () =
  translater (1, 0); pn (); avf 3; psw (); av ();
  translater (2, -2)

let chiffre2 () =
  translater (0, 2); pn (); vd (); vd (); psw (); avf 2;
  pe (); avf 2;
  translater (1, 0)

let chiffre3 () =
  translater (0, 3); pne (); vd (); vd (); pw (); av ();
  translater (1, 0); pe (); vd ();
  vd (); av (); translater (3, 0)

let chiffre4 () =
  translater (2, 0); pn (); avf 3; psw (); avf 2; pe ();
  avf 2;
  translater (1, -1)

let chiffre5 () =
  pe (); av (); vg (); vg (); av (); pqtd (); av ();
  pqtd (); av (); av ();
  translater (1, -3)

let chiffre6 () =
  translater (0, 1); pn (); vd (); vd (); vd (); vd ();
  av (); vd (); av ();
  translater (1, -1)

let chiffre7 () =
  translater (0, 3); pe (); avf 2; ps (); av (); psw ();
  av (); ps (); av ();
  translater (2, 0)

let chiffre8 () =
  translater (1, 0); pw (); vd (); vd (); av (); vd ();
  vd (); av (); translater (0, 2);
  pnw (); vd (); vd (); vd (); translater (2, -2)

let chiffre9 () =
  translater (2, 2); ps (); vd (); vd (); vd (); vd ();
  av (); vd (); av ();
  translater (3, 0)

(* codage *)
let blanc () =
  chiffre8 ()

let a () =
  finDeMot ()

let b () =
  chiffre6 ()

let c () =
  lettreH ()

let d () =
  lettreE ()

let e () =
  chiffre1 ()

let f () =
  lettreL ()

let g () =
  lettreN ()

let h () =
  lettreO ()

let i () =
  lettreQ ()

let j () =
  lettreV ()

let k () =
  chiffre3 ()

let l () =
  lettreY ()

let m () =
  chiffre9 ()

let n () =
  lettreA ()

let o () =
  lettreW ()

let p () =
  lettreK ()

let q () =
  lettreP ()

let r () =
  lettreZ ()

let s () =
  chiffre5 ()

let t () =
  lettreU ()

let u () =
  lettreF ()

let v () =
  lettreB ()

let w () =
  chiffre4 ()

let x () =
  lettreI ()

let y () =
  lettreM ()

let z () =
  chiffre7 ()

let c0 () =
  lettreJ ()

let c1 () =
  lettreG ()

let c2 () =
  lettreT ()

let c3 () =
  lettreR ()

let c4 () =
  lettreC ()

let c5 () =
  chiffre0 ()

let c6 () =
  lettreX ()

let c7 () =
  lettreS ()

let c8 () =
  chiffre2 ()

let c9 () =
  lettreD ()

let () =
  eh (); aLaLigne (); lg (float_of_int tailleGrille);
  m (); e (); s (); s (); a (); g (); e (); blanc ();
  t ();
  r (); e (); s (); blanc (); s ();
  e (); c (); r (); e (); t (); blanc (); st ()
