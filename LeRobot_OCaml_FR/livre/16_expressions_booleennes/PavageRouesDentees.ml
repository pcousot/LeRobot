open LibRobot

(* Dessiner un pavage de roues dentées *)

let tailleGrille = 10
let nombreDeMotifsParLigne = 7
let nombreDeLignes = 14

(* Avancer le robot tout droit, jusqu'à deux carreaux
   du bord nord du cadre. *)
let enHaut () =
  eh (); pdt (); avf 2

(* Dessiner le motif du pavage *)
let roueDentee () =
  for i = 1 to 4 do
    av (); pqtd (); vd (); pqtg (); vg (); pqtg ()
  done

let pavage () =
  for l = 1 to nombreDeLignes do
    lc (); enHaut (); ag ();
    avf l; pqtg (); av ();
    (* Décalage en début de ligne *)
    if l mod 5 = 2 then
      avf 2
    else if l mod 5 = 3 then
      avf 4
    else if l mod 5 = 4 then
      av ()
    else if l mod 5 = 0 then
      avf 3;
    (* Dessiner une ligne de motifs *)
    pqtg (); bc ();
    for j = 1 to nombreDeMotifsParLigne - 1 do
      roueDentee ();
      translater (5, 0)
    done;
    roueDentee ()
  done

let () =
  lg (float_of_int tailleGrille); pavage (); st ()
