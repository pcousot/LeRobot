open LibRobot

(* Dessiner l'alphabet du télégraphe optique de Chappe *)

let epaisseurSignal = 2
let tailleGrille = 5
let longueurBras = 5 (* Longueur d'un bras articulé *)
(* Taille de la grille pour un bras en diagonale *)
let diagonale = 4

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

let code c =
  (* Rectangle autour du signal *)
  lg (float_of_int tailleGrille); ec 1;
  pe (); avf 6; pn (); avf 9; pw (); avf 6; ps (); avf 9;
  translater (3, 1); ecrire c; translater (0, 5);
  ec epaisseurSignal

let effacer () =
  lg (float_of_int tailleGrille); translater (3, -6)

let chappeCote d =
  if d = nord then begin
    pn (); lg (float_of_int longueurBras); av ();
    translater (0, -1)
  end else if d = nordEst then begin
    pne (); lg (float_of_int diagonale); av ();
    translater (-1, -1)
  end else if d = est then begin
    pe (); lg (float_of_int longueurBras); av ();
    translater (-1, 0)
  end else if d = sudEst then begin
    pse (); lg (float_of_int diagonale); av ();
    translater (-1, 1)
  end else if d = sud then begin
    ps (); lg (float_of_int longueurBras); av ();
    translater (0, 1)
  end else if d = sudOuest then begin
    psw (); lg (float_of_int diagonale); av ();
    translater (1, 1)
  end else if d = ouest then begin
    pw (); lg (float_of_int longueurBras); av ();
    translater (1, 0)
  end else if d = nordOuest then begin
    pnw (); lg (float_of_int diagonale); av ();
    translater (1, -1)
  end

let chappe g m d =
  if m = sudNord then begin
    ps (); lg (float_of_int longueurBras); av ();
    chappeCote g;
    lg (float_of_int longueurBras); translater (0, 1);
    pn (); lg (float_of_int longueurBras); av ();
    chappeCote d;
    lg (float_of_int longueurBras); translater (0, -1)
  end else if m = sudOuestNordEst then begin
    psw (); lg (float_of_int diagonale); av ();
    chappeCote g; lg (float_of_int diagonale);
    translater (1, 1);
    pne (); lg (float_of_int diagonale); av ();
    chappeCote d; lg (float_of_int diagonale);
    translater (-1, -1)
  end else if m = ouestEst then begin
    pw (); lg (float_of_int longueurBras); av ();
    chappeCote g;
    lg (float_of_int longueurBras); translater (1, 0);
    pe (); lg (float_of_int longueurBras); av ();
    chappeCote d;
    lg (float_of_int longueurBras); translater (-1, 0)
  end else if m = nordOuestSudEst then begin
    pnw (); lg (float_of_int diagonale); av ();
    chappeCote g; lg (float_of_int diagonale);
    translater (1, -1);
    pse (); lg (float_of_int diagonale); av ();
    chappeCote d; lg (float_of_int diagonale);
    translater (-1, 1)
  end;
  pn ();
  effacer ()

(* Lettres : am () pour A majuscule, a () pour a
   minuscule, etc. *)
let am () =
  code "A"; chappe nord ouestEst nordEst

let a () =
  code "a"; chappe nordOuest ouestEst nord

let bm () =
  code "B"; chappe sudOuest sudOuestNordEst nordOuest

let b () =
  code "b"; chappe nordEst nordOuestSudEst sudEst

let cm () =
  code "C"; chappe sud ouestEst sud

let c () =
  code "c"; chappe nord ouestEst nord

let dm () =
  code "D"; chappe nord sudOuestNordEst nordEst

let d () =
  code "d"; chappe nordOuest nordOuestSudEst nord

let em () =
  code "E"; chappe est sudNord est

let e () =
  code "e"; chappe ouest sudNord ouest

let fm () =
  code "F"; chappe nord ouestEst nordEst

let f () =
  code "f"; chappe nord ouestEst nordOuest

let gm () =
  code "G"; chappe nord nordOuestSudEst nord

let g () =
  code "g"; chappe nord sudOuestNordEst nord

let hm () =
  code "H"; chappe ouest sudNord est

let h () =
  code "h"; chappe est sudNord ouest

let im () =
  code "I"; chappe sud sudNord sudEst

let i () =
  code "i"; chappe sud sudNord sudOuest

let jm () =
  code "J"; chappe sudOuest ouestEst sudEst

let j () =
  code "j"; chappe nordOuest ouestEst nordEst

let km () =
  code "K"; chappe sud sudNord est

let k () =
  code "k"; chappe sud sudNord ouest

let lm () =
  code "L"; chappe est sudNord nord

let l () =
  code "l"; chappe ouest sudNord nord

let mm () =
  code "M"; chappe nord sudOuestNordEst sudEst

let m () =
  code "m"; chappe sudOuest nordOuestSudEst nord

let nm () =
  code "N"; chappe sud nordOuestSudEst nordEst

let n () =
  code "n"; chappe nordOuest sudOuestNordEst sud

let om () =
  code "O"; chappe nord nordOuestSudEst est

let o () =
  code "o"; chappe ouest sudOuestNordEst nord

let pm () =
  code "P"; chappe nordOuest nordOuestSudEst sudOuest

let p () =
  code "p"; chappe sudEst sudOuestNordEst nordEst

let qm () =
  code "Q"; chappe est sudNord nordOuest

let q () =
  code "q"; chappe ouest sudNord nordEst

let rm () =
  code "R"; chappe sud sudNord est

let r () =
  code "r"; chappe sud sudNord ouest

let sm () =
  code "S"; chappe nordEst nordOuestSudEst sudOuest

let s () =
  code "s"; chappe sudEst sudOuestNordEst nordOuest

let tm () =
  code "T"; chappe sudOuest sudOuestNordEst sud

let t () =
  code "t"; chappe sud nordOuestSudEst sudEst

let um () =
  code "U"; chappe sud nordOuestSudEst ouest

let u () =
  code "u"; chappe est sudOuestNordEst sud

let vm () =
  code "V"; chappe sud ouestEst sudOuest

let v () =
  code "v"; chappe sudEst ouestEst sud

let wm () =
  code "W"; chappe sudOuest nordOuestSudEst sudOuest

let w () =
  code "w"; chappe sudEst sudOuestNordEst sudEst

let xm () =
  code "X"; chappe nordOuest sudOuestNordEst ouest

let x () =
  code "x"; chappe est nordOuestSudEst nordEst

let ym () =
  code "Y"; chappe sud sudOuestNordEst sud

let y () =
  code "y"; chappe sud nordOuestSudEst sud

let zm () =
  code "Z"; chappe nordOuest sudOuestNordEst nordOuest

let z () =
  code "z"; chappe nordEst nordOuestSudEst nordEst

(* Chiffres *)
let c0 () =
  code "0"; chappe sudEst ouestEst nord

let c1 () =
  code "1"; chappe ouest ouestEst est

let c2 () =
  code "2"; chappe sud sudNord nord

let c3 () =
  code "3"; chappe sud sudNord nordEst

let c4 () =
  code "4"; chappe nordEst ouestEst nordOuest

let c5 () =
  code "5"; chappe nordEst ouestEst sud

let c6 () =
  code "6"; chappe sud nordOuestSudEst sudOuest

let c7 () =
  code "7"; chappe sudEst sudOuestNordEst sud

let c8 () =
  code "8"; chappe sudEst ouestEst sudOuest

let c9 () =
  code "9"; chappe nord sudOuestNordEst nordOuest

(* Ponctuation *)
let point () =
  code "."; chappe sud sudNord ouest

let virgule () =
  code ","; chappe nordOuest ouestEst est

let pointVirgule () =
  code ";"; chappe ouest ouestEst nordEst

let deuxPoints () =
  code ":"; chappe sud sudNord est

let pointDInterrogation () =
  code "?"; chappe sudOuest ouestEst nordEst

let pointDExclamation () =
  code "!"; chappe nordOuest ouestEst sudEst

let parentheseGauche () =
  code "("; chappe ouest sudNord nord

let parentheseDroite () =
  code ")"; chappe est sudNord nord

let blanc () =
  code " "; chappe nord nordOuestSudEst nord

let aLaLigne () =
  lg (float_of_int tailleGrille); ag ();
  translater (0, -9)

let () =
  policeTexte geneva; tailleTexte 9; lg 1.; eh ();
  aLaLigne ();
  am (); a (); bm (); b (); cm (); c (); dm (); d ();
  em (); e (); fm (); f (); aLaLigne ();
  gm (); g (); hm (); h (); im (); i (); jm (); j ();
  km (); k (); lm (); l (); aLaLigne ();
  mm (); m (); nm (); n (); om (); o (); pm (); p ();
  qm (); q (); rm (); r (); aLaLigne ();
  sm (); s (); tm (); t (); um (); u (); vm (); v ();
  wm (); w (); xm (); x (); aLaLigne ();
  ym (); y (); zm (); z (); c0 (); c1 (); c2 (); c3 ();
  c4 (); c5 (); c6 (); c7 ();
  aLaLigne ();
  c8 (); c9 (); point (); virgule (); pointVirgule ();
  deuxPoints (); pointDInterrogation ();
  pointDExclamation ();
  parentheseGauche (); parentheseDroite (); st ()
