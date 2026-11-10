open LibRobot

(* Étoile fractale de Sedgewick *)

let aucun = 0
let nW = 1
let nE = 2
let sE = 3
let sW = 4

(* Dessiner un carré centré en (x, y) de longueur de
   côté 2 * l et auquel il manque le coin cM *)
let carreDernierNiveau x y l cM =
  deplacer (x - l, y); bc ();
  for i = nW to sW do
    if i = cM then lc ();
    avf l; pqtd (); avf l;
    bc ()
  done

(* Dessiner le milieu des côtés d'un carré centré en
   (x, y) de longueur de côté 2 * l et auquel il manque
   le coin cM *)
let carreAvantDernierNiveau x y l cM =
  deplacer (x - l, y);
  for i = nW to sW do
    if i = cM then lc ()
    else bc ();
    avf (l / 2);
    lc (); avf (l / 2);
    pqtd (); avf (l / 2);
    if i = cM then lc ()
    else bc ();
    avf (l / 2)
  done

let carre x y l cM =
  if l / 2 > 0 then carreAvantDernierNiveau x y l cM
  else carreDernierNiveau x y l cM

let rec etoile x y l cM =
  if l > 0 then begin
    if cM <> nW then etoile (x - l) (y + l) (l / 2) sE;
    if cM <> nE then etoile (x + l) (y + l) (l / 2) sW;
    if cM <> sW then etoile (x - l) (y - l) (l / 2) nE;
    if cM <> sE then etoile (x + l) (y - l) (l / 2) nW;
    carre x y l cM
  end

let () =
  lg 3.; etoile 0 0 16 aucun; st ()
