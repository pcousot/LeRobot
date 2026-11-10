open LibRobot

(* Pavage de cubes de A. H. Christie, 'Pattern design.
   An introduction to the study of formal ornament',
   Clarendon press, Oxford, 1929 ; réimpression Dover,
   New York, 1969. *)

let longueurCote = 13.
let angle = 30.
let nbLignes = 7
let nbColonnes = 7

let cube () =
  pne (); av (); pqtd (); av (); pqtd (); av (); pqtd ();
  av ();
  ps (); avf 2; phtg (); av (); p3htg (); avf 2;
  phtd (); peindre (); pqtd (); cc violet; peindre ();
  cc noir; phtd ();
  avf 2; p3htg (); av (); phtg (); avf 2

let pavage () =
  lgRT (longueurCote, angle);
  eh ();
  for i = 1 to nbLignes do
    ag (); lc ();
    if i mod 2 = 1 then begin
      ps (); avf 2; pse (); av ()
    end else begin
      pse (); av (); ps (); av (); psw (); av ()
    end;
    bc ();
    for j = 1 to nbColonnes do
      cube ()
    done
  done

let () =
  pavage (); st ()
