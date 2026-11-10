open LibRobot

(* Écrire des signes en code Morse avec leur
   traduction, en les faisant entendre *)

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
  if tb () then begin
    (* Oui, le n-ième av () sort du cadre :
       passer au début de la ligne suivante. *)
    aLaLigne (); aLaLigne ()
  end else
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

(* Écrire le texte l (complété par un blanc si sa
   longueur est impaire) et avancer après lui *)
let ecr l =
  let l =
    if String.length l mod 2 = 1 then l ^ " " else l in
  testAvancer (String.length l / 2); ecrire l;
  lc (); avf (String.length l / 2); bc ()

(* Tester qu'un symbole de p points, t traits, b blancs et
   c caractères tient sur la ligne courante, sinon passer
   à la ligne. *)
let testFinDeLigne p t b c =
  if c mod 2 = 1 then
    testAvancer (p + 2 * t + b + (c + 1) / 2)
  else
    testAvancer (p + 2 * t + b + c / 2)

(* Alphabet *)
let a () =
  testFinDeLigne 1 1 1 3; ecr "A :"; pt (); tr (); bl ()

let b () =
  testFinDeLigne 3 1 1 3; ecr "B :"; tr (); pt (); pt ();
  pt (); bl ()

let c () =
  testFinDeLigne 2 2 1 3; ecr "C :"; tr (); pt (); tr ();
  pt (); bl ()

let d () =
  testFinDeLigne 1 2 1 3; ecr "D :"; tr (); pt (); pt ();
  bl ()

let e () =
  testFinDeLigne 1 0 1 3; ecr "E :"; pt (); bl ()

let f () =
  testFinDeLigne 3 1 1 3; ecr "F :"; pt (); pt (); tr ();
  pt (); bl ()

let g () =
  testFinDeLigne 1 2 1 3; ecr "G :"; tr (); tr (); pt ();
  bl ()

let h () =
  testFinDeLigne 4 0 1 3; ecr "H :"; pt (); pt (); pt ();
  pt (); bl ()

let i () =
  testFinDeLigne 2 0 1 3; ecr "I :"; pt (); pt (); bl ()

let j () =
  testFinDeLigne 1 3 1 3; ecr "J :"; pt (); tr (); tr ();
  tr (); bl ()

let k () =
  testFinDeLigne 1 2 1 3; ecr "K :"; tr (); pt (); tr ();
  bl ()

let l () =
  testFinDeLigne 3 1 1 3; ecr "L :"; pt (); tr (); pt ();
  pt (); bl ()

let m () =
  testFinDeLigne 1 2 1 3; ecr "M :"; tr (); tr (); bl ()

let n () =
  testFinDeLigne 0 1 1 3; ecr "N :"; tr (); pt (); bl ()

let o () =
  testFinDeLigne 1 3 1 3; ecr "O :"; tr (); tr (); tr ();
  bl ()

let p () =
  testFinDeLigne 2 2 1 3; ecr "P :"; pt (); tr (); tr ();
  pt (); bl ()

let q () =
  testFinDeLigne 1 3 1 3; ecr "Q :"; tr (); tr (); pt ();
  tr (); bl ()

let r () =
  testFinDeLigne 2 1 1 3; ecr "R :"; pt (); tr (); pt ();
  bl ()

let s () =
  testFinDeLigne 3 0 1 3; ecr "S :"; pt (); pt (); pt ();
  bl ()

let t () =
  testFinDeLigne 0 1 1 3; ecr "T :"; tr (); bl ()

let u () =
  testFinDeLigne 2 1 1 3; ecr "U :"; pt (); pt (); tr ();
  bl ()

let v () =
  testFinDeLigne 3 1 1 3; ecr "V :"; pt (); pt (); pt ();
  tr (); bl ()

let w () =
  testFinDeLigne 1 2 1 3; ecr "W :"; pt (); tr (); tr ();
  bl ()

let x () =
  testFinDeLigne 2 2 1 3; ecr "X :"; tr (); pt (); pt ();
  tr (); bl ()

let y () =
  testFinDeLigne 1 3 1 3; ecr "Y :"; tr (); pt (); tr ();
  tr (); bl ()

