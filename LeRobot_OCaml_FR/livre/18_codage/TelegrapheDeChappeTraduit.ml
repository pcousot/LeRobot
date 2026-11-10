open LibRobot

(* Envoyer un message avec le télégraphe de Chappe,
   avec sa traduction *)

let dureeSignal = 1.5 (* secondes pour voir un signal *)
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
  delai dureeSignal; cf blanc; lg 60.; ec 6

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
  message "A"; chappe nord ouestEst nordEst

let a () =
  message "a"; chappe nordOuest ouestEst nord

let bm () =
  message "B"; chappe sudOuest sudOuestNordEst nordOuest

let b () =
  message "b"; chappe nordEst nordOuestSudEst sudEst

let cm () =
  message "C"; chappe sud ouestEst sud

let c () =
  message "c"; chappe nord ouestEst nord

let dm () =
  message "D"; chappe nord sudOuestNordEst nordEst

let d () =
  message "d"; chappe nordOuest nordOuestSudEst nord

let em () =
  message "E"; chappe est sudNord est

let e () =
  message "e"; chappe ouest sudNord ouest

let fm () =
  message "F"; chappe nord ouestEst nordEst

let f () =
  message "f"; chappe nord ouestEst nordOuest

let gm () =
  message "G"; chappe nord nordOuestSudEst nord

let g () =
  message "g"; chappe nord sudOuestNordEst nord

let hm () =
  message "H"; chappe ouest sudNord est

let h () =
  message "h"; chappe est sudNord ouest

let im () =
  message "I"; chappe sud sudNord sudEst

let i () =
  message "i"; chappe sud sudNord sudOuest

let jm () =
  message "J"; chappe sudOuest ouestEst sudEst

let j () =
  message "j"; chappe nordOuest ouestEst nordEst

let km () =
  message "K"; chappe sud sudNord est

let k () =
  message "k"; chappe sud sudNord ouest

let lm () =
  message "L"; chappe est sudNord nord

let l () =
  message "l"; chappe ouest sudNord nord

let mm () =
  message "M"; chappe nord sudOuestNordEst sudEst

let m () =
  message "m"; chappe sudOuest nordOuestSudEst nord

let nm () =
  message "N"; chappe sud nordOuestSudEst nordEst

let n () =
  message "n"; chappe nordOuest sudOuestNordEst sud

let om () =
  message "O"; chappe nord nordOuestSudEst est

let o () =
  message "o"; chappe ouest sudOuestNordEst nord

let pm () =
  message "P"; chappe nordOuest nordOuestSudEst sudOuest

let p () =
  message "p"; chappe sudEst sudOuestNordEst nordEst

let qm () =
  message "Q"; chappe est sudNord nordOuest

let q () =
  message "q"; chappe ouest sudNord nordEst

let rm () =
  message "R"; chappe sud sudNord est

let r () =
  message "r"; chappe sud sudNord ouest

let sm () =
  message "S"; chappe nordEst nordOuestSudEst sudOuest

let s () =
  message "s"; chappe sudEst sudOuestNordEst nordOuest

let tm () =
  message "T"; chappe sudOuest sudOuestNordEst sud

let t () =
  message "t"; chappe sud nordOuestSudEst sudEst

let um () =
  message "U"; chappe sud nordOuestSudEst ouest

let u () =
  message "u"; chappe est sudOuestNordEst sud

let vm () =
  message "V"; chappe sud ouestEst sudOuest

let v () =
  message "v"; chappe sudEst ouestEst sud

let wm () =
  message "W"; chappe sudOuest nordOuestSudEst sudOuest

let w () =
  message "w"; chappe sudEst sudOuestNordEst sudEst

let xm () =
  message "X"; chappe nordOuest sudOuestNordEst ouest

let x () =
  message "x"; chappe est nordOuestSudEst nordEst

let ym () =
  message "Y"; chappe sud sudOuestNordEst sud

let y () =
  message "y"; chappe sud nordOuestSudEst sud

let zm () =
  message "Z"; chappe nordOuest sudOuestNordEst nordOuest

let z () =
  message "z"; chappe nordEst nordOuestSudEst nordEst

(* Chiffres *)
let c0 () =
  message "0"; chappe sudEst ouestEst nord

let c1 () =
  message "1"; chappe ouest ouestEst est

let c2 () =
  message "2"; chappe sud sudNord nord

let c3 () =
  message "3"; chappe sud sudNord nordEst

let c4 () =
  message "4"; chappe nordEst ouestEst nordOuest

let c5 () =
  message "5"; chappe nordEst ouestEst sud

let c6 () =
  message "6"; chappe sud nordOuestSudEst sudOuest

let c7 () =
  message "7"; chappe sudEst sudOuestNordEst sud

let c8 () =
  message "8"; chappe sudEst ouestEst sudOuest

let c9 () =
  message "9"; chappe nord sudOuestNordEst nordOuest

(* Ponctuation *)
let point () =
  message "."; chappe sud sudNord ouest

let virgule () =
  message ","; chappe nordOuest ouestEst est

let pointVirgule () =
  message ";"; chappe ouest ouestEst nordEst

let deuxPoints () =
  message ":"; chappe sud sudNord est

let pointDInterrogation () =
  message "?"; chappe sudOuest ouestEst nordEst

let pointDExclamation () =
  message "!"; chappe nordOuest ouestEst sudEst

let parentheseGauche () =
  message "("; chappe ouest sudNord nord

let parentheseDroite () =
  message ")"; chappe est sudNord nord

let blanc () =
  message "' '"; chappe nord nordOuestSudEst nord

let () =
  effacer (); am (); a (); bm (); b (); cm (); c ();
  dm (); d (); em (); e (); fm (); f ();
  gm (); g (); hm (); h (); im (); i ();
  jm (); j (); km (); k (); lm (); l (); mm (); m ();
  nm (); n (); om (); o (); pm (); p ();
  qm (); q (); rm (); r (); sm (); s (); tm (); t ();
  um (); u (); vm (); v (); wm (); w (); xm (); x ();
  ym (); y (); zm (); z (); c0 ();
  c1 (); c2 (); c3 (); c4 (); c5 ();
  c6 (); c7 (); c8 (); c9 (); point (); virgule ();
  pointVirgule (); deuxPoints ();
  pointDInterrogation (); pointDExclamation ();
  parentheseGauche (); parentheseDroite ()
