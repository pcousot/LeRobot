open LibRobot

(* Écrire et faire entendre des signes en code Morse,
   avec retour automatique à la ligne *)

(* Passer au début de la ligne suivante. *)
let aLaLigne () =
  lc (); ag (); ps (); av (); pe (); av (); bc ()

(* Tester s'il est possible d'avancer n fois sans toucher
   le bord. *)
let testAvancer n =
  (* Essayer d'avancer (n - 1) fois sans toucher le
     bord *)
  lc ();
  for i = 1 to n - 1 do if not (tb ()) then av () done;
  if tb () then
    (* Oui, le n-ième av () sort du cadre :
       passer au début de la ligne suivante. *)
    aLaLigne ()
  else
    (* Non, revenir au point de départ dans la ligne
       courante. *)
    avf (- (n - 1));
  bc ()

(* Point *)
let pt () =
  testAvancer 1; dp (); bip (); lc (); av (); bc ();
  delai 0.2

(* Blanc *)
let bl () =
  testAvancer 1; lc (); av (); bc (); delai 0.2

(* Trait *)
let tr () =
  testAvancer 2; av (); biiip (); lc (); av (); bc ();
  delai 0.2

(* Tester qu'un symbole de p points, t traits et b blancs
   tient sur la ligne courante, sinon passer à la
   ligne. *)
let testFinDeLigne p t b =
  testAvancer (p + 2 * t + b)

(* Alphabet *)
let a () =
  testFinDeLigne 1 1 1; pt (); tr (); bl ()

let b () =
  testFinDeLigne 3 1 1; tr (); pt (); pt (); pt (); bl ()

let c () =
  testFinDeLigne 2 2 1; tr (); pt (); tr (); pt (); bl ()

let d () =
  testFinDeLigne 2 1 1; tr (); pt (); pt (); bl ()

let e () =
  testFinDeLigne 1 0 1; pt (); bl ()

let f () =
  testFinDeLigne 3 1 1; pt (); pt (); tr (); pt (); bl ()

let g () =
  testFinDeLigne 1 2 1; tr (); tr (); pt (); bl ()

let h () =
  testFinDeLigne 4 0 1; pt (); pt (); pt (); pt (); bl ()

let i () =
  testFinDeLigne 2 0 1; pt (); pt (); bl ()

let j () =
  testFinDeLigne 1 3 1; pt (); tr (); tr (); tr (); bl ()

let k () =
  testFinDeLigne 1 2 1; tr (); pt (); tr (); bl ()

let l () =
  testFinDeLigne 3 1 1; pt (); tr (); pt (); pt (); bl ()

let m () =
  testFinDeLigne 0 2 1; tr (); tr (); bl ()

let n () =
  testFinDeLigne 1 1 1; tr (); pt (); bl ()

let o () =
  testFinDeLigne 0 3 1; tr (); tr (); tr (); bl ()

let p () =
  testFinDeLigne 2 2 1; pt (); tr (); tr (); pt (); bl ()

let q () =
  testFinDeLigne 3 1 1; tr (); tr (); pt (); tr (); bl ()

let r () =
  testFinDeLigne 2 1 1; pt (); tr (); pt (); bl ()

let s () =
  testFinDeLigne 3 0 1; pt (); pt (); pt (); bl ()

let t () =
  testFinDeLigne 0 1 1; tr (); bl ()

let u () =
  testFinDeLigne 2 1 1; pt (); pt (); tr (); bl ()

let v () =
  testFinDeLigne 3 1 1; pt (); pt (); pt (); tr (); bl ()

let w () =
  testFinDeLigne 1 2 1; pt (); tr (); tr (); bl ()

let x () =
  testFinDeLigne 2 2 1; tr (); pt (); pt (); tr (); bl ()

let y () =
  testFinDeLigne 1 2 1; tr (); pt (); tr (); tr (); bl ()

let z () =
  testFinDeLigne 2 2 1; tr (); tr (); pt (); pt (); bl ()

