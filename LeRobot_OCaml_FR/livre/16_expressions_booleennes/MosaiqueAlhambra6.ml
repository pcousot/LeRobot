open LibRobot

(* Dessiner une mosaïque de l'Alhambra *)

let tailleDeGrille = 8 (* doit être pair *)
let nombreDeLignes = 4
let nombreDeColonnes = 8

let demiMotif () =
  phtd (); av (); phtd (); av (); pqtg (); av ();
  lg (float_of_int (tailleDeGrille / 2));
  p3htd (); av (); pqtg (); av ();
  lg (float_of_int tailleDeGrille);
  p3htd (); av (); pqtg (); av (); phtd (); av ();
  p3htd (); avf 2;
  lg (float_of_int (tailleDeGrille / 2));
  phtg (); av (); pqtd (); av ();
  lg (float_of_int tailleDeGrille); phtg (); avf 2;
  (* Peindre *)
  avf (-1); phtg ();
  if tsw () || tne () then
    cc jaune
  else
    cc indigo;
  peindre ();
  cc noir; phtd (); av ();
  (* Remettre le robot dans l'orientation initiale *)
  pqtd ()

let motif () =
  demiMotif ();
  lc (); pqtd (); avf 5; pqtd (); av (); bc ();
  demiMotif ()

let motifDouble () =
  motif ();
  (* Motif suivant *)
  lc (); phtg (); avf 2; p3htd (); bc ();
  motif ()

let () =
  lg (float_of_int tailleDeGrille); eh (); ag ();
  translater (1, -3);
  for j = 1 to nombreDeLignes do
    for i = 1 to nombreDeColonnes / 2 do
      motifDouble ();
      (* Motif double suivant *)
      lc (); phtd (); avf 2; p3htg (); bc ()
    done;
    (* Ligne suivante *)
    if j mod 2 = 1 then begin
      lc (); pdt (); avf 6; bc ()
    end else begin
      lc (); avf 4; pdt (); bc ()
    end
  done;
  st ()
