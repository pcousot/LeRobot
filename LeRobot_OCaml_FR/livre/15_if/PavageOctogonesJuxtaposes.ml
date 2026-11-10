open LibRobot

(* Pavage d'octogones juxtaposés *)

let tailleGrille = 6.

(* Placer le robot à gauche de la n-ième ligne de
   pavés *)
let ligne n =
  eh (); ag (); lc (); ps ();
  for k = 1 to n - 1 do avf 2 done;
  av (); pdt (); bc ()

(* Dessiner un pavé octogonal *)
let pave () =
  for c = 1 to 8 do phtd (); av () done

(* Laisser la place pour le cabochon carré *)
let placerADroite () =
  lc (); pqtd (); avf 4; pqtg (); bc ()

(* Dessiner une ligne de n pavés *)
let ligneDePaves n =
  for p = 1 to n do pave (); placerADroite () done

(* Décaler les débuts de lignes de rang impair *)
let decaler () =
  lc (); pqtd (); avf 2; pqtg (); bc ()

let pavage nbLignes nbColonnes =
  for l = 1 to nbLignes do
    ligne l;
    if l mod 2 = 1 then begin
      decaler (); ligneDePaves (nbColonnes - 1)
    end
    else ligneDePaves nbColonnes
  done

let () =
  lg tailleGrille;
  pavage 12 8;
  st ()
