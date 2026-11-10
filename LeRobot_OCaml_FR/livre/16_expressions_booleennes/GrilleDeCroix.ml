open LibRobot

(* Dessiner une grille de croix *)

let croix () =
  av (); pqtg (); av ();
  ec 3; dp (); ec 1;
  pdt (); avf 2; pdt ();
  ec 3; dp (); ec 1;
  av (); pqtd (); av ()

let colonneDeCroix n =
  for l = 1 to n do
    croix ()
  done

let enBasColonneSuivante () =
  lc (); eb (); pqtd (); avf 2; pqtg (); bc ()

let grille nbLignes nbColonnes =
  for c = 1 to nbColonnes do
    enBasColonneSuivante ();
    if c mod 2 = 1 then begin
      av (); colonneDeCroix nbLignes; av ()
    end else
      colonneDeCroix (nbLignes + 1)
  done

let () =
  ag (); grille 6 7; st ()
