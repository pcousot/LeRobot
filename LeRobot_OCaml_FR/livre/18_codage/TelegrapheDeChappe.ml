open LibRobot

(* Envoyer un message avec le télégraphe de Chappe *)

let dureeSignal = 2 (* secondes pour voir un signal *)
let longueurBras = 60 (* Longueur d'un bras articulé *)
(* Taille de la grille pour un bras en diagonale *)
let diagonale = 42

(* Position des bras extrêmes *)
let nord = 1
let nordEst = 2
let est = 3
let sudEst = 4
let sud = 5
let sudOuest = 6
let ouest = 7
let nordOuest = 8

(* Position du bras central *)
let sudNord = 1
let sudOuestNordEst = 2
let ouestEst = 3
let nordOuestSudEst = 4

let effacer () =
  delai (float_of_int dureeSignal); cf blanc; lg 60.; ec 6

let chappeCote d =
  if d = nord then begin
    pn (); lg (float_of_int longueurBras)
  end else if d = nordEst then begin
    pne (); lg (float_of_int diagonale)
  end else if d = est then begin
    pe (); lg (float_of_int longueurBras)
  end else if d = sudEst then begin
    pse (); lg (float_of_int diagonale)
  end else if d = sud then begin
    ps (); lg (float_of_int longueurBras)
  end else if d = sudOuest then begin
    psw (); lg (float_of_int diagonale)
  end else if d = ouest then begin
    pw (); lg (float_of_int longueurBras)
  end else if d = nordOuest then begin
    pnw (); lg (float_of_int diagonale)
  end;
  av ()

let chappe g m d =
  if m = sudNord then begin
    ce (); ps (); lg (float_of_int longueurBras); av ();
    chappeCote g;
    ce (); pn (); lg (float_of_int longueurBras); av ();
    chappeCote d
  end else if m = sudOuestNordEst then begin
    ce (); psw (); lg (float_of_int diagonale); av ();
    chappeCote g;
    ce (); pne (); lg (float_of_int diagonale); av ();
    chappeCote d
  end else if m = ouestEst then begin
    ce (); pw (); lg (float_of_int longueurBras); av ();
    chappeCote g;
    ce (); pe (); lg (float_of_int longueurBras); av ();
    chappeCote d
  end else if m = nordOuestSudEst then begin
    ce ();
    pnw (); lg (float_of_int diagonale); av ();
    chappeCote g;
    ce (); pse (); lg (float_of_int diagonale); av ();
    chappeCote d
  end;
  ce (); pn ();
  effacer ()

(* Lettres : am () pour A majuscule, a () pour a
   minuscule, etc. *)
let am () =
  chappe nord ouestEst nordEst

let a () =
  chappe nordOuest ouestEst nord

let bm () =
  chappe sudOuest sudOuestNordEst nordOuest

let b () =
  chappe nordEst nordOuestSudEst sudEst

let cm () =
  chappe sud ouestEst sud

let c () =
  chappe nord ouestEst nord

let dm () =
  chappe nord sudOuestNordEst nordEst

let d () =
  chappe nordOuest nordOuestSudEst nord

let em () =
  chappe est sudNord est

let e () =
  chappe ouest sudNord ouest

let fm () =
  chappe nord ouestEst nordEst

let f () =
  chappe nord ouestEst nordOuest

let gm () =
  chappe nord nordOuestSudEst nord

let g () =
  chappe nord sudOuestNordEst nord

let hm () =
  chappe ouest sudNord est

let h () =
  chappe est sudNord ouest

let im () =
  chappe sud sudNord sudEst

let i () =
  chappe sud sudNord sudOuest

let jm () =
  chappe sudOuest ouestEst sudEst

let j () =
  chappe nordOuest ouestEst nordEst

let km () =
  chappe sud sudNord est

let k () =
  chappe sud sudNord ouest

let lm () =
  chappe est sudNord nord

let l () =
  chappe ouest sudNord nord

let mm () =
  chappe nord sudOuestNordEst sudEst

let m () =
  chappe sudOuest nordOuestSudEst nord

let nm () =
  chappe sud nordOuestSudEst nordEst

let n () =
  chappe nordOuest sudOuestNordEst sud

let om () =
  chappe nord nordOuestSudEst est

let o () =
  chappe ouest sudOuestNordEst nord

let pm () =
  chappe nordOuest nordOuestSudEst sudOuest

let p () =
  chappe sudEst sudOuestNordEst nordEst

let qm () =
  chappe est sudNord nordOuest

let q () =
  chappe ouest sudNord nordEst

let rm () =
  chappe sud sudNord est

let r () =
  chappe sud sudNord ouest

let sm () =
  chappe nordEst nordOuestSudEst sudOuest

let s () =
  chappe sudEst sudOuestNordEst nordOuest

let tm () =
  chappe sudOuest sudOuestNordEst sud

let t () =
  chappe sud nordOuestSudEst sudEst

let um () =
  chappe sud nordOuestSudEst ouest

let u () =
  chappe est sudOuestNordEst sud

let vm () =
  chappe sud ouestEst sudOuest

let v () =
  chappe sudEst ouestEst sud

let wm () =
  chappe sudOuest nordOuestSudEst sudOuest

let w () =
  chappe sudEst sudOuestNordEst sudEst

let xm () =
  chappe nordOuest sudOuestNordEst ouest

let x () =
  chappe est nordOuestSudEst nordEst

let ym () =
  chappe sud sudOuestNordEst sud

let y () =
  chappe sud nordOuestSudEst sud

let zm () =
  chappe nordOuest sudOuestNordEst nordOuest

let z () =
  chappe nordEst nordOuestSudEst nordEst

(* Chiffres *)
let c0 () =
  chappe sudEst ouestEst nord

let c1 () =
  chappe ouest ouestEst est

let c2 () =
  chappe sud sudNord nord

let c3 () =
  chappe sud sudNord nordEst

let c4 () =
  chappe nordEst ouestEst nordOuest

let c5 () =
  chappe nordEst ouestEst sud

let c6 () =
  chappe sud nordOuestSudEst sudOuest

let c7 () =
  chappe sudEst sudOuestNordEst sud

let c8 () =
  chappe sudEst ouestEst sudOuest

let c9 () =
  chappe nord sudOuestNordEst nordOuest

(* Ponctuation . *)
let point () =
  chappe sud sudNord ouest

(* , *)
let virgule () =
  chappe nordOuest ouestEst est

(* ; *)
let pointVirgule () =
  chappe ouest ouestEst nordEst

(* : *)
let deuxPoints () =
  chappe sud sudNord est

(* ? *)
let pointDInterrogation () =
  chappe sudOuest ouestEst nordEst

(* ! *)
let pointDExclamation () =
  chappe nordOuest ouestEst sudEst

(* ( *)
let parentheseGauche () =
  chappe ouest sudNord nord

(* ) *)
let parentheseDroite () =
  chappe est sudNord nord

(* Blanc *)
let blanc () =
  chappe nord nordOuestSudEst nord

let () =
  effacer ();
  pm (); a (); r (); i (); s (); e (); s (); t (); t ();
  r (); a (); n (); q (); u (); i ();
  l (); l (); e (); e (); t (); l (); e (); s (); b ();
  o (); n (); s ();
  c (); i (); t (); o (); y (); e (); n (); s (); s ();
  o (); n (); t (); c (); o (); n ();
  t (); e (); n (); t (); s (); point ()