(* chiffres *)
let c1 () =
  testFinDeLigne 1 4 1; pt (); tr (); tr (); tr (); tr ();
  bl ()

let c2 () =
  testFinDeLigne 2 3 1; pt (); pt (); tr (); tr (); tr ();
  bl ()

let c3 () =
  testFinDeLigne 2 3 1; pt (); pt (); pt (); tr (); tr ();
  bl ()

let c4 () =
  testFinDeLigne 4 1 1; pt (); pt (); pt (); pt (); tr ();
  bl ()

let c5 () =
  testFinDeLigne 5 0 1; pt (); pt (); pt (); pt (); pt ();
  bl ()

let c6 () =
  testFinDeLigne 4 1 1; tr (); pt (); pt (); pt (); pt ();
  bl ()

let c7 () =
  testFinDeLigne 3 2 1; tr (); tr (); pt (); pt (); pt ();
  bl ()

let c8 () =
  testFinDeLigne 2 3 1; tr (); tr (); tr (); pt (); pt ();
  bl ()

let c9 () =
  testFinDeLigne 1 4 1; tr (); tr (); tr (); tr (); pt ();
  bl ()

let c0 () =
  testFinDeLigne 5 0 1; tr (); tr (); tr (); tr (); tr ();
  bl ()

(* Point *)
let point () =
  testFinDeLigne 6 0 1; pt (); pt (); pt (); pt (); pt ();
  pt (); bl ()

(* Virgule *)
let virgule () =
  testFinDeLigne 3 3 1; pt (); tr (); pt (); tr (); pt ();
  tr (); bl ()

(* Point-virgule *)
let pointVirgule () =
  testFinDeLigne 3 3 1; tr (); tr (); tr (); pt (); pt ();
  pt (); bl ()

(* Deux-points *)
let deuxPoints () =
  testFinDeLigne 3 3 1; tr (); pt (); tr (); pt (); tr ();
  pt (); bl ()

(* Point d'interrogation *)
let pointDInterrogation () =
  testFinDeLigne 4 2 1; pt (); pt (); tr (); tr (); pt ();
  pt (); bl ()

(* Point d'exclamation *)
let pointDExclamation () =
  testFinDeLigne 2 4 1; tr (); tr (); pt (); pt (); tr ();
  tr (); bl ()

(* Trait d'union *)
let traitDUnion () =
  testFinDeLigne 4 5 1; tr (); pt (); pt (); pt (); pt ();
  tr (); bl ()

(* Apostrophe *)
let apostrophe () =
  testFinDeLigne 0 4 1; tr (); tr (); tr (); tr (); bl ()

(* Barre de division *)
let barreDeDivision () =
  testFinDeLigne 0 6 1; tr (); tr (); tr (); tr (); tr ();
  tr (); bl ()

(* Fin de mot *)
let finDeMot () =
  testFinDeLigne 0 0 1; lc (); av (); bc (); delai 0.6

let erreur () =
  testFinDeLigne 11 0 1; pt (); pt (); pt (); pt ();
  pt (); pt (); pt (); pt (); pt ();
  pt (); pt (); bl ()

let débutTransmission () =
  testFinDeLigne 4 3 1; tr (); pt (); tr (); pt (); tr ();
  pt (); tr (); bl ()

let finTransmission () =
  testFinDeLigne 4 3 1; pt (); tr (); pt (); tr (); pt ();
  tr (); pt (); bl ()

let () =
  ec 2; eh (); aLaLigne ();
  débutTransmission ();
  a (); b (); c (); d (); e (); f (); g (); h (); i ();
  j (); k (); l (); m (); n (); o ();
  p (); q (); r (); s (); t (); u (); v (); w (); x ();
  y (); z ();
  c1 (); c2 (); c3 (); c4 (); c5 (); c6 (); c7 (); c8 ();
  c9 (); c0 ();
  point (); virgule (); pointVirgule (); deuxPoints ();
  pointDInterrogation (); pointDExclamation ();
  traitDUnion (); apostrophe ();
  barreDeDivision (); erreur ();
  finTransmission ();
  st ()