let z () =
  testFinDeLigne 2 2 1 3; ecr "Z :"; tr (); tr (); pt ();
  pt (); bl ()

(* chiffres *)
let c1 () =
  testFinDeLigne 1 4 1 3; ecr "1 :"; pt (); tr (); tr ();
  tr (); tr (); bl ()

let c2 () =
  testFinDeLigne 2 3 1 3; ecr "2 :"; pt (); pt (); tr ();
  tr (); tr (); bl ()

let c3 () =
  testFinDeLigne 3 2 1 3; ecr "3 :"; pt (); pt (); pt ();
  tr (); tr (); bl ()

let c4 () =
  testFinDeLigne 4 1 1 3; ecr "4 :"; pt (); pt (); pt ();
  pt (); tr (); bl ()

let c5 () =
  testFinDeLigne 5 0 1 3; ecr "5 :"; pt (); pt (); pt ();
  pt (); pt (); bl ()

let c6 () =
  testFinDeLigne 4 1 1 3; ecr "6 :"; tr (); pt (); pt ();
  pt (); pt (); bl ()

let c7 () =
  testFinDeLigne 3 2 1 3; ecr "7 :"; tr (); tr (); pt ();
  pt (); pt (); bl ()

let c8 () =
  testFinDeLigne 2 3 1 3; ecr "8 :"; tr (); tr (); tr ();
  pt (); pt (); bl ()

let c9 () =
  testFinDeLigne 1 4 1 3; ecr "9 :"; tr (); tr (); tr ();
  tr (); pt (); bl ()

let c0 () =
  testFinDeLigne 0 5 1 3; ecr "0 :"; tr (); tr (); tr ();
  tr (); tr (); bl ()

(* Point *)
let point () =
  testFinDeLigne 6 0 1 3; ecr ". :"; pt (); pt (); pt ();
  pt (); pt (); pt (); bl ()

(* Virgule *)
let virgule () =
  testFinDeLigne 3 3 1 3; ecr ", :"; pt (); tr (); pt ();
  tr (); pt (); tr (); bl ()

(* Point-virgule *)
let pointVirgule () =
  testFinDeLigne 3 3 1 3; ecr "; :"; tr (); tr (); tr ();
  pt (); pt (); pt (); bl ()

(* Deux-points *)
let deuxPoints () =
  testFinDeLigne 3 3 1 3; ecr ": :"; tr (); pt (); tr ();
  pt (); tr (); pt (); bl ()

(* Point d'interrogation *)
let pointDInterrogation () =
  testFinDeLigne 4 2 1 3; ecr "? :"; pt (); pt (); tr ();
  tr (); pt (); pt (); bl ()

(* Point d'exclamation *)
let pointDExclamation () =
  testFinDeLigne 2 4 1 3; ecr "! :"; tr (); tr (); pt ();
  pt (); tr (); tr (); bl ()

(* Trait d'union *)
let traitDUnion () =
  testFinDeLigne 4 5 1 3; ecr "- :"; tr (); pt (); pt ();
  pt (); pt (); tr (); bl ()

(* Apostrophe *)
let apostrophe () =
  testFinDeLigne 0 4 1 3; ecr "' :"; tr (); tr (); tr ();
  tr (); bl ()

(* Barre de division *)
let barreDeDivision () =
  testFinDeLigne 0 6 1 3; ecr "/ :"; tr (); tr (); tr ();
  tr (); tr (); tr (); bl ()

(* Fin de mot *)
let finDeMot () =
  testFinDeLigne 0 0 1 0; lc (); av (); bc (); delai 0.6

let erreur () =
  testFinDeLigne 11 0 1 8; ecr "Erreur :"; pt (); pt ();
  pt (); pt (); pt (); pt (); pt ();
  pt (); pt (); pt (); pt (); bl ()

let débutTransmission () =
  testFinDeLigne 4 3 1 23; ecr "Début de transmission :";
  tr (); pt (); tr (); pt (); tr ();
  pt (); tr (); bl ()

let finTransmission () =
  testFinDeLigne 4 3 1 21; ecr "Fin de transmission :";
  pt (); tr (); pt (); tr (); pt ();
  tr (); pt (); bl ()

let () =
  ec 2; eh (); lgY 9.; aLaLigne ();
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
