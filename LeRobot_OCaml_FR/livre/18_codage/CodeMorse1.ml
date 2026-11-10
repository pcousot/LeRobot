open LibRobot

(* Écrire et faire entendre des signes en code Morse *)

(* Passer au début de la ligne suivante *)
let aLaLigne () =
  lc (); ag (); ps (); av (); pe (); av (); bc ()

(* Point *)
let pt () =
  dp (); bip (); lc (); av (); bc (); delai 0.1

(* Blanc *)
let bl () =
  lc (); av (); bc (); delai 0.1

(* Trait *)
let tr () =
  av (); biiip (); lc (); av (); bc (); delai 0.1

(* Alphabet *)
let a () = pt (); tr (); bl ()
let b () = tr (); pt (); pt (); pt (); bl ()
let c () = tr (); pt (); tr (); pt (); bl ()
let d () = tr (); pt (); pt (); bl ()
let e () = pt (); bl ()
let f () = pt (); pt (); tr (); pt (); bl ()
let g () = tr (); tr (); pt (); bl ()
let h () = pt (); pt (); pt (); pt (); bl ()
let i () = pt (); pt (); bl ()
let j () = pt (); tr (); tr (); tr (); bl ()
let k () = tr (); pt (); tr (); bl ()
let l () = pt (); tr (); pt (); pt (); bl ()
let m () = tr (); tr (); bl ()
let n () = tr (); pt (); bl ()
let o () = tr (); tr (); tr (); bl ()
let p () = pt (); tr (); tr (); pt (); bl ()
let q () = tr (); tr (); pt (); tr (); bl ()
let r () = pt (); tr (); pt (); bl ()
let s () = pt (); pt (); pt (); bl ()
let t () = tr (); bl ()
let u () = pt (); pt (); tr (); bl ()
let v () = pt (); pt (); pt (); tr (); bl ()
let w () = pt (); tr (); tr (); bl ()
let x () = tr (); pt (); pt (); tr (); bl ()
let y () = tr (); pt (); tr (); tr (); bl ()
let z () = tr (); tr (); pt (); pt (); bl ()

(* Chiffres *)
let c1 () = pt (); tr (); tr (); tr (); tr (); bl ()
let c2 () = pt (); pt (); tr (); tr (); tr (); bl ()
let c3 () = pt (); pt (); pt (); tr (); tr (); bl ()
let c4 () = pt (); pt (); pt (); pt (); tr (); bl ()
let c5 () = pt (); pt (); pt (); pt (); pt (); bl ()
let c6 () = tr (); pt (); pt (); pt (); pt (); bl ()
let c7 () = tr (); tr (); pt (); pt (); pt (); bl ()
let c8 () = tr (); tr (); tr (); pt (); pt (); bl ()
let c9 () = tr (); tr (); tr (); tr (); pt (); bl ()
let c0 () = tr (); tr (); tr (); tr (); tr (); bl ()

(* Ponctuation *)
let point () =
  pt (); pt (); pt (); pt (); pt (); pt (); bl ()
let virgule () =
  pt (); tr (); pt (); tr (); pt (); tr (); bl ()
let pointVirgule () =
  tr (); tr (); tr (); pt (); pt (); pt (); bl ()
let deuxPoints () =
  tr (); pt (); tr (); pt (); tr (); pt (); bl ()
let pointDInterrogation () =
  pt (); pt (); tr (); tr (); pt (); pt (); bl ()
let pointDExclamation () =
  tr (); tr (); pt (); pt (); tr (); tr (); bl ()
let traitDUnion () =
  tr (); pt (); pt (); pt (); pt (); tr (); bl ()
let apostrophe () =
  tr (); tr (); tr (); tr (); bl ()
let barreDeDivision () =
  tr (); tr (); tr (); tr (); tr (); tr (); bl ()

(* Fin de mot *)
let finDeMot () =
  lc (); av (); bc (); delai 0.6

let erreur () =
  for i = 1 to 11 do
    pt ()
  done;
  bl ()

let debutTransmission () =
  ec 2; eh (); aLaLigne ();
  tr (); pt (); tr (); pt (); tr (); pt (); tr (); bl ()

let finTransmission () =
  pt (); tr (); pt (); tr (); pt (); tr (); pt (); bl ()

let () =
  debutTransmission ();
  a (); b (); c (); d (); e (); aLaLigne ();
  f (); g (); h (); i (); j (); k (); l (); aLaLigne ();
  m (); n (); o (); p (); q (); r (); s (); aLaLigne ();
  t (); u (); v (); w (); x (); y (); aLaLigne ();
  z (); c1 (); c2 (); c3 (); aLaLigne ();
  c4 (); c5 (); c6 (); c7 (); c8 (); aLaLigne ();
  c9 (); c0 (); point (); virgule (); aLaLigne ();
  pointVirgule (); deuxPoints (); pointDInterrogation ();
  pointDExclamation (); aLaLigne ();
  traitDUnion (); apostrophe (); barreDeDivision ();
  aLaLigne (); erreur (); finTransmission (); st ()
